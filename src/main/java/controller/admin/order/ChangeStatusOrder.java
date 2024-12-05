package controller.admin.order;

import database.OrderDAO;
import database.OrderDetailDAO;
import database.StatusOrderDAO;
import model.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

@WebServlet(name = "ChangeStatusOrder", value = "/ChangeStatusOrder")
public class ChangeStatusOrder extends HttpServlet {
    OrderDAO orderDAO = new OrderDAO();

    ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
    @Override
    public void init() throws ServletException {
        super.init();
        scheduleAllPendingOrders();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Do nothing for GET request
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        orderDAO = new OrderDAO(request);
        try {
            String orderIdStr = request.getParameter("orderId");
            String statusStr = request.getParameter("status");

            if (orderIdStr == null || statusStr == null) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("Missing orderId or status");
                return;
            }

            int orderId = Integer.parseInt(orderIdStr);
            int status = Integer.parseInt(statusStr);


            orderDAO.updateStatusOrder(orderId, new StatusOrder(status));
            if (status == 3) {
                scheduleStatusUpdate(orderId);
            }
            response.setStatus(HttpServletResponse.SC_OK);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Invalid orderId or status");
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Internal server error");
        }
    }


    private void scheduleStatusUpdate(int orderId) {
        StatusOrder giaoThanhCong = new StatusOrder(4, "Giao thành công");
        String reason = "Đơn hàng đã giao thành công.";

        scheduler.schedule(() -> {
            orderDAO.updateStatusOrder(orderId, giaoThanhCong);
            Order order = orderDAO.selectById(orderId);
            order.setStatus(giaoThanhCong);
        }, 1, TimeUnit.MINUTES);
    }
    private void scheduleAllPendingOrders() {
        List<Order> orders = orderDAO.selectOrderByStatus(3);
        for (Order order : orders) {
            scheduleStatusUpdate(order.getOrderId());
        }
    }

}

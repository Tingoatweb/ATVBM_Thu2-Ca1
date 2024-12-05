package controller.user.page;

import database.OrderDAO;
import database.OrderDetailDAO;
import model.Order;
import model.OrderDetail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderDetail", value = "/OrderDetail")
public class OrderDetailPage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idOrderString = request.getParameter("OrderId");
        int idOrder = Integer.parseInt(idOrderString);
        OrderDAO orderDAO = new OrderDAO();
        Order order = orderDAO.selectById(idOrder);
        request.setAttribute("order", order);
        OrderDetailDAO orderDetailDAO =new OrderDetailDAO();
        List<OrderDetail> orderDetails = orderDetailDAO.selectByOrderId(idOrder);
        request.setAttribute("orderDetailList", orderDetails);
        request.getRequestDispatcher("/WEB-INF/book/OrderDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
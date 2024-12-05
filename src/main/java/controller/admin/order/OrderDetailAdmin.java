package controller.admin.order;

import database.OrderDAO;
import database.OrderDetailDAO;
import model.Order;
import model.OrderDetail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderDetails", value = "/OrderDetails")
public class OrderDetailAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idOrderString = request.getParameter("order_Id");
        int idOrder = Integer.parseInt(idOrderString);
        OrderDAO orderDAO = new OrderDAO();
        Order order = orderDAO.selectById(idOrder);
        request.setAttribute("orderAdmin", order);
        OrderDetailDAO orderDetailDAO =new OrderDetailDAO();
        List<OrderDetail> orderDetails = orderDetailDAO.selectByOrderId(idOrder);
        request.setAttribute("orderDetailListAdmin", orderDetails);
        request.getRequestDispatcher("/WEB-INF/admin/jsp/orderDetailAdmin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
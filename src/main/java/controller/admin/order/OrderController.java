package controller.admin.order;

import com.google.gson.Gson;
import database.OrderDAO;
import model.Order;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderController", value = "/OrderController")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        OrderDAO orderDAO = new OrderDAO();

        int status = Integer.parseInt(request.getParameter("status"));
        List<Order> orders = orderDAO.selectOrderByStatus(status);

        Gson gson = new Gson();
        String json = gson.toJson(orders);
        System.out.println(json);  // Ghi log JSON để kiểm tra
        response.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
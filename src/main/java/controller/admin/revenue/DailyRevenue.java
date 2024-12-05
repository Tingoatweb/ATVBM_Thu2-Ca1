package controller.admin.revenue;

import com.google.gson.Gson;
import database.OrderDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.Map;

@WebServlet(name = "DailyRevenue", value = "/DailyRevenue")
public class DailyRevenue extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDAO orderDAO = new OrderDAO();
        double[]revenue = orderDAO.revenueForWeek(Date.valueOf(LocalDateTime.now().toLocalDate()));
        Gson gson = new Gson();
        String json = gson.toJson(revenue);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
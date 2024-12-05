package controller.admin.revenue;

import com.google.gson.Gson;
import database.OrderDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.Year;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "RevenueDataServlet", value = "/RevenueDataServlet")
public class RevenueDataServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderDAO orderDAO = new OrderDAO();
       double[] revenueData = orderDAO.revenue2(LocalDateTime.now().getYear());
        double[] revenueData2 =  orderDAO.revenue2(LocalDateTime.now().getYear()-1);;

        Map<String, double[]> combinedData =new HashMap<>();
        combinedData.put("data1", revenueData);
        combinedData.put("data2", revenueData2);
        // Convert list to JSON
        Gson gson = new Gson();
        String json = gson.toJson(combinedData);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
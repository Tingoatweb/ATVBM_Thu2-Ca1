package controller.admin.revenue;

import com.google.gson.Gson;
import database.OrderDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Date;
import java.util.Map;

@WebServlet(name = "FromDayToDayRevenue", value = "/FromDayToDayRevenue")
public class FromDayToDayRevenue extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        Map<String, String> data = gson.fromJson(reader, Map.class);

        String ngaybatdau = data.get("ngaybatdau");
        String ngayketthuc = data.get("ngayketthuc");
        Date date1 = Date.valueOf(ngaybatdau);
        Date date2 = Date.valueOf(ngayketthuc);

        Map<Date, Double>revenue = new OrderDAO().revenue(date1, date2);
        String json = gson.toJson(revenue);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
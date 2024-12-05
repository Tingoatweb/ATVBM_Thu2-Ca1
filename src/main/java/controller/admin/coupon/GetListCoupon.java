package controller.admin.coupon;

import com.google.gson.Gson;
import database.CouponDAO;
import database.ProductDAO;
import database.UserDAO;
import model.Coupon;
import model.Product;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "GetListCoupon", value = "/GetListCoupon")
public class GetListCoupon extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CouponDAO couponDAO = new CouponDAO();
        ArrayList<Coupon> coupons = couponDAO.selectAll();
        //chuyen doi danh sach san pham thanh chuoi json
        Gson gson = new Gson();
        String gsonUser = gson.toJson(coupons);
        //gui phan hoi json ve client
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(gsonUser);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
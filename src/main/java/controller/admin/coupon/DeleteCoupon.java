package controller.admin.coupon;

import database.CouponDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteCoupon", value = "/DeleteCoupon")
public class DeleteCoupon extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User auth = (User) request.getSession().getAttribute("admin");
        if (auth == null) {
            // User not authenticated, redirect to the login page
            response.sendRedirect("Login");
            return; // Stop further processing
        }
        StringBuilder couponIds = new StringBuilder();
        for(String proid:request.getParameterValues("selectedCoupons")) {
            couponIds.append("'").append(proid).append("',");
        }
        couponIds.deleteCharAt(couponIds.length()-1);
        CouponDAO dao = new CouponDAO();
        dao.deleteCoupons(couponIds);
        response.sendRedirect("ListCoupon");
    }
}
package controller.user.coupon;

import database.CouponDAO;
import database.CouponOfUserDAO;
import model.Coupon;
import model.CouponOfUser;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "SaveCoupon", value = "/SaveCoupon")
public class SaveCoupon extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json"); // Thiết lập JSON
        PrintWriter out = response.getWriter();

        String idCouponString = request.getParameter("idCoupon");
        int idCoupon = Integer.parseInt(idCouponString);

        // Lấy người dùng đang đăng nhập
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userC");

        if (user != null) {
            try {
                CouponOfUserDAO couponOfUserDAO = new CouponOfUserDAO();
                Coupon coupon = new CouponDAO().selectById(idCoupon);

                boolean isHave = couponOfUserDAO.exists(user.getUserId(), coupon.getCouponId());
                // User đã có mã đó
                if (isHave) {
                    out.print("{\"status\":\"exists\"}");
                    return;
                }

                CouponOfUser couponOfUser = new CouponOfUser(couponOfUserDAO.creatId() + 1, user, coupon, true);
                int result = couponOfUserDAO.insert(couponOfUser);

                if (result > 0) {
                    out.print("{\"status\":\"success\"}");
                    return;
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);

            }
        }

        out.print("{\"status\":\"error\"}");
    }
}
package controller.user.coupon;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import database.CouponDAO;
import model.Cart;
import model.Coupon;
import model.CouponType;
import model.ErrorBean;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ApplyCoupon", value = "/ApplyCoupon")
public class ApplyCoupon extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String couponCode = request.getParameter("couponCode");
        ErrorBean eb = new ErrorBean();

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        CouponDAO couponDAO = new CouponDAO();
        Coupon coupon = couponDAO.selectByCode(couponCode);

        JsonObject jsonResponse = new JsonObject();

        if (coupon == null) {
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Mã giảm giá không tồn tại.");
        } else if (coupon.getStartDate().after(new java.util.Date()) || coupon.getEndDate().before(new java.util.Date())) {
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Mã giảm này không còn hiệu lực.");
        } else if (cart.calculateTotal() < coupon.getMinTotalPrice()) {
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Giá trị đơn hàng của bạn chưa đạt mức tối thiểu để sử dụng mã này.");
        }  else if (coupon.getMaxQuantityUseOfUser()<=0 || coupon.getMaxUseOfCoupon() <= 0) {
            jsonResponse.addProperty("success", false);
            jsonResponse.addProperty("message", "Mã đã hết lượt sử dung.");
        } else {
            double discount = calculateDiscount(coupon, cart.calculateTotal());
            double newTotal = cart.calculateTotal() - discount;

            // để lưu mã khi người dùng nhập và áp dụng
            session.setAttribute("appliedCouponCode", couponCode);
            session.setAttribute("coupon", coupon);
            session.setAttribute("discountValue", coupon.getDiscountValue());
            session.setAttribute("minTotalPrice", coupon.getMinTotalPrice());
            session.setAttribute("maxTotalPrice", coupon.getMaxTotalPrice());
            session.setAttribute("discountType", coupon.getDiscountType().getCouponTypeId());
            session.setAttribute("discount", discount);
            session.setAttribute("newTotal", newTotal);

            jsonResponse.addProperty("success", true);
            jsonResponse.addProperty("message", "Áp dụng mã giảm giá thành công.");
            jsonResponse.addProperty("minTotalPrice", coupon.getMinTotalPrice());
            jsonResponse.addProperty("maxTotalPrice",  coupon.getMaxTotalPrice());
            jsonResponse.addProperty("discountValue", coupon.getDiscountValue());
            jsonResponse.addProperty("discountType", coupon.getDiscountType().getCouponTypeId());
            jsonResponse.addProperty("newTotal", newTotal);
            jsonResponse.addProperty("discount", discount);
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(jsonResponse));
    }

    private double calculateDiscount(Coupon coupon, double cartTotal) {
        double discount = 0;
        int discountTypeId = coupon.getDiscountType().getCouponTypeId();

        // neu loai giam la phan tram
        if (discountTypeId == 1) {
            discount = cartTotal * (coupon.getDiscountValue() / 100);
            // gia lonw
            if (discount > coupon.getMaxTotalPrice()) {
                discount = coupon.getMaxTotalPrice();
            }
        } else if (discountTypeId == 2) { // Fixed amount discount
            discount = coupon.getDiscountValue();
        }


        return discount;
    }
}
package controller.user.cart;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateCart", value = "/UpdateCart")
public class UpdateCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("appliedCouponCode");
        session.removeAttribute("discountValue");
        session.removeAttribute("discountType");
        session.removeAttribute("discount");
        session.removeAttribute("newTotal");
        session.removeAttribute("selectedCouponId");
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("success", true);
        jsonResponse.addProperty("message", "Mã giảm giá đã được hủy bỏ thành công.");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(new Gson().toJson(jsonResponse));
    }
}
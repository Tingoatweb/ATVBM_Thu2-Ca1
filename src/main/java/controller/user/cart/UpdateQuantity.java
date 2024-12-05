package controller.user.cart;

import model.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateQuantity", value = "/UpdateQuantity")
public class UpdateQuantity extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("idproduct"));
        int newQuantity = Integer.parseInt(request.getParameter("quantity"));
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if(cart!=null) {
                cart.updateQuantity(productId, newQuantity);
            request.getSession().setAttribute("cart", cart);
        }
        // Lấy số lượng giỏ hàng từ phương thức trong lớp Cart của bạn
        int cartQuantity = cart.calculateTotalQuantity();

        // Trả về số lượng giỏ hàng dưới dạng text
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(String.valueOf(cartQuantity));
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/book/shopping-cart.jsp");
        dispatcher.forward(request, response);
    }
}
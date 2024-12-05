package controller.user.cart;

import database.ProductDAO;
import database.UserDAO;
import model.Cart;
import model.CartItem;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddToCartDetail", value = "/AddToCartDetail")
public class AddToCartDetail extends HttpServlet {
    ProductDAO productDAO = new ProductDAO();
    UserDAO userDAO = new UserDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy mã sản phẩm và số lượng từ request
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Lấy giỏ hàng từ session hoặc tạo mới nếu chưa có
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            request.getSession().setAttribute("cart", cart);
        }

        // Kiểm tra sản phẩm đã tồn tại trong giỏ hàng chưa
        CartItem existingItem = cart.findCartItemId(productId);

        if (existingItem != null) {
            // Nếu sản phẩm đã tồn tại, cập nhật số lượng
            existingItem.setQuantity(existingItem.getQuantity() + quantity);
        } else {
            // Nếu sản phẩm chưa tồn tại, thêm sản phẩm mới vào giỏ hàng
            Product product = productDAO.selectById(productId);
            CartItem cartItem = new CartItem(product, quantity);
            cartItem.setPrice(product.getPrice());
            cartItem.setCart(cart);
            cart.addToCart(cartItem);
        }

        // Cập nhật tổng số lượng sản phẩm trong giỏ hàng và lưu vào session
        int totalQuantity = cart.calculateTotalQuantity();
        request.getSession().setAttribute("totalQuantity", totalQuantity);

        // Gửi phản hồi về trình duyệt, bao gồm tổng số lượng sản phẩm
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"status\":\"success\", \"totalQuantity\":" + totalQuantity + "}");

    }
}
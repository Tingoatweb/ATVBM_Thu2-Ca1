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

@WebServlet(name = "AddToCart", value = "/AddToCart")
public class AddToCart extends HttpServlet {
    ProductDAO productDAO = new ProductDAO();
    UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "";
        // Lấy mã sản phẩm từ request
        int productId = Integer.parseInt(request.getParameter("productId"));


        //Lấy giỏ hàng từ session hoặc tạo mới nếu chưa có
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            request.getSession().setAttribute("cart", cart);
        }
        HttpSession session = request.getSession();
        // Tính tổng số lượng sản phẩm trong giỏ hàng và lưu vào session
        int totalQuantity = cart.calculateTotalQuantity();
        session.setAttribute("totalQuantity", totalQuantity);

        // Kiểm tra sản phẩm đã tồn tại trong giỏ hàng chưa
        CartItem existingItem = cart.findCartItemId(productId);

        if (existingItem != null) {
            // Nếu sản phẩm đã tồn tại, tăng số lượng lên
            existingItem.setQuantity(Math.max(existingItem.getQuantity() + 1, 1));//k trả về số âm
        } else {
            // Nếu sản phẩm chưa tồn tại, thêm sản phẩm mới vào giỏ hàng
            Product product = productDAO.selectById(productId);

            CartItem cart_item = new CartItem(product, 1);
            cart_item.setPrice(product.getPrice());
            cart_item.setCart(cart);

            cart.addToCart(cart_item);
        }

        // Gửi phản hồi về trình duyệt
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("success");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/book/shop-grid.jsp");
        dispatcher.forward(request, response);
    }

}
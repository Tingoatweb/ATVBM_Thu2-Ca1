package controller.user.wishlist;

import database.ProductDAO;
import database.WishListDAO;
import model.Product;
import model.User;
import model.WishlistItem;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "AddToWishList", value = "/AddToWishList")
public class AddToWishList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userC");

        int productId = Integer.parseInt(request.getParameter("productId"));
        Product product = new ProductDAO().selectById(productId);

        // Create a new WishlistItem without itemId
        WishlistItem newWish = new WishlistItem(user, product, product.getProduct_name(), product.getPrice());

        WishListDAO wishListDAO = new WishListDAO();

        try {
            int add = wishListDAO.insert(newWish);
        } catch (SQLException e) {
            throw new RuntimeException("Error inserting into wishlist", e);
        }

        // Redirect or forward to appropriate page after adding to wishlist
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/book/shop-grid.jsp");
        dispatcher.forward(request, response);
    }

}
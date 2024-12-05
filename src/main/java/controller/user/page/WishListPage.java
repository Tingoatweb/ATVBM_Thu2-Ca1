package controller.user.page;

import database.WishListDAO;
import model.User;
import model.WishlistItem;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "WishListPage", value = "/WishListPage")
public class WishListPage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userC");
        ArrayList<WishlistItem> wishlistItems = new WishListDAO().selectWById(user.getUserId());
        request.setAttribute("wishlists",wishlistItems);
        request.getRequestDispatcher("/WEB-INF/book/Wishlist.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
package controller.user.wishlist;

import database.WishListDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RemoveItemWishList", value = "/RemoveItemWishList")
public class RemoveItemWishList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int itemid = Integer.parseInt(request.getParameter("itemId"));
        WishListDAO wdao = new WishListDAO();
        try {
            int delete = wdao.deleteWishlistItem(itemid);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/book/Wishlist.jsp");
        dispatcher.forward(request, response);
    }
    }

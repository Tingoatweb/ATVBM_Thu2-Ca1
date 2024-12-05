package controller.user.rating;

import database.CommentDAO;
import database.ProductDAO;
import database.RatingDAO;
import model.Comment;
import model.Product;
import model.Rating;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "CommentRating", value = "/CommentRating")
public class CommentRating extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productid = Integer.parseInt(request.getParameter("productid"));
        Product pr = new ProductDAO().selectById(productid);

        int ratingid = Integer.parseInt(request.getParameter("ratingid"));
        double ratingstar = Double.parseDouble(request.getParameter("ratingstar"));
        String ratingtext = request.getParameter("ratingtext");
        Rating ra = new RatingDAO().selectById(ratingid);
        String comment = request.getParameter("detailcomment");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        long dateComment = date.getTime() / 1000; // Convert Date to Unix timestamp
        CommentDAO commentDAO = new CommentDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userC");
        Comment co = new Comment(commentDAO.creatId()+1,ratingid,pr,ratingstar,ratingtext,user,comment,dateComment);
        commentDAO.insert(co);



        response.sendRedirect(request.getContextPath() + "/Shopdetails?id=" + productid);
    }
}
package controller.user.page;

import database.CommentDAO;
import model.Comment;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CommentPage", value = "/CommentPage")
public class CommentPage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userC");
        ArrayList<Comment> comments = new CommentDAO().selectCByuserid(user.getUserId());
        request.setAttribute("comments",comments);
        request.getRequestDispatcher("/WEB-INF/book/Comment.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
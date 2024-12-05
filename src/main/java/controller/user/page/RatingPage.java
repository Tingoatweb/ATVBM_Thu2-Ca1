package controller.user.page;

import database.RatingDAO;
import model.Rating;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "RatingPage", value = "/RatingPage")
public class RatingPage extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userC");
        ArrayList<Rating> ratings = new RatingDAO().selectRByuserid(user.getUserId());
        request.setAttribute("ratings",ratings);
        request.getRequestDispatcher("/WEB-INF/book/Rating.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
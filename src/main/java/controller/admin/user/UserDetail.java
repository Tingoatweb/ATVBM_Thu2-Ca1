package controller.admin.user;

import database.UserDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserDetail", value = "/UserDetail")
public class UserDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("id");
        System.out.println("id"+id);
        request.setAttribute("id", id);
        request.getRequestDispatcher("/WEB-INF/admin/jsp/pages-account-settings-account.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    public static void main(String[] args) {
        String id="1";
        UserDAO UD = new UserDAO();

        User u1 = UD.selectById(Integer.parseInt(id));
        System.out.println("u1"+u1.getName());
    }
}
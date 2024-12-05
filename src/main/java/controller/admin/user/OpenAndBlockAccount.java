package controller.admin.user;

import database.UserDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "OpenAndBlockAccount", value = "/OpenAndBlockAccount")
public class OpenAndBlockAccount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdString = request.getParameter("userId");
        String action = request.getParameter("action");
        if (userIdString != null) {
            int userId = Integer.parseInt(userIdString);
            UserDAO userDAO = new UserDAO();
            User user = userDAO.selectById(userId);
            if (user != null) {
                if ("lock".equals(action)){
                    user.setRole(3);
                    userDAO.updateRole(user);
                }
                else if ("lockAdmin".equals(action)){
                    user.setRole(5);
                    userDAO.updateRole(user);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/jsp/lockAccountAdmin.jsp");
                    dispatcher.forward(request, response);
                    return;
                }
                else if ("unLock".equals(action)){
                    user.setRole(2);
                    userDAO.updateRole(user);
                }
                else if ("unLockAdmin".equals(action)){
                    user.setRole(1);
                    userDAO.updateRole(user);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/jsp/lockAccountAdmin.jsp");
                    dispatcher.forward(request, response);
                    return;
                }
                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/admin/jsp/lockAccount.jsp");
                dispatcher.forward(request, response);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
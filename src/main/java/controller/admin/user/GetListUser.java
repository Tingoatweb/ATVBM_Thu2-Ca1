package controller.admin.user;

import com.google.gson.Gson;
import database.UserDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "GetListUser", value = "/GetListUser")
public class GetListUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        ArrayList<User> users = userDAO.selectUserLockAndUnLock();
        //chuyen doi danh sach san pham thanh chuoi json
        Gson gson = new Gson();
        String gsonUser = gson.toJson(users);
        //gui phan hoi json ve client
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(gsonUser);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
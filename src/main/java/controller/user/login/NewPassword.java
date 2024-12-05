package controller.user.login;

import model.ErrorBean;
import database.UserDAO;
import model.User;
import util.PasswordEncryption;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet(name = "NewPassword", value = "/NewPassword")
public class NewPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        int id = (int) session.getAttribute("customerId");
//
//        String password = request.getParameter("newpasswordchangePass");
//
//        password = PasswordEncryption.toSHA1(password);
//
//        UserDAO customerDAO = new UserDAO();
//        User customer = customerDAO.selectById(id);
//        System.out.println(customer);
//        String url = "";
//        if (customer != null) {
//            customer.setPassword(password);
//            customerDAO.update(customer);
//            url = "/WEB-INF/book/index.jsp";
//            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
//            dispatcher.forward(request, response);
//        } else {
//            request.setAttribute("Error", "mat khau chua chinh xac!");
//            ErrorBean eb = new ErrorBean();
//            eb.setError((String) request.getAttribute("Error"));
//            request.setAttribute("errorBean", eb);
//            url = request.getContextPath() + "/WEB-INF/book/changePassword.jsp";
//            response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
//            return;
//
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("customerId");

        String password = request.getParameter("newpassword");

        password = PasswordEncryption.toSHA1(password);

        UserDAO customerDAO = new UserDAO();
        User customer = customerDAO.selectById(id);
        System.out.println(customer);
        String url = "";
        if (customer != null) {
            customer.setPassword(password);
            System.out.println(password);
            customerDAO.update(customer);
            url = "/WEB-INF/book/index.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("Error", "mat khau chua chinh xac!");
            ErrorBean eb = new ErrorBean();
            eb.setError((String) request.getAttribute("Error"));
            request.setAttribute("errorBean", eb);
            url = request.getContextPath() + "/WEB-INF/book/changePassword.jsp";
            response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
            return;

        }
    }
}
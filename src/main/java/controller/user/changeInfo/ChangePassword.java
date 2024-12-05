package controller.user.changeInfo;

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
import java.io.IOException;

@WebServlet(name = "ChangePassword", value = "/ChangePassword")
public class ChangePassword extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String username = request.getParameter("username");
//        System.out.println(username);
//        String password = request.getParameter("password");
//        System.out.println("pw" + password);
//        String newPassword = request.getParameter("newpassword");
//
//        password = PasswordEncryption.toSHA1(password);
//        newPassword = PasswordEncryption.toSHA1(newPassword);
//        UserDAO customerDAO = new UserDAO();
//        User customer = customerDAO.selectByUsernamePassword(username, password);
//        System.out.println(cus:wq
//        tomer);
//        String url = "";
//        if (customer != null) {
//            customer.setPassword(newPassword);
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
//            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
//            dispatcher.forward(request, response);
//            return;
//
//        }
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		System.out.println(username);
		String password = request.getParameter("password");
		System.out.println("pw" + password);
		String newPassword = request.getParameter("newpassword");

		password = PasswordEncryption.toSHA1(password);
		newPassword = PasswordEncryption.toSHA1(newPassword);
		UserDAO customerDAO = new UserDAO(request);
		User customer = customerDAO.selectByUsernamePassword(username, password);
		System.out.println(customer);
		String url = "";
		if (customer != null) {
			customer.setPassword(newPassword);
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
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
			return;

		}
	}
}

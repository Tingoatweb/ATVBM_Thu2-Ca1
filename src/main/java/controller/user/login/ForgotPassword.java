package controller.user.login;

import model.ErrorBean;
import database.UserDAO;
import model.User;
import util.Email;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Random;

@WebServlet(name = "ForgotPassword", value = "/ForgotPassword")
public class ForgotPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.getWriter().append("Served at: ").append(request.getContextPath());

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String email = request.getParameter("emailForget");


        UserDAO customerDAO = new UserDAO();
        User customer = customerDAO.selectByEmail2(email);
        if (customer != null) {
            HttpSession mySession = request.getSession();
            mySession.setAttribute("customerId", customer.getUserId());
            System.out.println(customer.getUserId());
            int otpvalue = 0;


            if (email != null || !email.equals("")) {
                // sending otp
                Random rand = new Random();
                otpvalue = rand.nextInt(1255650);

                String to = email;// change accordingly
                // Get the session object
                Email.sendEmail(email, "Mã OTP của bạn: " + otpvalue, "Xin chào");
                System.out.println("message sent successfully");
                request.setAttribute("otp", otpvalue);

                mySession.setAttribute("otp", otpvalue);
                mySession.setAttribute("email", email);
                request.setAttribute("message", "Mã OTP đã được gửi tới email của bạn!");
                String url = request.getContextPath() + "/WEB-INF/book/enterOtp.jsp";
                RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                dispatcher.forward(request, response);


                //request.setAttribute("status", "success");
            }
        } else {
            request.setAttribute("Error", "Username không tồn tại, vui lòng nhập lại username khác!");
            ErrorBean eb = new ErrorBean();
            eb.setError((String) request.getAttribute("Error"));
            request.setAttribute("errorBean", eb);

            String url = request.getContextPath() + "/pizza-gh-pages/pizza-gh-pages/forgot.jsp";
            response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
            return;
        }


    }
}

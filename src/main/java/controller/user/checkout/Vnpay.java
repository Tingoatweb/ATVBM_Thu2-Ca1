package controller.user.checkout;

import database.UserDAO;
import model.ErrorBean;
import model.User;
import util.Email;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Random;

@WebServlet(name = "Vnpay", value = "/Vnpay")
public class Vnpay extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String email = request.getParameter("emailforbank");
        if (email != null || !email.equals("")) {
            // sending otp
            int otpvalue =0;
            Random rand = new Random();
            otpvalue = rand.nextInt(1255650);
            HttpSession mySession = request.getSession();

            String to = email;// change accordingly
            // Get the session object
            Email.sendEmail(email, "Mã OTP cho giao dịch của bạn là: " + otpvalue, "Xin chào");
            System.out.println("message sent successfully");
            request.setAttribute("otpbank", otpvalue);

            mySession.setAttribute("otp", otpvalue);
            mySession.setAttribute("email", email);
            request.setAttribute("message", "Mã OTP cho giao dịch đã được gửi tới email của bạn!");
            String url = request.getContextPath() + "/WEB-INF/book/OTPBank.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);


            //request.setAttribute("status", "success");
        }
     else {
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
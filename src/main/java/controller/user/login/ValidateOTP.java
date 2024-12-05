package controller.user.login;

import model.ErrorBean;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;

@WebServlet(name = "ValidateOtp", value = "/ValidateOtp")
public class ValidateOTP extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
//
//        HttpSession session = request.getSession();
//        int value = Integer.parseInt(request.getParameter("otp"));
//        int otp = (int) session.getAttribute("otp");
//
//
//        RequestDispatcher dispatcher = null;
//
//
//        if (value == otp) {
//
//            request.setAttribute("email", request.getParameter("email"));
//            request.setAttribute("status", "success");
//            String url = request.getContextPath() + "/WEB-INF/book/NewPassword.jsp";
//            response.sendRedirect(url);
//
//        } else {
//            request.setAttribute("message", "Sai mã OTP");
//            ErrorBean eb = new ErrorBean();
//            eb.setError((String) request.getAttribute("message"));
//            request.setAttribute("errorBean", eb);
//
//            String url = request.getContextPath() + "/WEB-INF/book/EnterOtp.jsp";
//            response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
//            return;
//
//        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        int value = Integer.parseInt(request.getParameter("otp"));
        int otp = (int) session.getAttribute("otp");


        if (value == otp) {

            request.setAttribute("email", request.getParameter("email"));
            request.setAttribute("status", "success");
            String url = request.getContextPath() + "/WEB-INF/book/newPassword.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);

        } else {
            request.setAttribute("message", "Sai mã OTP");
            ErrorBean eb = new ErrorBean();
            eb.setError((String) request.getAttribute("message"));
            request.setAttribute("errorBean", eb);

            String url = request.getContextPath() + "/WEB-INF/book/EnterOtp.jsp";
            response.sendRedirect(url + "?error=" + URLEncoder.encode(eb.getError(), "UTF-8"));
            return;

        }
    }
}
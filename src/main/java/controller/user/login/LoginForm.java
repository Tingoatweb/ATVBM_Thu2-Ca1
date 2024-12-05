package controller.user.login;

import database.UserDAO;
import model.ErrorBean;
import model.User;
import util.CountryIdentifier;
import util.PasswordEncryption;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginForm", value = "/LoginForm")
public class LoginForm extends HttpServlet {
    private static final int MAX_LOGIN_FAILED = 3;
    private static final int LOCK_LOGIN = 5;
    private static final int WARNING_LOGIN = 4;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String username = request.getParameter("usernamelo");
        String password = request.getParameter("passwordlo");
        ErrorBean eb = new ErrorBean();
        String baoLoi1 = "";
        // Encrypt password (assuming proper encryption implemented elsewhere)
        password = PasswordEncryption.toSHA1(password);

        HttpSession session = request.getSession();


        // Check for login attempt
        if (username != null && password != null) {
            UserDAO userDAO = new UserDAO(request); // Assuming UserDAO is instantiated correctly

            User user = userDAO.selectByUsernamePassword(username, password);

            if (user != null) {
                session.setAttribute("username", username);
                System.out.println(username);

                if (user.getRole() == 1 || user.getRole() == 4) {
                    session.setAttribute("admin", user);
                    session.setAttribute("userC", user);
                    response.sendRedirect(request.getContextPath() + "/AdminIndex");
                }else if(user.getRole() == 3 || user.getRole() == 5){
                    request.setAttribute("Error", "Tài khoản bạn đã bị khóa!");
                    eb.setError((String) request.getAttribute("Error"));
                    request.setAttribute("errorBean", eb);
                    String url = request.getContextPath() + "/WEB-INF/book/login.jsp";
                    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                    dispatcher.forward(request, response);
                }else if(user.getFailedLogin() >= LOCK_LOGIN){
                    request.setAttribute("Error", "Tài khoản của bạn đã bị khóa trong 2 tiếng do đăng nhập thất bại quá nhiều lần! Vui lòng thử lại sau.");
                    eb.setError((String) request.getAttribute("Error"));
                    request.setAttribute("errorBean", eb);
                    String url = request.getContextPath() + "/WEB-INF/book/login.jsp";
                    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                    dispatcher.forward(request, response);
                }else {
                    //xác định thời gian, bằng giây, giữa các yêu cầu từ Client trước khi Servlet container sẽ vô hiệu hóa session này
                    session.setMaxInactiveInterval(30 * 60);
                    session.setAttribute("userC", user);
                    System.out.println("userC: "+ user.getName());
                    // Use forward for successful customer login
                    response.sendRedirect(request.getContextPath() + "/Index");
                }
            } else {
                // lấy số lần đăng nhập sai của tài khoản
                int failedLoginCount = userDAO.getFailedLogin(username);
                // số lần nhỏ hơn 5 thì cảnh báo người dùng
                if (failedLoginCount >= MAX_LOGIN_FAILED && failedLoginCount < LOCK_LOGIN) {
                    request.setAttribute("Error", "Bạn đã đăng nhập sai " + failedLoginCount + " lần. Vui lòng kiểm tra lại thông tin đăng nhập.");
                     if (failedLoginCount == WARNING_LOGIN) {
                        request.setAttribute("Error", "Bạn đã đăng nhập sai " + failedLoginCount + " lần. Nhập sai thêm lần nữa tài khoản sẽ bị khóa trong 2 tiếng!");
                    }
                } else if (failedLoginCount >= LOCK_LOGIN) {
                    // thông báo bị khóa
                    request.setAttribute("Error", "Tài khoản của bạn đã bị khóa trong 2 tiếng do đăng nhập thất bại quá nhiều lần! Vui lòng thử lại sau.");
                } else {
                    request.setAttribute("Error", "Tên đăng nhập hoặc mật khẩu chưa chính xác!");
                }
                eb.setError((String) request.getAttribute("Error"));
                request.setAttribute("errorBean", eb);
                String url = request.getContextPath() + "/WEB-INF/book/login.jsp";
                RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                dispatcher.forward(request, response);
            }
        }

        try {
            CountryIdentifier countryIdentifier = new CountryIdentifier();

            String countryId = countryIdentifier.getCountryId(request);
            System.out.println("Quoc gia cua ban la: " + countryId);
        } catch (Exception e) {
            e.printStackTrace();
        }




    }

    }


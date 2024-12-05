package controller.user.changeInfo;

import database.UserDAO;
import model.ErrorBean;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class ChangeInformation
 */
@WebServlet(name = "changeInformation", value = "/changeInformation")
public class ChangeInformation extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public ChangeInformation() {
        super();

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }



            @Override
            protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

                request.setCharacterEncoding("UTF-8");
                response.setCharacterEncoding("UTF-8");

                User user =(User) request.getSession().getAttribute("userC");

                String sexual = request.getParameter("gender");
                System.out.println("gender: "+sexual);
                String birthday = request.getParameter("birthday");
                String phoneNumber = request.getParameter("phoneNumber");
                String email = request.getParameter("email");
                String name = request.getParameter("name");
                java.util.Date date=null;
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");

                UserDAO userDAO = new UserDAO(request);

                System.out.println(user);
                ErrorBean eb = new ErrorBean();
                String url = "";
                String error = "";

                if (user != null) {

                    if(userDAO.selectByEmail(email)&&!user.getEmail().equals(email)) {
                        request.setAttribute("Error", "ten email da ton tai, vui long chon email khac!");
                        eb.setError((String) request.getAttribute("Error"));
                        request.setAttribute("errorBean", eb);
                        url = request.getContextPath() + "/WEB-INF/book/changeInformation.jsp";
                        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                        dispatcher.forward(request, response);

                   return;

               }
                    if((phoneNumber.length()!=10)||!phoneNumber.startsWith("0")) {
                        request.setAttribute("Error", "số điện thoại nhập vào không hợp lệ, vui lòng nhập bắt đầu từ số 0 và gồm 10 chữ số!");
                        eb.setError((String) request.getAttribute("Error"));
                        request.setAttribute("errorBean", eb);
                        url = request.getContextPath() + "/WEB-INF/book/changeInformation.jsp";
                        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                        dispatcher.forward(request, response);

                        return;
        }


                    user.setEmail(email);
                    user.setSexual(sexual);
                    user.setPhone(phoneNumber);
                    user.setName(name);
                    try {
                        date =dateFormat.parse(birthday);
                        java.sql.Date sqlDate = new java.sql.Date(date.getTime());
                        user.setBirthday(sqlDate);
                    } catch (ParseException e) {
                        System.out.println("loi ngay");
                        throw new RuntimeException(e);

                    }


                    userDAO.update(user);
                    url = "/WEB-INF/book/index.jsp";
                    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("Error", "Vui long dang nhap de sua thong tin ca nhan!");

                    eb.setError((String) request.getAttribute("Error"));
                    request.setAttribute("errorBean", eb);
                    url = request.getContextPath() + "/WEB-INF/book/changeInformation.jsp";
                    RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                    dispatcher.forward(request, response);
                    return;

                }

        }

}

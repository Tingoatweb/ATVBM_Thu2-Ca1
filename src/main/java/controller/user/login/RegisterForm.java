package controller.user.login;

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
import java.util.StringTokenizer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "RegisterForm", value = "/RegisterForm")
public class RegisterForm extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            String username = request.getParameter("usernamere");
            String name = request.getParameter("namere");
            String email = request.getParameter("emailre");
            String password = request.getParameter("passwordre");
            String enterThePassword = request.getParameter("enterThePasswordre");

            UserDAO cd = new UserDAO();
            ErrorBean eb1 = new ErrorBean();
            ErrorBean eb2 = new ErrorBean();
            ErrorBean eb3 = new ErrorBean();

            String url = "";
            String baoLoi1 = "";
            String baoLoi2 = "";
            String baoloi3 = "";

            // Kiểm tra định dạng email
            if (!isValidEmail(email)) {
                eb2.setError("Email của bạn không đúng định dạng abc@xyz.abc ");
                request.setAttribute("errorBean2", eb2);
                baoLoi2 += eb2.getError();
                url = "/WEB-INF/book/register.jsp";
            } else if (cd.selectByUsername(username)) {
                eb1.setError("Tên đăng nhập đã tồn tại, vui lòng chọn tên đăng nhập khác.");
                request.setAttribute("errorBean1", eb1);
                baoLoi1 += eb1.getError();

                url = "/WEB-INF/book/register.jsp";
            } else if (!isValidUserName(username)) {
                eb1.setError("Tên đăng nhập chỉ được chứa chữ và số và không chứa khoảng trắng.");
                request.setAttribute("errorBean1", eb1);
                baoLoi1 += eb1.getError();

                url = "/WEB-INF/book/register.jsp";
            }
            else if (cd.selectByEmail(email)) {
                eb2.setError("Email đã tồn tại, vui lòng chọn email khác.");
                request.setAttribute("errorBean2", eb2);
                baoLoi2 += eb2.getError();
                url = "/WEB-INF/book/register.jsp";

            }
            else if (!password.equals(enterThePassword)) {
                eb3.setError("Password nhập lại phải giống password");

                request.setAttribute("errorBean3", eb3);
                baoloi3 += eb3.getError();
                url = "/WEB-INF/book/register.jsp";
            }else if (!isValidPassword(password)) {
                eb3.setError("Password phải có từ 6-8 kí tự và chứa chữ hoặc số");

                request.setAttribute("errorBean3", eb3);
                baoloi3 += eb3.getError();
                url = "/WEB-INF/book/register.jsp";
            }

            else {


                User customer = new User((cd.creatId() + 1), username, password, 2, solve(name), null, null, null, email, null);
                cd.insert(customer);
//                Email.sendEmail(email, "Chúc mừng bạn đã trở thành khách hàng thân thiết của cửa hàng chúng tôi!", "Thông báo đăng ký tài khoản thành công");
                url = "/WEB-INF/book/login.jsp";
            }


            if (url != null) {
                RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    private boolean isValidEmail(String email) {
        // Biểu thức chính quy kiểm tra định dạng email
        String regex = "^[a-zA-Z][a-zA-Z0-9\\-_]+@[a-zA-Z]+(\\.[a-zA-Z]+)+$";
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(email);
        return m.matches();
        /*Mật khẩu chỉ có thể chứa chữ hoặc số và có từ 6-8 kí tự*/
    }
    private boolean isValidPassword(String password) {
        // Biểu thức chính quy kiểm tra định dạng email
        String regex = "^[a-zA-Z0-9]{6,8}$";
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(password);
        return m.matches();
    }
    private boolean isValidUserName(String username) {
        // Biểu thức chính quy kiểm tra định dạng email
        String regex = "^[a-zA-Z0-9]*$";
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(username);
        return m.matches();
    }
    private String solve(String name){
        //Chuẩn hóa dữ liệu vd:họ tên
        //b1: viet thuong cac ki tu
        name = name.toLowerCase();

        //b2: tach cac tu trong cau tai vi tri co dau cach
        StringTokenizer tokenizer = new StringTokenizer(name, " ");
        String newName="";
        while (tokenizer.hasMoreTokens()){
            String cutName = tokenizer.nextToken();
            char[]key = cutName.toCharArray();
            for(int i=0; i<key.length; i++){
                if(i==0){
                    key[i]=Character.toUpperCase(key[i]);
                }
                newName+=key[i];
            }
            newName+=" ";
        }
        newName.trim();
        return newName;
    }


}



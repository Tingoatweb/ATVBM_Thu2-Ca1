package controller.user.login;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import database.UserDAO;
import model.AccountFB;
import model.User;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import util.ConstantsFB;
import util.PasswordEncryption;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.StringTokenizer;

@WebServlet(name = "LoginToIndexByFB", value = "/LoginToIndexByFB")
public class LoginToIndexByFB extends HttpServlet {
    public static String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(ConstantsFB.FACEBOOK_LINK_GET_TOKEN)
                .bodyForm(
                        Form.form()
                                .add("client_id", ConstantsFB.FACEBOOK_CLIENT_ID)
                                .add("client_secret", ConstantsFB.FACEBOOK_CLIENT_SECRET)
                                .add("redirect_uri", ConstantsFB.FACEBOOK_REDIRECT_URI)
                                .add("code", code)
                                .build()
                )
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static AccountFB getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = ConstantsFB.FACEBOOK_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        AccountFB fbAccount = new Gson().fromJson(response, AccountFB.class);
        return fbAccount;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            System.err.println("Authorization code is missing.");
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        System.out.println("Authorization code: " + code);
        String accessToken = null;
        try {
            accessToken = getToken(code);
            System.out.println("Access token: " + accessToken);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        AccountFB userFBDto = null;
        try {
            userFBDto = getUserInfo(accessToken);
            System.out.println("User info: " + userFBDto);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        String userE = userFBDto.getEmail();
        UserDAO userD = new UserDAO();
        User user = userD.selectByEmail2(userE);
        System.out.println("User email: " + userE);
        String password = PasswordEncryption.toSHA1(userFBDto.getId());
        HttpSession session = request.getSession();
        UserDAO userDao2 = new UserDAO(request);
        User user2 = userDao2.selectByUsernamePassword(userFBDto.getName(), password);
        if (user == null) {
            // User not found, register the user
            User newUser = new User(userD.creatId() + 1, userFBDto.getName(), userFBDto.getId(), 2, solve(userFBDto.getName()), null, null, null, userFBDto.getEmail(), null);
            userD.insert(newUser);
            String url = "/WEB-INF/book/login.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);


        }
        if (user2 == null) {
            // User not found, register the user

            String url = "/WEB-INF/book/login.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);


        }    else if (user2.getRole() == 1) {
            session.setAttribute("admin", user);
            String url = "/WEB-INF/admin/jsp/index.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } else {
            session.setMaxInactiveInterval(30 * 60);
            session.setAttribute("userC", user);
            String url = "/WEB-INF/book/index.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
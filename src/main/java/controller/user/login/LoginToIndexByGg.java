package controller.user.login;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import database.UserDAO;
import model.User;
import model.UserGoogleDto;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import util.Constants;
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
@WebServlet(name = "LoginToIndexByGg", value = "/LoginToIndexByGg")
public class LoginToIndexByGg extends HttpServlet {
    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        return new Gson().fromJson(response, UserGoogleDto.class);
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        UserGoogleDto userGoogleDto = getUserInfo(accessToken);
        String userEmail = userGoogleDto.getEmail();
        System.out.println(userGoogleDto);
        UserDAO userDao = new UserDAO();
        User user = userDao.selectByEmail2(userEmail); // Make sure this method is implemented in UserDAO
        String password = PasswordEncryption.toSHA1(userGoogleDto.getId());
        HttpSession session = request.getSession();
        UserDAO userDao2 = new UserDAO(request);
        User user2 = userDao2.selectByUsernamePassword(userGoogleDto.getName(), password);
        if (user == null) {
            // User not found, register the user
            User newUser = new User(userDao.creatId() + 1, userGoogleDto.getName(), userGoogleDto.getId(), 2, solve(userGoogleDto.getName()), null, null, null, userGoogleDto.getEmail(), null);
            userDao.insert(newUser);

            // Redirect to login page
            String url = "/WEB-INF/book/login.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
        }
        if (user2 == null) {
            // User not found, register the user


            // Redirect to login page
            String url = "/WEB-INF/book/login.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
        } else {
            // User found, log them in
            if (user2.getRole() == 1) {
                session.setAttribute("admin", user);
                String url = "/WEB-INF/admin/jsp/index.jsp";

                // Redirect to admin index page
                RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                dispatcher.forward(request, response);
            } else {
                session.setMaxInactiveInterval(30 * 60);
                session.setAttribute("userC", user);
                // Redirect to user index page
                String url = "/WEB-INF/book/index.jsp";

                // Redirect to admin index page
                RequestDispatcher dispatcher = request.getRequestDispatcher(url);
                dispatcher.forward(request, response);
            }
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
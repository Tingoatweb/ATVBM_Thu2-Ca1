package controller.user.rating;

import database.ProductDAO;
import database.RatingDAO;
import model.Product;
import model.Rating;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "RatingProduct", value = "/RatingProduct")
public class RatingProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        double rating = Double.parseDouble(request.getParameter("rating")); // Lấy giá trị của ngôi sao được chọn từ request
        String textarea = request.getParameter("textarearating");
        int productid = Integer.parseInt(request.getParameter("pid"));
        Product pr = new ProductDAO().selectById(productid);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userC");
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        long dateRating = date.getTime() / 1000; // Convert Date to Unix timestamp

        RatingDAO dao = new RatingDAO();
        Rating r = new Rating(dao.creatId() + 1, pr, user, rating, textarea, dateRating);
        dao.insert(r);
        ProductDAO proDao = new ProductDAO();
        RatingDAO raDao = new RatingDAO();
        double average = raDao.getAverageRatingByProductId(productid);
        int sumr = raDao.getSumRatingByProductId(productid);
        Product pro = proDao.selectById(productid);
        int samecategory = proDao.selectCategoryId(productid);
        List<Product> arr = proDao.selectSameCategory(samecategory);
        int five = raDao.getAverageRatingsByProductId(5.0, productid);
        int four = raDao.getAverageRatingsByProductId(4.0, productid);
        int three = raDao.getAverageRatingsByProductId(3.0, productid);
        int two = raDao.getAverageRatingsByProductId(2.0, productid);
        int one = raDao.getAverageRatingsByProductId(1.0, productid);
        request.setAttribute("five", five);
        request.setAttribute("four", four);
        request.setAttribute("three", three);
        request.setAttribute("two", two);
        request.setAttribute("one", one);
        request.setAttribute("sumrating", sumr);
        request.setAttribute("average", average);
        request.setAttribute("detail", pro);
        request.setAttribute("proCa", arr);
        response.sendRedirect(request.getContextPath() + "/Shopdetails?id=" + productid);
    }
}
package controller.user.product;
import database.ProductDAO;
import database.RatingDAO;
import model.Product;
import model.Rating;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "Shopdetails", value = "/Shopdetails")
public class Shopdetails extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User auth = (User) request.getAttribute("userC");
        int id = Integer.parseInt(request.getParameter("id"));
        String ratingstr = request.getParameter("star");
        int rating = 0;

        if (ratingstr != null && !ratingstr.isEmpty()) {
            try {
                rating = Integer.parseInt(ratingstr);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        ProductDAO proDao = new ProductDAO();
        RatingDAO raDao = new RatingDAO();
        ArrayList<Rating> ratings = new RatingDAO().selectRByproductid(id);
        double average = raDao.getAverageRatingByProductId(id);
        int five = raDao.getAverageRatingsByProductId(5.0, id);
        int four = raDao.getAverageRatingsByProductId(4.0, id);
        int three = raDao.getAverageRatingsByProductId(3.0, id);
        int two = raDao.getAverageRatingsByProductId(2.0, id);
        int one = raDao.getAverageRatingsByProductId(1.0, id);
        ArrayList<Product> products = proDao.selectAll();
        int sumr = raDao.getSumRatingByProductId(id);
        Product pro = proDao.selectById(id);
        int samecategory = proDao.selectCategoryId(id);
        List<Product> arrCa = proDao.selectSameCategory(samecategory);
        List<Rating> userating;

        if (ratingstr == null || ratingstr.isEmpty()) {
            userating = raDao.selectNameFromRatings(id);
        } else {
            userating = raDao.selectStarFromRatings(id, rating);
        }

        int pageR, numpageR = 6;
        int size = userating.size();
        int numR = (size % numpageR == 0) ? (size / numpageR) : ((size / numpageR) + 1);
        String xpageR = request.getParameter("pageR");

        if (xpageR == null || xpageR.isEmpty()) {
            pageR = 1;
        } else {
            try {
                pageR = Integer.parseInt(xpageR);
            } catch (NumberFormatException e) {
                pageR = 1;
            }
        }

        HttpSession session = request.getSession();
        int start = (pageR - 1) * numpageR;
        int end = Math.min(pageR * numpageR, size);
        List<Rating> list = raDao.getListByPage(userating, start, end);

        session.setAttribute("userating", list);
        session.setAttribute("listRatings", ratings);
        session.setAttribute("pageR", pageR);
        session.setAttribute("numR", numR);

        request.setAttribute("sumrating", sumr);
        session.setAttribute("average", average);
        session.setAttribute("detail", pro);
        session.setAttribute("five", five);
        session.setAttribute("four", four);
        session.setAttribute("three", three);
        session.setAttribute("two", two);
        session.setAttribute("one", one);
        session.setAttribute("productid", id);
        request.setAttribute("proCa", arrCa);
        session.setAttribute("Products", products);

        String url = "/WEB-INF/book/shop-details.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
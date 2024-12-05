package controller.user.search;

import database.ProductDAO;
import database.RatingDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import util.FormatCurrency;

@WebServlet(name = "SearchByAjax", value = "/SearchByAjax")
public class SearchByAjax extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();
        String productName = request.getParameter("productName");

        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> products = new ArrayList<>();
        if (productName == null || productName.trim().isEmpty()) {
            products = productDAO.selectAll(); // Return all products if no search term is provided
        } else {
            products = productDAO.selectByProductName(productName); // Perform search with the given product name
        }
        System.out.println(products.size() + "kich thuoc");

        session.setAttribute("listProduct", products);

        session.setAttribute("searchKeyword", productName);
        RatingDAO rating = new RatingDAO();
        Product ps = productDAO.selectByName(productName);
        double averageRating = rating.getAverageRatingByProductId(ps.getProductId());
        int integerPart = (int) averageRating;
        double decimalPart = averageRating - integerPart;
        int decimalPartRounded = (int) Math.round(decimalPart * 10);
//        PrintWriter out = response.getWriter();
//		for(Product p:listProductSearchByName){
//            out.println("<div class=\"col-lg-4 col-md-6 col-sm-6\">\n" +
//                    "    <div class=\"product__item\">\n" +
//                    "        <div class=\"product__item__pic\">\n" +
//                    "            <img class=\"product-image\" src=\"/image/" + p.getImage() + "\" width=\"180px\" height=\"250px\" alt=\"" + p.getProduct_name() + "\">\n" +
//                    "            <ul class=\"product__item__pic__hover\">\n" +
//                    "                <li><a href=\"#\"><i class=\"fa fa-heart\"></i></a></li>\n" +
//                    "                <li><a href=\"Shopdetails?id=" + p.getProductId() + "\"><i class=\"fa fa-info-circle\"></i></a></li>\n" +
//                    "                <li>\n" +
//                    "                    <form class=\"add-to-cart-form\" action=\"AddToCart\" method=\"post\" id=\"addToCartForm\">\n" +
//                    "                        <input type=\"hidden\" name=\"productId\" value=\"" + p.getProductId() + "\">\n" +
//                    "                        <button class=\"submit-button\" type=\"submit\">\n" +
//                    "                            <c:choose>\n" +
//                    "                                <c:when test=\"${not empty sessionScope.userC.name || not empty sessionScope.admin.name}\">\n" +
//                    "                                    <a href=\"#\"><i class=\"fa fa-shopping-cart\"></i></a>\n" +
//                    "                                </c:when>\n" +
//                    "                                <c:otherwise>\n" +
//                    "                                    <a href=\"Login\"><i class=\"fa fa-shopping-cart\"></i></a>\n" +
//                    "                                </c:otherwise>\n" +
//                    "                            </c:choose>\n" +
//                    "                        </button>\n" +
//                    "                    </form>\n" +
//                    "                </li>\n" +
//                    "            </ul>\n" +
//                    "        </div>\n" +
//                    "        <div class=\"product__item__text\">\n" +
//                    "            <h6>" + p.getProduct_name() + "</h6>\n" +
//                    "            <ul class=\"Ratestar\">\n" +
//                    "                <c:set var=\"averageRating\" value=\"${rating.getAverageRatingByProductId(p.productId)}\" />\n" +
//                    "                <c:set var=\"integerPart\" value=\"${averageRating.intValue()}\" />\n" +
//                    "                <c:set var=\"decimalPart\" value=\"${averageRating - integerPart}\" />\n" +
//                    "                <c:choose>\n" +
//                    "                    <c:when test=\"${averageRating == 0}\">\n" +
//                    "                        <c:forEach var=\"digit\" begin=\"1\" end=\"5\">\n" +
//                    "                            <img data-src=\"img/image/number not rating.png\" lazy width=\"16px\" height=\"16px\">\n" +
//                    "                        </c:forEach>\n" +
//                    "                    </c:when>\n" +
//                    "                    <c:otherwise>\n" +
//                    "                        <c:if test=\"${integerPart >= 1 && integerPart <= 5 && decimalPart == 0}\">\n" +
//                    "                            <c:forEach var=\"digit\" begin=\"1\" end=\"${integerPart}\">\n" +
//                    "                                <img data-src=\"img/image/number.0 rating.png\" lazy width=\"16px\" height=\"16px\">\n" +
//                    "                            </c:forEach>\n" +
//                    "                            <c:forEach var=\"digit\" begin=\"${integerPart + 1}\" end=\"5\">\n" +
//                    "                                <img data-src=\"img/image/number not rating.png\" lazy width=\"16px\" height=\"16px\">\n" +
//                    "                            </c:forEach>\n" +
//                    "                        </c:if>\n" +
//                    "                        <c:if test=\"${integerPart >= 1 && integerPart <= 5 && decimalPart != 0}\">\n" +
//                    "                            <c:forEach var=\"digit\" begin=\"1\" end=\"${integerPart}\">\n" +
//                    "                                <img data-src=\"img/image/number.0 rating.png\" lazy width=\"16px\" height=\"16px\">\n" +
//                    "                            </c:forEach>\n" +
//                    "                            <c:set var=\"decimalPartRounded\" value=\"${Math.round(decimalPart * 10)}\" />\n" +
//                    "                            <img src=\"img/image/number." + decimalPartRounded + " rating.png\" width=\"16px\" height=\"16px\" alt=\"\">\n" +
//                    "                            <c:forEach var=\"digit\" begin=\"${integerPart + 2}\" end=\"5\">\n" +
//                    "                                <img data-src=\"img/image/number not rating.png\" lazy width=\"16px\" height=\"16px\">\n" +
//                    "                            </c:forEach>\n" +
//                    "                        </c:if>\n" +
//                    "                    </c:otherwise>\n" +
//                    "                </c:choose>\n" +
//                    "                <li class=\"Stick\"></li>\n" +
//                    "                <li class=\"Productnotsell\">Còn lại " + p.getQuantity() + "</li>\n" +
//                    "            </ul>\n" +
//                    "            <h5>" + FormatCurrency.formatCurrency(p.getPrice()) + "</h5>\n" +
//                    "        </div>\n" +
//                    "    </div>\n" +
//                    "</div>");
//		}
        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
            request.getRequestDispatcher("/WEB-INF/book/shop-grid.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/book/shop-grid.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);

    }
}
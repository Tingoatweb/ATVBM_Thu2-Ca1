package controller.user.product;

import database.ProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FilterCategory", value = "/FilterCategory")
public class FilterCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        String categoryname = request.getParameter("caname");
        String sort = request.getParameter("sort");
        String orderBy = null;
        if ("asc".equals(sort)) {
            orderBy = "ASC";
        } else if ("desc".equals(sort)) {
            orderBy = "DESC";
        }
        ProductDAO proDao = new ProductDAO();
        ArrayList<Product> arr = proDao.selectByCategoryName(categoryname, orderBy);

        int numpage = 6;
        int size = arr.size();
        int num = (size % numpage == 0) ? (size / numpage) : ((size / numpage) + 1);

        String xpage = request.getParameter("page");
        int page = 1; // Default to page 1

        if (xpage != null && !xpage.isEmpty()) {
            page = Integer.parseInt(xpage);
        }

        int start = (page - 1) * numpage;
        int end = Math.min(page * numpage, size);

// Get the sublist of products for the current page
        List<Product> list = arr.subList(start, end);

// Store the list of products, current page, and total number of pages in the session
        HttpSession session = request.getSession();
        session.setAttribute("listProduct", list);
        session.setAttribute("page", page);
        session.setAttribute("num", num);


//        PrintWriter out = response.getWriter();
//        for (Product p : arr) {
//            out.println("<div class=\"col-lg-4 col-md-6 col-sm-6\">\n" +
//                    "                            <div class=\"product__item\">\n" +
//                    "                                <div class=\"product__item__pic set-bg\" > <!--data-setbg=\"\"-->\n" +
//                    "                                    <img src=\"img/image/" +p.getImage() + "\">\n" +
//                    "                                    <ul class=\"product__item__pic__hover\">\n" +
//                    "                                        <li><a href=\"#\"><i class=\"fa fa-heart\"></i></a></li>\n" +
//                    "                                        <li><a href=\"Shopdetails?id= " +p.getProductId() + "\"><i class=\"fa fa-info-circle\"></i></a></li>\n" +
//                    "                                        <li>\n" +
//                    "                                            <form class=\"add-to-cart-form\" action=\"AddToCart\" method=\"post\" id=\"addToCartForm\">\n" +
//                    "                                                <input type=\"hidden\" name=\"productId\" value=\"" + p.getProductId() + "\">\n" +
//                    "                                                <button class=\"submit-button\" type=\"submit\">\n" +
//                    "                                                    <a href=\"#\"><i class=\"fa fa-shopping-cart\"></i></a>\n" +
//                    "                                                </button>\n" +
//                    "                                            </form>\n" +
//                    "                                        </li>\n" +
//                    "                                    </ul>\n" +
//                    "                                </div>\n" +
//                    "                                <div class=\"product__item__text\">\n" +
//                    "                                    <h6><a href=\"#\">"+p.getProduct_name() + "</a></h6>\n" +
//                    "                                    <ul class=\"Ratestar\">\n" +
//                    "                                        <li><i class=\"fa fa-star\"></i></li>\n" +
//                    "                                        <li><i class=\"fa fa-star\"></i></li>\n" +
//                    "                                        <li><i class=\"fa fa-star\"></i></li>\n" +
//                    "                                        <li><i class=\"fa fa-star\"></i></li>\n" +
//                    "                                        <li><i class=\"fa fa-star\"></i></li>\n" +
//                    "                                        <li class=\"Stick\"></li>\n" +
//                    "                                    <li class=\"Productnotsell\">Còn lại 5</li>\n" +
//                    "\n" +
//                    "                                    </ul>\n" +
//                    "                                    <h5>"+ FormatCurrency.formatCurrency(p.getPrice()) + "</h5>\n" +
//                    "                                </div>\n" +
//                    "                            </div>\n" +
//                    "                        </div>");
//        }
        String url = "/WEB-INF/book/shop-filter.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
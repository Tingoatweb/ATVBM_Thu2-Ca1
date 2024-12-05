package controller.user.product;

import database.CategoryDAO;
import database.ProductDAO;
import database.RatingDAO;
import model.Category;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "Shopgrid", value = "/Shopgrid")
public class Shopgrid extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> categories = categoryDAO.selectCategoriesWithProducts();
        HttpSession session = request.getSession();
        session.setAttribute("list", categories);

        ProductDAO productDAO = new ProductDAO();
        ArrayList<Product> products;
        Map<Integer, Integer> topProducts = productDAO.topNBestProduct(10);

        RatingDAO raDao = new RatingDAO();
        String category = request.getParameter("category");
        String sort = request.getParameter("sort");
        String orderBy = null;
        if ("asc".equals(sort)) {
            orderBy = "ASC";
        } else if ("desc".equals(sort)) {
            orderBy = "DESC";
        }

        if (category != null && !category.isEmpty()) {
            products = productDAO.selectByCategoryName(category, orderBy);
        } else {
            products = productDAO.selectAllOrder(orderBy);
        }


        int page, numpage = 12;
        int size = products.size();
        int num = (size % numpage == 0) ? (size / numpage) : ((size / numpage) + 1);
        String xpage = request.getParameter("page");

        if (xpage == null || xpage.isEmpty()) {
            page = 1;
        } else {
            page = Integer.parseInt(xpage);
        }

        int start = (page - 1) * numpage;
        int end = Math.min(page * numpage, size);
        List<Product> list = productDAO.getListByPage(products, start, end);

        session.setAttribute("listProduct", list);
        session.setAttribute("listProducts", products);
        session.setAttribute("page", page);
        session.setAttribute("num", num);
        session.setAttribute("selectedCategory", category);
        session.setAttribute("sortOrder", sort);
        session.setAttribute("sortSelect", sort);
        String accept = request.getHeader("Accept");
        if (accept != null && accept.contains("application/json")) {
            response.setContentType("application/json");
            // Return JSON if needed
        } else if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
            request.getRequestDispatcher("/WEB-INF/book/shop-grid.jsp").forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/book/shop-grid.jsp");
            dispatcher.forward(request, response);



//        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
//            request.getRequestDispatcher("/WEB-INF/book/shop-grid.jsp").forward(request, response);
//        } else {
//            request.getRequestDispatcher("/WEB-INF/book/shop-grid.jsp").forward(request, response);
//
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
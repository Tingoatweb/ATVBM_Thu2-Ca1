package controller.admin.product;

import database.ProductDAO;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RemoveCheckProduct", value = "/RemoveCheckProduct")
public class RemoveCheckProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User auth = (User) request.getSession().getAttribute("admin");
        if (auth == null) {
            // User not authenticated, redirect to the login page
            response.sendRedirect("Login");
            return; // Stop further processing
        }
        StringBuilder productIds = new StringBuilder();
        for(String proid:request.getParameterValues("selectedProducts")) {
            productIds.append("'").append(proid).append("',");
        }
        productIds.deleteCharAt(productIds.length()-1);
        ProductDAO dao = new ProductDAO();
        dao.deleteProducts(productIds);
        response.sendRedirect("ListProduct");
    }
    }

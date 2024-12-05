package controller.admin.product;

import database.ProductDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteProduct", value = "/DeleteProduct")
public class DeleteProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        System.out.println("id"+id);
        ProductDAO productDAO = new ProductDAO(request);
        productDAO.delete(productDAO.selectById(Integer.parseInt(id)));
        request.getRequestDispatcher("/WEB-INF/admin/jsp/listProduct.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
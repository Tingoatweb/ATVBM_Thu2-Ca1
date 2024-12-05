package controller.admin.warehouse;

import database.ImportDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteImport", value = "/DeleteImport")
public class DeleteImport extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        System.out.println("id"+id);
        ImportDAO importDAO = new ImportDAO(request);
        importDAO.delete(importDAO.selectById(Integer.parseInt(id)));
        request.getRequestDispatcher("/WEB-INF/admin/jsp/listImport.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
package controller.admin.warehouse;

import database.ImportDAO;
import database.ImportDetailDAO;
import database.ProductDAO;
import model.Import;
import model.ImportDetail;
import model.Product;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ImportOrder", value = "/ImportOrder")
public class ImportOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] productIds = request.getParameterValues("productId");
        String[] productNames = request.getParameterValues("product_name");
        String[] quantities = request.getParameterValues("numberOfWarehouses");
        String[] unitPrices = request.getParameterValues("unitPrice");
        int length = productIds.length;
        
        List<ImportDetail>importDetails = new ArrayList<>();
        ProductDAO productDAO = new ProductDAO();

        ImportDAO importDAO = new ImportDAO();
        ImportDetailDAO importDetailDAO = new ImportDetailDAO();

        User user = (User) request.getSession().getAttribute("userC");
        Import importClass= new Import(importDAO.creatId(), user, "ncc1", "khong co gi",
                new Date(2024, 01, 12) );

        System.out.println("action");
        double total = 0;
        for (int i=0; i<length; i++){
            int id = Integer.parseInt(productIds[i]);
            int quantity = Integer.parseInt(quantities[i]);
            double unitPrice = Double.parseDouble(unitPrices[i]);
            double totalPrice = quantity*unitPrice;
            System.out.println("unitPrice"+unitPrice);
            System.out.println("quantity"+quantity);
            total+=totalPrice;
            System.out.println("total: "+total);
            ImportDetail item = new ImportDetail(importDetailDAO.creatId(), importClass,
                    productDAO.selectById(id),quantity , unitPrice, totalPrice);
            importDetails.add(item);


            importDetailDAO.insert(item);

        }
        importClass.setTotalPrice(total);
        importClass.setImportDetailList(importDetails);
        importDAO.insert(importClass);
        request.getRequestDispatcher("/WEB-INF/admin/jsp/warehouse.jsp").forward(request,response);
    }
}
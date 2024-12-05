package controller.admin.warehouse;

import database.ImportDAO;
import database.ImportDetailDAO;
import database.ProductDAO;
import model.Import;
import model.ImportDetail;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.net.URLDecoder;

@WebServlet(name = "CompleteOrderServlet", value = "/CompleteOrderServlet")
public class CompleteOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("done do post");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
            System.out.println("line: "+ line);
        }
        reader.close();

        String data = URLDecoder.decode(sb.toString(), "UTF-8");
        data = data.substring(1, data.length()-2);
        String[] importDetails = data.split(","); // Sử dụng split("/") để tách chuỗi thành mảng dữ liệu

        //them vao database
        ImportDAO importDAO = new ImportDAO(request);
        ImportDetailDAO importDetailDAO = new ImportDetailDAO();
        ProductDAO productDAO = new ProductDAO(request);

        User user = (User) request.getSession().getAttribute("admin");
        System.out.println("id: "+ user.getUserId());

        long millis=System.currentTimeMillis();
        java.sql.Date date=new java.sql.Date(millis);
        int import_id = importDAO.creatId();

        String notes = importDetails[0];
        String decodedPart = URLDecoder.decode(notes, "UTF-8");
        String[]dataDetail2 = decodedPart.split("-");
        String note = dataDetail2.length > 5 ? dataDetail2[5] : "";

        Import importClass= new Import(import_id, user, "ncc1", note, date );
        importDAO.insert(importClass);


        System.out.println("action");
        double total = 0;
        for (String part : importDetails) {
             decodedPart = URLDecoder.decode(part, "UTF-8");

            System.out.println(decodedPart);
            String[]dataDetail = decodedPart.split("-");

                int idProduct = Integer.parseInt(dataDetail[0]);
                String nameProduct = dataDetail[1];
                int quantity = Integer.parseInt(dataDetail[2]);

                double unitPrice = Double.parseDouble(dataDetail[3]);


            double totalPrice = quantity*unitPrice;
            System.out.println("unitPrice"+unitPrice);
            System.out.println("quantity"+quantity);
            total+=totalPrice;
            System.out.println("total: "+total);
            ImportDetail item = new ImportDetail(importDetailDAO.creatId(), importClass,
                    productDAO.selectById(idProduct),quantity , unitPrice, quantity*unitPrice);

            importDetailDAO.insert(item);

            productDAO.updateQuantityIncrease(idProduct, quantity);

        }
        System.out.println(1);
        importDAO.updatePrice(import_id, total);
        System.out.println(2);
        // Lưu trữ và xử lý dữ liệu ở đây

    }

}

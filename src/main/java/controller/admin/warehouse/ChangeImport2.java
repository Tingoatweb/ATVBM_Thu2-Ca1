package controller.admin.warehouse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import database.ChangePriceDAO;
import database.ImportDAO;
import database.ImportDetailDAO;
import database.ProductDAO;
import model.ChangePrice;
import model.Import;
import model.ImportDetail;
import model.Product;
import model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ChangeImport2", value = "/ChangeImport2")
public class ChangeImport2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        try (PrintWriter out = response.getWriter();
             BufferedReader reader = request.getReader()) {

            StringBuilder jsonBuilder = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                jsonBuilder.append(line);
            }
            String jsonData = jsonBuilder.toString();

            if (jsonData == null || jsonData.isEmpty()) {
                // Handle case where jsonData is empty or null
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.println("Empty JSON data received");
                return;
            }

            Gson gson = new Gson();
            List<ChangeImport2.Item> items = gson.fromJson(jsonData, new TypeToken<List<ChangeImport2.Item>>(){}.getType());

            ImportDAO importDAO = new ImportDAO(request);
            ImportDetailDAO importDetailDAO = new ImportDetailDAO();
            ProductDAO productDAO = new ProductDAO(request);
            ChangePriceDAO changePriceDAO = new ChangePriceDAO();

            User user = (User) request.getSession().getAttribute("admin");

            long millis = System.currentTimeMillis();
            java.sql.Date date = new java.sql.Date(millis);
            int import_id = items.get(0).getImportId();
            String notes = items.get(0).note;
            String ncc = items.get(0).ncc;

            Import importClass = new Import(import_id, user, ncc, notes, date);
//            importDAO.update(importClass);

            double total = 0;
            for (ChangeImport2.Item item : items) {
                int idProduct = Integer.parseInt(item.getProductId());

                Product product = productDAO.selectById(idProduct);
                double unitPrice = item.getUnitPrice();

                //lay gia nhap cu ra
                double oldPrice = product.getUnitPrice();

                //neu gia nhap cu khac gia nhap moi thi luu vao bang doi gia
                //doi lai gia nhap hien tai trong database
                if(oldPrice!= unitPrice){
                    ChangePrice changePrice = new ChangePrice(user, product, (int) oldPrice, (int) unitPrice, date);
                    changePriceDAO.insert(changePrice);
                    productDAO.updateImportPrice(product.getProductId(), unitPrice);
                }

                int quantity = item.getNumberOfWarehouses();


                double totalPrice = quantity * unitPrice;
                total += totalPrice;

                model.ImportDetail importDetail = new ImportDetail(importDetailDAO.creatId(), importClass,
                        product, quantity, unitPrice, totalPrice);

                importDetailDAO.insert(importDetail);
                productDAO.updateQuantityIncrease(idProduct, quantity);
            }

            importClass.setTotalPrice(total);
            importDAO.update(importClass);

            // Send response to client
            out.println(gson.toJson("Success"));
            out.flush();
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            e.printStackTrace();
        }
    }

    class Item {
        private String productId;
        private String productName;
        private int numberOfWarehouses;
        private double unitPrice;
        private double totalPrice;
        private String note;
        private String ncc;

        private int importId;

        // Các getter và setter
        public String getProductId() {
            return productId;
        }

        public void setProductId(String productId) {
            this.productId = productId;
        }

        public String getProductName() {
            return productName;
        }

        public void setProductName(String productName) {
            this.productName = productName;
        }

        public int getNumberOfWarehouses() {
            return numberOfWarehouses;
        }

        public void setNumberOfWarehouses(int numberOfWarehouses) {
            this.numberOfWarehouses = numberOfWarehouses;
        }

        public double getUnitPrice() {
            return unitPrice;
        }

        public void setUnitPrice(double unitPrice) {
            this.unitPrice = unitPrice;
        }

        public double getTotalPrice() {
            return totalPrice;
        }

        public void setTotalPrice(double totalPrice) {
            this.totalPrice = totalPrice;
        }

        public String getNote() {
            return note;
        }

        public void setNote(String note) {
            this.note = note;
        }

        public String getNcc() {
            return ncc;
        }

        public void setNcc(String ncc) {
            this.ncc = ncc;
        }

        public int getImportId() {
            return importId;
        }

        public void setImportId(int importId) {
            this.importId = importId;
        }
    }
}
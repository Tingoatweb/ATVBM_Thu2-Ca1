package controller.admin.product;

import database.ProductDAO;
import model.Product;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Map;

@WebServlet(name = "ListProductByDay2", value = "/ListProductByDay2")
public class ListProductByDay2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // Lấy ngày từ request parameter
            String ngayString = request.getParameter("ngay");
            Date ngay = Date.valueOf(ngayString); // Chuyển đổi từ String sang Date

            // Gọi phương thức DAO để lấy dữ liệu sản phẩm theo ngày
            ProductDAO productDAO = new ProductDAO(); // Sử dụng DAO thực tế của bạn
            Map<Integer, Integer> productMap = productDAO.selectProductByDay(ngay);

            // Tạo một mảng JSON chứa các sản phẩm
            JSONArray jsonArray = new JSONArray();
            for (Map.Entry<Integer, Integer> entry : productMap.entrySet()) {
                int productId = entry.getKey();
                int quantity = entry.getValue();
                Product product = productDAO.selectById(productId);

                System.out.println(productId);
                // Tạo một đối tượng JSON cho từng sản phẩm
                JSONObject jsonProduct = new JSONObject();
                jsonProduct.put("productId", productId);
                jsonProduct.put("productName", product.getProduct_name());
                jsonProduct.put("image", "/image/" + product.getImage());
                jsonProduct.put("price", product.getPrice());
                jsonProduct.put("quantity", quantity);

                jsonArray.put(jsonProduct);
            }

            // Send response
            response.setContentType("application/json");
            response.getWriter().write(jsonArray.toString());

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
package controller.admin.product;

import com.google.gson.Gson;
import database.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;

@WebServlet(name = "GetListProduct", value = "/GetListProduct")
public class GetListProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO productDAO = new ProductDAO();
        Map<Integer, Integer> map = productDAO.inventoryProduct2();

        Set<Integer> set = map.keySet();
        for (Integer key : set) {
            Product product = productDAO.selectById(key);
            product.setQuantity(map.get(key));
        }


        ArrayList<Product> products = productDAO.selectAll();
        // Chuyển đổi danh sách sản phẩm thành chuỗi JSON
        Gson gson = new Gson();
        String jsonProducts = gson.toJson(products);

        // Gửi phản hồi JSON về client
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonProducts);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
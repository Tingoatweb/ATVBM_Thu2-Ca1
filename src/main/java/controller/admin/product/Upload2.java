package controller.admin.product;

import database.ProductDAO;
import model.Product;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;

@WebServlet(name = "Upload2", value = "/Upload2")
public class Upload2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("da qua");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Read JSON data from request
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            System.out.println("line: "+ line);
            sb.append(line);
        }
        reader.close();

        try {
            // Parse JSON data
            JSONObject jsonObject = new JSONObject(sb.toString());
            JSONArray productNamesArray = jsonObject.getJSONArray("productNames");

            // Create a sample response (replace with actual logic)
            JSONArray responseArray = new JSONArray();
            JSONArray noProductArray = new JSONArray();

            ProductDAO productDAO = new ProductDAO();
            int count =0;

            for (int i = 0; i < productNamesArray.length(); i++) {
                String productName = productNamesArray.getString(i);
                 Product product2= productDAO.selectByName(productName);
                 if(product2!=null) {
                     JSONObject product = new JSONObject();
                     product.put("product_id", product2.getProductId());
                     product.put("product_name", product2.getProduct_name());
                     product.put("quantity", 1); // Sample quantity
                     product.put("unitPrice", product2.getUnitPrice()); // Sample unit price
                     responseArray.put(product);
                 }else{
                     count++;
                     JSONObject noproduct = new JSONObject();
                     noproduct.put("stt", count);
                     noproduct.put("product_name", productName);
                     noProductArray.put(noproduct);
                 }

            }

            // Send response
//            response.setContentType("application/json");
//            response.getWriter().write(responseArray.toString());

            // Combine both arrays into a single JSON object
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("products", responseArray);
            jsonResponse.put("noProducts", noProductArray);

// Send JSON response
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse.toString());

        } catch (JSONException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Invalid JSON data.");
        }
    }
}
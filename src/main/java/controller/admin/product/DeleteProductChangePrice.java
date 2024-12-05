package controller.admin.product;

import database.ChangePriceDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteProductChangePrice", value = "/DeleteProductChangePrice")
public class DeleteProductChangePrice extends HttpServlet {
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
        StringBuilder itemId = new StringBuilder();
        for(String proid:request.getParameterValues("selectedItem")) {
            itemId.append("").append(proid).append(",");
        }
        itemId.deleteCharAt(itemId.length()-1);
        String id = itemId.toString();
        System.out.println("id sp xoa: ");
        System.out.println(id);
        id.replace("'", "");
        // Tách chuỗi thành mảng các chuỗi con, cách nhau bởi dấu phẩy
        String[] parts = id.split(",");

        // Khai báo mảng số nguyên để lưu kết quả
        int[] numbers = new int[parts.length];

        // Chuyển đổi từng chuỗi thành số nguyên và lưu vào mảng numbers
        for (int i = 0; i < parts.length; i++) {
            numbers[i] = Integer.parseInt(parts[i].trim());
            ChangePriceDAO dao = new ChangePriceDAO();
            dao.delete(numbers[i]);
        }


        //int itemId2 = Integer.parseInt(id);

        response.sendRedirect("ChangePrice");
    }
}
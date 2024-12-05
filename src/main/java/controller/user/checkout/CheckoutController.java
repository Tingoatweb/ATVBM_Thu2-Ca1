package controller.user.checkout;

import com.fasterxml.jackson.databind.ObjectMapper;
import database.*;
import model.*;
import org.json.JSONArray;
import org.json.JSONObject;
import util.ConfigUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CheckoutController", value = "/CheckoutController")
public class CheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String fullNameTinh = request.getParameter("tinh");
        String fullNameQuan = request.getParameter("quan");
        String fullNamePhuong = request.getParameter("phuong");
        OrderDAO orderdao = new OrderDAO();

        String address = request.getParameter("address");
        String fullAddress = fullNameTinh + ", " + fullNameQuan + ", " + fullNamePhuong + ", " + address;
        String note = request.getParameter("note");
        String phone = request.getParameter("phone");
        String name = request.getParameter("nameConsignee");
        String paymentIdString = request.getParameter("payment");
        int paymentId = Integer.parseInt(paymentIdString);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userC");

        if (user == null) {
            String url = request.getContextPath() + "/WEB-INF/book/logintwo.jsp";
            RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            dispatcher.forward(request, response);
            return;
        }

        Cart cart = (Cart) session.getAttribute("cart");
        int totalQuantity = cart.getCart_items().stream().mapToInt(CartItem::getQuantity).sum();

        int shippingCost = "Hồ Chí Minh".equals(fullNameTinh) ? 20000 * totalQuantity : 40000 * totalQuantity;

        double cartTotal = cart.calculateTotal();

        Double discountValue = (Double) session.getAttribute("discountValue");
        Integer discountType = (Integer) session.getAttribute("discountType"); // Assuming discountType is saved in session
        double discount = (discountValue != null) ? discountValue : 0.0;

// Calculate the new total based on discount type
        double newTotal;
        if (discountType != null && discountType == 1) {
            // Percentage discount
            newTotal = cartTotal - (cartTotal * discount / 100);
        } else if (discountType != null && discountType == 2) {
            // Fixed amount discount
            newTotal = cartTotal - discount;
        } else {
            // No discount
            newTotal = cartTotal;
        }

        double allTotal = newTotal + shippingCost;


        OrderDAO orderDAO = new OrderDAO();
        PaymentDAO paymentDAO = new PaymentDAO();
        Payment payment = paymentDAO.selectById(paymentId);
        StatusOrder statusOrder = new StatusOrder(1);

        Order order = new Order(orderDAO.creatId() + 1, user, allTotal, name, phone, fullAddress, payment, new Timestamp(System.currentTimeMillis()), note, shippingCost, statusOrder);
        order.setNameConsignee(name);
        order.setUser(user);
        order.setPhone(phone);
        order.setAddress(fullAddress);
        order.setNote(note);
        order.setTotalPrice(allTotal); // Ensure the total price includes the final amount

        session.setAttribute("orderBooking", order);
        int resultOrder = orderDAO.insert(order);

        if (resultOrder > 0) {
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            ProductDAO productDAO = new ProductDAO();
            int overallResult = 1;
            for (CartItem cartItem : cart.getCart_items()) {
                Product product = cartItem.getProduct();
                Integer selectedCouponId = (Integer) session.getAttribute("selectedCouponId");
                String appliedCouponCode = (String) session.getAttribute("appliedCouponCode");
                CouponDAO couponDAO = new CouponDAO();

                if (discount != 0) {
                    if (selectedCouponId != null) {
                        Coupon coupon = couponDAO.selectById(selectedCouponId);
                        couponDAO.updateQuantiyCouponById(selectedCouponId, coupon.getMaxQuantityUseOfUser() - 1, coupon.getMaxUseOfCoupon() - 1);
                    } else if (appliedCouponCode != null) {
                        Coupon coupon = couponDAO.selectByCode(appliedCouponCode);
                        int id = coupon.getCouponId();
                        couponDAO.updateQuantiyCouponById(id, coupon.getMaxQuantityUseOfUser() - 1, coupon.getMaxUseOfCoupon() - 1);
                    }
                }

                int quantityOrdered = cartItem.getQuantity();
                int remainingQuantity = product.getQuantity() - quantityOrdered;
                int resultUpQuantity = productDAO.updateQuantityOrder(product.getProductId(), remainingQuantity);
                if (resultUpQuantity > 0) {
                    double price = cartItem.getPrice();
                    double totalPrice = quantityOrdered * price;
                    OrderDetail orderDetail = new OrderDetail(orderDetailDAO.creatId() + 1, order, product, quantityOrdered, totalPrice);
                    int resultOrderDetail = orderDetailDAO.insert(orderDetail);

                    List<OrderDetail> orderDetailList = (List<OrderDetail>) session.getAttribute("orderDetails");
                    if (orderDetailList == null) {
                        orderDetailList = new ArrayList<>();
                    }
                    orderDetailList.add(orderDetail);
                    session.setAttribute("orderDetails", orderDetailList);

                    if (resultOrderDetail <= 0) {
                        overallResult = resultOrderDetail;
                        break;
                    }
                } else {
                    overallResult = resultUpQuantity;
                    break;
                }
            }
            if (overallResult > 0) {

//                String ghnResponse = sendOrderToGHN(order, cart);

                // Xóa giỏ hàng sau khi đặt hàng thành công
                cart.clearCart();
                if (paymentId == 1) {
                    request.getRequestDispatcher("/WEB-INF/book/Vnpay.jsp").forward(request, response);
                } else {
                    session.removeAttribute("appliedCouponCode");
                    session.removeAttribute("discountValue");
                    session.removeAttribute("discountType");
                    session.removeAttribute("discount");
                    session.removeAttribute("newTotal");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/book/thankyou.jsp");
                    dispatcher.forward(request, response);
                    return;
                }
            }
        }
        // Trả về kết quả
//        JsonObject jsonResponse = new JsonObject();
//        jsonResponse.addProperty("success", true);
//        jsonResponse.addProperty("newTotal", newTotal);
//        jsonResponse.addProperty("discount", discount);
        // Tạo ObjectMapper
        ObjectMapper objectMapper = new ObjectMapper();

        // Chuyển đối tượng Order thành chuỗi JSON
        String orderJson = objectMapper.writeValueAsString(order);

        // Lưu chuỗi JSON vào thuộc tính của request để sử dụng trong JSP hoặc gửi lại cho client
        request.setAttribute("orderJson", orderJson);
    }
    private String sendOrderToGHN(Order order, Cart cart) throws IOException {
        String token = ConfigUtil.getProperty("GHN_API_TOKEN");
        String apiUrl = "https://dev-online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/create";

        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json; utf-8");
        conn.setRequestProperty("Token", token);
        conn.setDoOutput(true);
        String sdt = "0926276226";
        // Tạo JSON từ thông tin đơn hàng
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("token", token);
        jsonObject.put("shop_id", "YOUR_SHOP_ID"); // Thay thế bằng mã shop của bạn
        jsonObject.put("from_name", "Tên người gửi");
        jsonObject.put("from_phone", sdt);
        jsonObject.put("to_name", order.getNameConsignee());
        jsonObject.put("to_phone", order.getPhone());
        jsonObject.put("to_address", order.getAddress());
        jsonObject.put("to_ward_code", "Phường 14");
        jsonObject.put("to_ward_name", "Phường 14"); // Thay thế bằng dữ liệu thực tế
        jsonObject.put("to_district_name", "Quận 10"); // Thay thế bằng dữ liệu thực tế
        jsonObject.put("cod_amount", order.getTotalPrice());
        jsonObject.put("content", "Sách");
        jsonObject.put("weight", 200); // Cân nặng ước tính
        jsonObject.put("length", 10); // Kích thước ước tính
        jsonObject.put("width", 10);
        jsonObject.put("height", 10);
        jsonObject.put("payment_type_id", 1); // Người gửi thanh toán
        jsonObject.put("required_note", "KHONGCHOXEMHANG");
        jsonObject.put("service_type_id", 2); // Chuyển phát thương mại điện tử
        jsonObject.put("service_id", 0); // Thay thế bằng mã dịch vụ thực tế nếu có

        JSONArray items = new JSONArray();
        for (CartItem item : cart.getCart_items()) {
            JSONObject productJson = new JSONObject();
            productJson.put("name", item.getProduct().getProduct_name());
            productJson.put("quantity", item.getQuantity());
            productJson.put("price", item.getPrice());
            items.put(productJson);
        }
        jsonObject.put("items", items);

        // In ra JSON để kiểm tra
        System.out.println("JSON Payload: " + jsonObject.toString());

        // Gửi yêu cầu
        try (OutputStream os = conn.getOutputStream()) {
            byte[] input = jsonObject.toString().getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        int status = conn.getResponseCode();
        if (status == 200) {
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
                StringBuilder response = new StringBuilder();
                String responseLine;
                while ((responseLine = br.readLine()) != null) {
                    response.append(responseLine.trim());
                }
                return response.toString();
            }
        } else {
            try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"))) {
                StringBuilder response = new StringBuilder();
                String responseLine;
                while ((responseLine = br.readLine()) != null) {
                    response.append(responseLine.trim());
                }
                System.out.println("GHN API error response: " + response.toString());
                throw new IOException("Error response from GHN API: " + response.toString());
            }
        }
    }
}

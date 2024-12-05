package database;

import model.*;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.*;

public class OrderDAO extends AbsDAO<Order>{
    private ArrayList<Order> data = new ArrayList<>();

    public OrderDAO(HttpServletRequest request) {
        super(request);
    }

    public OrderDAO() {

    }

    public int creatId() {
        data = selectAll();
        return data.size();
    }
    @Override
    public ArrayList<Order> selectAll() {
        ArrayList<Order> orders = new ArrayList<>();
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM orders";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                int idImport = rs.getInt("order_id");
                int idUser = rs.getInt("user_id");
                double totalPrice = rs.getDouble("total_price");
                String userConsignee = rs.getString("nameConsignee");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                int idPayment = rs.getInt("payment_id");
                Timestamp time = rs.getTimestamp("booking_date");
                String note = rs.getString("note");
                double shippingFee = rs.getDouble("shipping_fee");
                int status = rs.getInt("status_id");
                User u = new UserDAO().selectById(idUser);
                Payment pay = new PaymentDAO().selectById(idPayment);
                StatusOrder statusOrder = new StatusOrderDAO().selectById(status);
                Order order = new Order(idImport,u,totalPrice,userConsignee,phone,address,pay,time,note,shippingFee,statusOrder);


                orders.add(order);

            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orders;

    }
    public List<Order> selectOrderByStatus(int status){
        List<Order> orders = new ArrayList<>();
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "SELECT * FROM orders WHERE status_id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, status);
            ResultSet rs = st.executeQuery();
            while (rs.next()){
                int idImport = rs.getInt("order_id");
                int idUser = rs.getInt("user_id");
                double totalPrice = rs.getDouble("total_price");
                String userConsignee = rs.getString("nameConsignee");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                int idPayment = rs.getInt("payment_id");
                Timestamp time = rs.getTimestamp("booking_date");
                String note = rs.getString("note");
                double shippingFee = rs.getDouble("shipping_fee");
                int statusId = rs.getInt("status_id");
                User u = new UserDAO().selectById(idUser);
                Payment pay = new PaymentDAO().selectById(idPayment);
                StatusOrder statusOrder = new StatusOrderDAO().selectById(status);
                Order order = new Order(idImport,u,totalPrice,userConsignee,phone,address,pay,time,note,shippingFee,statusOrder);
                orders.add(order);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return orders;
    }
    public void updateStatusOrder(int orderId, StatusOrder status){
        int result = 0;
        try (Connection con = JDBCUtil.getConnection();
             PreparedStatement st = con.prepareStatement("UPDATE orders SET status_id = ? WHERE order_id = ?")) {

            st.setInt(1, status.getStatusId());
            st.setInt(2, orderId);
            result = st.executeUpdate();

            OrderDAO orderDAO = new OrderDAO();
            Order order = orderDAO.selectById(orderId);
            this.setPreValue(this.gson.toJson(order));
            order.setStatus(status);
            this.setValue("change status: " + status);
            int x = super.update(order);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Order selectById(int id) {
        Order result = null;

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM orders WHERE order_id =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idImport = rs.getInt("order_id");
                int idUser = rs.getInt("user_id");
                double totalPrice = rs.getDouble("total_price");
                String userConsignee = rs.getString("nameConsignee");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                int idPayment = rs.getInt("payment_id");
                Timestamp time = rs.getTimestamp("booking_date");
                String note = rs.getString("note");
                double shippingFee = rs.getDouble("shipping_fee");
                int status = rs.getInt("status_id");
                User u = new UserDAO().selectById(idUser);
                Payment pay = new PaymentDAO().selectById(idPayment);
                StatusOrder statusOrder = new StatusOrderDAO().selectById(status);
                result= new Order(idImport,u,totalPrice,userConsignee,phone,address,pay,time,note,shippingFee,statusOrder);


            }

            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;

    }
    public List<Order> selectByStatusIds(int... statusIds) {
        List<Order> orders = new ArrayList<>();
        Connection con = null;

        try {
            con = JDBCUtil.getConnection();

            // Tạo câu truy vấn SQL động với số lượng điều kiện status_id tùy biến
            StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM orders WHERE status_id IN (");
            for (int i = 0; i < statusIds.length; i++) {
                sqlBuilder.append("?");
                if (i < statusIds.length - 1) {
                    sqlBuilder.append(", ");
                }
            }
            sqlBuilder.append(")");

            PreparedStatement st = con.prepareStatement(sqlBuilder.toString());

            // Đặt giá trị cho các tham số status_id
            for (int i = 0; i < statusIds.length; i++) {
                st.setInt(i + 1, statusIds[i]);
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idImport = rs.getInt("order_id");
                int idUser = rs.getInt("user_id");
                double totalPrice = rs.getDouble("total_price");
                String userConsignee = rs.getString("nameConsignee");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                int idPayment = rs.getInt("payment_id");
                Timestamp time = rs.getTimestamp("booking_date");
                String note = rs.getString("note");
                double shippingFee = rs.getDouble("shipping_fee");
                int status = rs.getInt("status_id");
                User u = new UserDAO().selectById(idUser);
                Payment pay = new PaymentDAO().selectById(idPayment);
                StatusOrder statusOrder = new StatusOrderDAO().selectById(status);
                Order order = new Order(idImport, u, totalPrice, userConsignee, phone, address, pay, time, note, shippingFee, statusOrder);
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JDBCUtil.closeConnection(con);
        }

        return orders;
    }

    public List<Order> selectByUserId(int userId) {
        List<Order> orders = new ArrayList<>();
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            con = JDBCUtil.getConnection();
            String sql = "SELECT * FROM orders WHERE user_id = ?";
            st = con.prepareStatement(sql);
            st.setInt(1, userId);
            rs = st.executeQuery();

            while (rs.next()) {
                int idImport = rs.getInt("order_id");
                int idUser = rs.getInt("user_id");
                double totalPrice = rs.getDouble("total_price");
                String userConsignee = rs.getString("nameConsignee");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                int idPayment = rs.getInt("payment_id");
                Timestamp time = rs.getTimestamp("booking_date");
                String note = rs.getString("note");
                double shippingFee = rs.getDouble("shipping_fee");
                int status = rs.getInt("status_id");

                User u = new UserDAO().selectById(idUser);
                Payment pay = new PaymentDAO().selectById(idPayment);
                StatusOrder statusOrder = new StatusOrderDAO().selectById(status);

                Order order = new Order(idImport, u, totalPrice, userConsignee, phone, address, pay, time, note, shippingFee, statusOrder);
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (st != null) st.close(); } catch (Exception e) { e.printStackTrace(); }
            try { if (con != null) con.close(); } catch (Exception e) { e.printStackTrace(); }
        }

        return orders;
    }

    public List<Order> selectByUserIdAndStatusId(int userId, int statusId) {
        List<Order> orders = new ArrayList<>();

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM orders WHERE user_id = ? AND status_id = ?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, userId);
            st.setInt(2, statusId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idImport = rs.getInt("order_id");
                int idUser = rs.getInt("user_id");
                double totalPrice = rs.getDouble("total_price");
                String userConsignee = rs.getString("nameConsignee");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                int idPayment = rs.getInt("payment_id");
                Timestamp time = rs.getTimestamp("booking_date");
                String note = rs.getString("note");
                double shippingFee = rs.getDouble("shipping_fee");
                int status = rs.getInt("status_id");
                User u = new UserDAO().selectById(idUser);
                Payment pay = new PaymentDAO().selectById(idPayment);
                StatusOrder statusOrder = new StatusOrderDAO().selectById(status);
                Order order = new Order(idImport,u,totalPrice,userConsignee,phone,address,pay,time,note,shippingFee,statusOrder);
                orders.add(order);
            }

            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;

    }
    public List<Order> selectByUserIdAndStatusIds(int userId, int... statusIds) {
        List<Order> orders = new ArrayList<>();

        try {
            Connection con = JDBCUtil.getConnection();

            // Tạo câu truy vấn SQL động với số lượng điều kiện status_id tùy biến
            StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM orders WHERE user_id = ? AND status_id IN (");
            for (int i = 0; i < statusIds.length; i++) {
                sqlBuilder.append("?");
                if (i < statusIds.length - 1) {
                    sqlBuilder.append(", ");
                }
            }
            sqlBuilder.append(")");

            PreparedStatement st = con.prepareStatement(sqlBuilder.toString());
            st.setInt(1, userId);

            // Đặt giá trị cho các tham số status_id
            for (int i = 0; i < statusIds.length; i++) {
                st.setInt(i + 2, statusIds[i]);
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idImport = rs.getInt("order_id");
                int idUser = rs.getInt("user_id");
                double totalPrice = rs.getDouble("total_price");
                String userConsignee = rs.getString("nameConsignee");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                int idPayment = rs.getInt("payment_id");
                Timestamp time = rs.getTimestamp("booking_date");
                String note = rs.getString("note");
                double shippingFee = rs.getDouble("shipping_fee");
                int status = rs.getInt("status_id");
                User u = new UserDAO().selectById(idUser);
                Payment pay = new PaymentDAO().selectById(idPayment);
                StatusOrder statusOrder = new StatusOrderDAO().selectById(status);
                Order order = new Order(idImport,u,totalPrice,userConsignee,phone,address,pay,time,note,shippingFee,statusOrder);
                orders.add(order);
            }

            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }

    @Override
    public int insert(Order order) {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "INSERT INTO orders(order_id, user_id,total_price,nameConsignee,phone,address,payment_id,booking_date,note,shipping_fee,status_id)"
                    + "VALUES(?, ?, ?, ?,?,?,?,?,?,?,?)";

            PreparedStatement rs = con.prepareStatement(sql);

            rs.setInt(1, order.getOrderId());
            rs.setInt(2, order.getUser().getUserId());
            rs.setDouble(3, order.getTotalPrice());
            rs.setString(4, order.getNameConsignee());
            rs.setString(5, order.getPhone());
            rs.setString(6, order.getAddress());
            rs.setDouble(7, order.getPayment().getPaymentId());
            rs.setTimestamp(8, order.getBookingDate());
            rs.setString(9, order.getNote());
            rs.setDouble(10, order.getShippingFee());
            rs.setInt(11,order.getStatus().getStatusId());



            result = rs.executeUpdate();

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return result;

    }

    @Override
    public int insertAll(ArrayList<Order> list) {
        int result = 0;
        for (Order o : list) {

            ;
            if (this.insert(o) == 1)
                result += 1;
        }
        return result;
    }

    @Override
    public int delete(Order order) {
        int result = 0;

        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "DELETE from orders " + "WHERE order_id=?";

            PreparedStatement rs = con.prepareStatement(sql);
            rs.setInt(1, order.getOrderId());

            result = rs.executeUpdate();
            this.setPreValue(this.gson.toJson(order));
            int x = super.delete(order);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return result;
    }

    @Override
    public int deleteAll(ArrayList<Order> list) {
        int result = 0;

        for (Order o : list) {
            result += delete(o);
        }
        return result;
    }

    @Override
    public int update(Order order) {
        int result = 0;
        Order oldRating = this.selectById(order.getOrderId());

        if (oldRating != null) {

            try {
                Connection con = JDBCUtil.getConnection();

                String sql = "UPDATE orders SET user_id=? " +
                        ", total_price=? " +
                        ", nameConsignee=? " +
                        ", phone=? " +
                        ", address=? " +
                        ", payment_id=? " +
                        ", booking_date=? " +
                        ", note=? " +
                        ", shipping_fee=? " +
                        ", status_id=? " +
                        "WHERE order_id = ?";

                PreparedStatement rs = con.prepareStatement(sql);

                rs.setInt(1, order.getOrderId());
                rs.setInt(2, order.getUser().getUserId());
                rs.setDouble(3, order.getTotalPrice());
                rs.setString(4, order.getNameConsignee());
                rs.setString(5, order.getPhone());
                rs.setString(6, order.getAddress());
                rs.setDouble(7, order.getPayment().getPaymentId());
                rs.setTimestamp(8, order.getBookingDate());
                rs.setString(9, order.getNote());
                rs.setDouble(10, order.getShippingFee());
                rs.setInt(11,order.getStatus().getStatusId());




                result = rs.executeUpdate();
                this.setPreValue(this.gson.toJson(oldRating));
                this.setValue(this.gson.toJson(order));
                int x = super.insert(order);

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }


        return result;
    }
    //tinh doanh thu theo tuan gan nhat
    //lay ra ngay hien tai roi suy  ra khoang ngay trong tuan do
    public Map<String, Double> revenue(Date date){
        Map<String, Double> result = new HashMap<>();
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "SELECT a.user_id AS user_id,  SUM(quantity*price) AS tongtien\n" +
                    "FROM orders a JOIN orderdetails b ON a.order_id=b.order_id\n" +
                    "WHERE a.booking_date=?\n" +
                    "GROUP BY user_id";
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setDate(1, date);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                int id = rs.getInt("user_id");
                double tongtien = rs.getDouble("tongtien");
                UserDAO userDAO = new UserDAO();
                result.put(userDAO.selectById(id).getName(), tongtien);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
    //doanh thu tu ngay n1 den ngay n2
    public Map<Date, Double> revenue(Date date1, Date date2){
        Map<Date, Double>result = new HashMap<>();
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "WITH RECURSIVE date_series AS (\n" +
                    "    SELECT DATE(?) AS ngay\n" +
                    "    UNION ALL\n" +
                    "    SELECT ngay + INTERVAL 1 DAY\n" +
                    "    FROM date_series\n" +
                    "    WHERE ngay + INTERVAL 1 DAY <= DATE(?)\n" +
                    ")\n" +
                    "SELECT ds.ngay,\n" +
                    "       COALESCE(SUM(b.quantity * b.price), 0) AS tongtien\n" +
                    "FROM date_series ds\n" +
                    "LEFT JOIN orders a ON ds.ngay = a.booking_date\n" +
                    "LEFT JOIN orderdetails b ON a.order_id = b.order_id\n" +
                    "GROUP BY ds.ngay\n" +
                    "ORDER BY ds.ngay;";
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setDate(1, date1);
            pre.setDate(2, date2);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                Date date = rs.getDate("ngay");
                double tongtien = rs.getDouble("tongtien");
                result.put(date, tongtien);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
    //doanh thu theo thang
    public double revenue(int month, int year){
        double result =0;
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "SELECT \n" +
                    "    SUM(b.quantity * b.price) AS tongtien\n" +
                    "FROM \n" +
                    "    orders a\n" +
                    "JOIN \n" +
                    "    orderdetails b ON a.order_id = b.order_id\n" +
                    "WHERE \n" +
                    "    YEAR(a.booking_date) = ? AND MONTH(a.booking_date) = ?;\n";
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, year);
            pre.setInt(2, month);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                result = rs.getDouble("tongtien");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
    //doanh thu theo nam
    public double revenue( int year){
        double result =0;
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "SELECT \n" +
                    "    SUM(b.quantity * b.price) AS tongtien\n" +
                    "FROM \n" +
                    "    orders a\n" +
                    "JOIN \n" +
                    "    orderdetails b ON a.order_id = b.order_id\n" +
                    "WHERE \n" +
                    "    YEAR(a.booking_date) = ? ";
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, year);
            ResultSet rs = pre.executeQuery();
            while (rs.next()){
                result = rs.getDouble("tongtien");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    //doanh thu tung thang theo nam
    public double[]revenue2(int year){
        double[]result = new double[12];
        for(int i=1; i<13; i++){
            double rev = this.revenue(i, year);
            result[i-1]=rev;
        }
        return result;
    }

    public double[] revenueForWeek(Date date) {
        double[]result = new double[7];
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);

        // Điều chỉnh để trở về ngày Chủ nhật (hoặc Thứ Hai nếu bạn muốn tuần bắt đầu từ Thứ Hai)
        calendar.set(Calendar.DAY_OF_WEEK, calendar.MONDAY);

        try (Connection con = JDBCUtil.getConnection()) {
            for (int i = 0; i < 7; i++) {
                Date currentDate = new Date(calendar.getTimeInMillis());
                String sql = "SELECT SUM(quantity * price) AS tongtien " +
                        "FROM orders a JOIN orderdetails b ON a.order_id = b.order_id " +
                        "WHERE DATE(a.booking_date) = ?";
                try (PreparedStatement pre = con.prepareStatement(sql)) {
                    pre.setDate(1, currentDate);
                    try (ResultSet rs = pre.executeQuery()) {
                        if (rs.next()) {
                            result[i]= rs.getDouble("tongtien");
                        } else {
                            result[i]=0;
                        }
                    }
                }
                calendar.add(Calendar.DATE, 1); // Move to the next day
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return result;
    }
    public static void main(String[] args) {
        OrderDAO orderDAO = new OrderDAO();
        double[]rs=orderDAO.revenueForWeek(Date.valueOf(LocalDateTime.now().toLocalDate()));
        for (int i=0; i<5; i++){
            System.out.println(rs[i]);
        }

    }

}
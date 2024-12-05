package database;

import model.Order;
import model.OrderDetail;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDetailDAO extends AbsDAO<OrderDetail>{
    private ArrayList<OrderDetail> data = new ArrayList<>();
    public int creatId() {
        data = selectAll();
        return data.size();
    }
    @Override
    public ArrayList<OrderDetail> selectAll() {
        ArrayList<OrderDetail> orderdetails = new ArrayList<>();
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM orderdetails";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                int idorderde = rs.getInt("detail_id");
                int idOrder = rs.getInt("order_id");
                int idProduct = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                Order o = new OrderDAO().selectById(idOrder);


                Product pro = new ProductDAO().selectById(idProduct);
                OrderDetail orderdetail = new OrderDetail(idorderde,o,pro,quantity,price);


                orderdetails.add(orderdetail);

            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orderdetails;
    }

    @Override
    public OrderDetail selectById(int id) {
        OrderDetail result = null;

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM orderdetails WHERE detail_id =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idorderde = rs.getInt("detail_id");
                int idOrder = rs.getInt("order_id");
                int idProduct = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                Order o = new OrderDAO().selectById(idOrder);


                Product pro = new ProductDAO().selectById(idProduct);
                result = new OrderDetail(idorderde,o,pro,quantity,price);

            }

            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    public List<OrderDetail> selectByOrderId(int id) {
        ArrayList<OrderDetail> orderdetails = new ArrayList<>();

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM orderdetails WHERE order_id =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idorderde = rs.getInt("detail_id");
                int idOrder = rs.getInt("order_id");
                int idProduct = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                Order o = new OrderDAO().selectById(idOrder);


                Product pro = new ProductDAO().selectById(idProduct);
                OrderDetail orderDetail = new OrderDetail(idorderde,o,pro,quantity,price);
                orderdetails.add(orderDetail);
            }

            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderdetails;
    }
    public OrderDetail selectFirstByOrderId(int id) {
        OrderDetail orderDetail = null;

        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM orderdetails WHERE order_id = ?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int idorderde = rs.getInt("detail_id");
                int idOrder = rs.getInt("order_id");
                int idProduct = rs.getInt("product_id");
                int quantity = rs.getInt("quantity");
                double price = rs.getDouble("price");
                Order o = new OrderDAO().selectById(idOrder);
                Product pro = new ProductDAO().selectById(idProduct);
                orderDetail = new OrderDetail(idorderde, o, pro, quantity, price);
            }

            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return orderDetail;
    }
    public int sumOrderDetailsQuantityByOrderId(int orderId) {
        int totalQuantity = 0;

        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT SUM(quantity) FROM orderdetails WHERE order_id = ?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, orderId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalQuantity = rs.getInt(1);
            }

            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return totalQuantity;
    }
    @Override
    public int insert(OrderDetail orderDetail) {
        int result = 0;
        this.setValue(this.gson.toJson(orderDetail));
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "INSERT INTO orderdetails(detail_id, order_id,product_id,quantity,price)"
                    + "VALUE(?, ?, ?, ?,?)";

            PreparedStatement rs = con.prepareStatement(sql);

            rs.setInt(1, orderDetail.getDetailId());
            rs.setInt(2, orderDetail.getOrder().getOrderId());
            rs.setInt(3, orderDetail.getProduct().getProductId());
            rs.setInt(4, orderDetail.getQuantity());
            rs.setDouble(5, orderDetail.getPrice());




            result = rs.executeUpdate();
            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }



        return result;

    }

    @Override
    public int insertAll(ArrayList<OrderDetail> list) {
        int result = 0;
        for (OrderDetail o : list) {

            ;
            if (this.insert(o) == 1)
                result += 1;
        }
        return result;
    }

    @Override
    public int delete(OrderDetail orderDetail) {
        int result = 0;

        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "DELETE from orderdetails " + "WHERE detail_id=?";

            PreparedStatement rs = con.prepareStatement(sql);
            rs.setInt(1,orderDetail.getDetailId());

            result = rs.executeUpdate();

            this.setValue(this.gson.toJson(orderDetail));
            int x = super.delete(orderDetail);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return result;
    }

    @Override
    public int deleteAll(ArrayList<OrderDetail> list) {
        int result = 0;

        for (OrderDetail o : list) {
            result += delete(o);
        }
        return result;
    }

    @Override
    public int update(OrderDetail orderDetail) {
        int result = 0;
        OrderDetail oldRating = this.selectById(orderDetail.getDetailId());

        if (oldRating != null) {

            try {
                Connection con = JDBCUtil.getConnection();

                String sql = "UPDATE orderdetails SET order_id=? " +

                        ", product_id=? " +
                        ", quantity=? " +

                        ", price=? " +

                        "WHERE detail_id = ?";

                PreparedStatement rs = con.prepareStatement(sql);

                rs.setInt(1, orderDetail.getDetailId());
                rs.setInt(2, orderDetail.getOrder().getOrderId());
                rs.setInt(3, orderDetail.getProduct().getProductId());
                rs.setInt(4, orderDetail.getQuantity());
                rs.setDouble(5, orderDetail.getPrice());




                result = rs.executeUpdate();
                this.setValue(this.gson.toJson(orderDetail));
                this.setPreValue(this.gson.toJson(oldRating));
                int x = super.update(orderDetail);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return result;
    }

}

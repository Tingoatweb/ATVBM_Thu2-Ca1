package database;

import model.Order;
import model.Payment;
import model.StatusOrder;
import model.User;

import java.sql.*;
import java.util.ArrayList;

public class StatusOrderDAO implements DAOInterface<StatusOrder>{
    @Override
    public ArrayList<StatusOrder> selectAll() {
        ArrayList<StatusOrder> statusOrders = new ArrayList<>();
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM orderstatus";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                int idstatus = rs.getInt("status_id");
                String name = rs.getString("status_name");
                StatusOrder statusOrder = new StatusOrder(idstatus, name);

                statusOrders.add(statusOrder);

            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return statusOrders;
    }

    @Override
    public StatusOrder selectById(int id) {
        StatusOrder result = null;

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM orderstatus WHERE status_id =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idStatus = rs.getInt("status_id");
                String name = rs.getString("status_name");
                result = new StatusOrder(idStatus,name);
            }

            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int insert(StatusOrder statusOrder) {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "INSERT INTO orderstatus(status_id, status_name) VALUE(?, ?)";
            PreparedStatement rs = con.prepareStatement(sql);
            rs.setInt(1, statusOrder.getStatusId());
            rs.setString(2, statusOrder.getStatusName());
            result = rs.executeUpdate();
            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public int insertAll(ArrayList<StatusOrder> list) {
        int result = 0;
        for (StatusOrder s : list) {
            if (this.insert(s) == 1)
                result += 1;
        }
        return result;
    }

    @Override
    public int delete(StatusOrder statusOrder) {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "DELETE FROM orderstatus WHERE status_id=?";
            PreparedStatement rs = con.prepareStatement(sql);
            rs.setInt(1, statusOrder.getStatusId());
            result = rs.executeUpdate();
            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public int deleteAll(ArrayList<StatusOrder> list) {
        int result = 0;
        for (StatusOrder s : list) {
            result += delete(s);
        }
        return result;
    }

    @Override
    public int update(StatusOrder statusOrder) {
        int result = 0;
        StatusOrder oldStatus = this.selectById(statusOrder.getStatusId());
        if (oldStatus != null) {
            try {
                Connection con = JDBCUtil.getConnection();
                String sql = "UPDATE orderstatus SET status_name=? WHERE status_id = ?";
                PreparedStatement rs = con.prepareStatement(sql);
                rs.setString(1, statusOrder.getStatusName());
                rs.setInt(2, statusOrder.getStatusId());
                result = rs.executeUpdate();
                JDBCUtil.closeConnection(con);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return result;
    }
    public void createIndex() {
        try {
            Connection con = JDBCUtil.getConnection();

            // Tạo chỉ mục trên cột category_name
            String sql = "CREATE INDEX idx_status_id ON orderstatus(status_id)";
            PreparedStatement st = con.prepareStatement(sql);

            // Thực thi câu lệnh
            st.executeUpdate();

            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        new StatusOrderDAO().createIndex();
    }
}

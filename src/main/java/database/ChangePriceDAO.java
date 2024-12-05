package database;

import model.ChangePrice;
import model.Product;
import model.User;

import java.sql.*;
import java.util.ArrayList;

public class ChangePriceDAO implements DAOInterface<ChangePrice> {
    @Override
    public ArrayList<ChangePrice> selectAll() {
        ArrayList<ChangePrice> changePrices = new ArrayList<>();
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM change_price";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int stt = rs.getInt("stt");
                int userId = rs.getInt("user_id");
                int productId = rs.getInt("product_id");
                int oldPrice = rs.getInt("old_price");
                int newPrice = rs.getInt("new_price");
                Date dateUpdate = rs.getDate("date_update");

                UserDAO userDAO = new UserDAO();
                User user = userDAO.selectById(userId);

                ProductDAO productDAO = new ProductDAO();
                Product product = productDAO.selectById(productId);

                ChangePrice changePrice = new ChangePrice(stt, user, product, oldPrice, newPrice, dateUpdate);
                changePrices.add(changePrice);
            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return changePrices;
    }

    @Override
    public ChangePrice selectById(int id) {
        ChangePrice changePrice = null;

        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM change_price WHERE stt = ?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                int stt = rs.getInt("stt");
                int userId = rs.getInt("user_id");
                int productId = rs.getInt("product_id");
                int oldPrice = rs.getInt("old_price");
                int newPrice = rs.getInt("new_price");
                Date dateUpdate = rs.getDate("date_update");

                UserDAO userDAO = new UserDAO();
                User user = userDAO.selectById(userId);

                ProductDAO productDAO = new ProductDAO();
                Product product = productDAO.selectById(productId);

                changePrice = new ChangePrice(stt, user, product, oldPrice, newPrice, dateUpdate);
            }

            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return changePrice;
    }

    @Override
    public int insert(ChangePrice changePrice) {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "INSERT INTO change_price (user_id, product_id, old_price, new_price, date_update) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, changePrice.getUser().getUserId());
            ps.setInt(2, changePrice.getProductId().getProductId());
            ps.setInt(3, changePrice.getOldPrice());
            ps.setInt(4, changePrice.getNewPrice());
            ps.setDate(5, changePrice.getDate());
            result = ps.executeUpdate();
            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public int insertAll(ArrayList<ChangePrice> list) {
        int result = 0;
        for (ChangePrice cp : list) {
            result += this.insert(cp);
        }
        return result;
    }

    @Override
    public int delete(ChangePrice changePrice) {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "DELETE FROM change_price WHERE stt=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, changePrice.getStt());
            result = ps.executeUpdate();
            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
    public boolean delete(int stt) {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "DELETE FROM change_price WHERE stt=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, stt);
            result = ps.executeUpdate();
            JDBCUtil.closeConnection(con);
           return true;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public int deleteAll(ArrayList<ChangePrice> list) {
        int result = 0;
        for (ChangePrice cp : list) {
            result += this.delete(cp);
        }
        return result;
    }

    @Override
    public int update(ChangePrice changePrice) {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "UPDATE change_price SET user_id=?, product_id=?, old_price=?, new_price=?, date_update=? WHERE stt=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, changePrice.getUser().getUserId());
            ps.setInt(2, changePrice.getProductId().getProductId());
            ps.setInt(3, changePrice.getOldPrice());
            ps.setInt(4, changePrice.getNewPrice());
            ps.setDate(5, changePrice.getDate());
            ps.setInt(6, changePrice.getStt());
            result = ps.executeUpdate();
            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public static void main(String[] args) {
        System.out.println(new ChangePriceDAO().selectAll().size());
    }
}

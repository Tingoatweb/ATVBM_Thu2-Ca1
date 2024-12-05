package database;

import model.*;

import java.sql.*;
import java.util.ArrayList;

public class CouponOfUserDAO implements DAOInterface<CouponOfUser>{
    private ArrayList<CouponOfUser> data = new ArrayList<>();
    public int creatId() {
        data = selectAll();
        return data.size();
    }
    @Override
    public ArrayList<CouponOfUser> selectAll() {
        ArrayList<CouponOfUser> couponOfUsers = new ArrayList<>();
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM user_coupons";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int idCouponOfUser = rs.getInt("user_coupon_id");
                int idUser = rs.getInt("user_id");
                int idCoupon = rs.getInt("coupon_id");
                boolean used = rs.getBoolean("is_used");
                User user = new UserDAO().selectById(idUser);
                Coupon coupon = new CouponDAO().selectById(idCoupon);
                CouponOfUser couponOfUser = new CouponOfUser(idCouponOfUser, user, coupon, used);
                couponOfUsers.add(couponOfUser);
            }

            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return couponOfUsers;
    }

    @Override
    public CouponOfUser selectById(int id) {
        CouponOfUser result = null;

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM book.user_coupons WHERE user_coupon_id =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idCouponOfUser = rs.getInt("user_coupon_id");
                int idUser = rs.getInt("user_id");
                int idCoupon = rs.getInt("coupon_id");
                boolean used = rs.getBoolean("is_used");
                User user = new UserDAO().selectById(idUser);
                Coupon coupon = new CouponDAO().selectById(idCoupon);
                result = new CouponOfUser(idCouponOfUser, user, coupon, used);


            }
            JDBCUtil.closeConnection(con);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    public ArrayList<CouponOfUser> selectByUserId(int id) {
        ArrayList<CouponOfUser> couponOfUsers = new ArrayList<>();

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM book.user_coupons WHERE user_id =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idCouponOfUser = rs.getInt("user_coupon_id");
                int idUser = rs.getInt("user_id");
                int idCoupon = rs.getInt("coupon_id");
                boolean used = rs.getBoolean("is_used");
                User user = new UserDAO().selectById(idUser);
                Coupon coupon = new CouponDAO().selectById(idCoupon);
                CouponOfUser couponOfUser = new CouponOfUser(idCouponOfUser, user, coupon, used);
                couponOfUsers.add(couponOfUser);

            }
            JDBCUtil.closeConnection(con);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return couponOfUsers;
    }
    public boolean exists(int userId, int couponId) {
        boolean exists = false;
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "SELECT COUNT(*) FROM book.user_coupons WHERE user_id = ? AND coupon_id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, userId);
            st.setInt(2, couponId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                exists = rs.getInt(1) > 0;
            }

            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return exists;
    }

    @Override
    public int insert(CouponOfUser couponOfUser) throws SQLException {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "INSERT INTO user_coupons(user_coupon_id, user_id, coupon_id, is_used) " +
                    "VALUES (?, ?, ?, ?)";
            PreparedStatement rs = con.prepareStatement(sql);
            rs.setInt(1, couponOfUser.getId());
            rs.setInt(2, couponOfUser.getUser().getUserId());
            rs.setInt(3, couponOfUser.getCoupon().getCouponId());
            rs.setBoolean(4, couponOfUser.isUsed());
            result = rs.executeUpdate();
            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public int insertAll(ArrayList<CouponOfUser> list) throws SQLException {
        return 0;
    }

    @Override
    public int delete(CouponOfUser couponOfUser) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<CouponOfUser> list) {
        return 0;
    }

    @Override
    public int update(CouponOfUser couponOfUser) {
        return 0;
    }
}

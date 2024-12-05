package database;

import model.Coupon;
import model.CouponType;

import java.sql.*;
import java.util.ArrayList;

public class CouponDAO implements DAOInterface<Coupon> {

    ArrayList<Coupon> data = new ArrayList<>();
    public int creatId() {
        data = selectAll();
        return data.size();
    }
    @Override
    public ArrayList<Coupon> selectAll() {
        ArrayList<Coupon> coupons = new ArrayList<>();
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM coupons";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int idCoupon = rs.getInt("coupon_id");
                String code = rs.getString("code");
                int type = rs.getInt("coupon_type_id");
                double price = rs.getDouble("discount_value");
                Timestamp start = rs.getTimestamp("start_date");
                Timestamp end = rs.getTimestamp("end_date");
                double minPrice = rs.getDouble("min_total_price");
                int maxCoupon = rs.getInt("max_use_of_coupon");
                int maxUseCoupon = rs.getInt("max_quantity_use_of_user");
                int minQuantity = rs.getInt("min_quantity");
                double maxPrice = rs.getDouble("max_total_price");
                CouponType couponType = new CouponTypeDAO().selectById(type);
                Coupon coupon = new Coupon(idCoupon, code, couponType, price, start, end, minPrice, maxCoupon, maxUseCoupon, minQuantity, maxPrice);
                coupons.add(coupon);

            }

            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return coupons;
    }

    @Override
    public Coupon selectById(int id) {
        Coupon result = null;

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM book.coupons WHERE coupon_id =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idCoupon = rs.getInt("coupon_id");
                String code = rs.getString("code");
                int type = rs.getInt("coupon_type_id");
                double price = rs.getDouble("discount_value");
                Timestamp start = rs.getTimestamp("start_date");
                Timestamp end = rs.getTimestamp("end_date");
                double minPrice = rs.getDouble("min_total_price");
                int maxCoupon = rs.getInt("max_use_of_coupon");
                int maxUseCoupon = rs.getInt("max_quantity_use_of_user");
                int minQuantity = rs.getInt("min_quantity");
                double maxPrice = rs.getDouble("max_total_price");
                CouponType couponType = new CouponTypeDAO().selectById(type);
                result = new Coupon(idCoupon, code, couponType, price, start, end, minPrice, maxCoupon, maxUseCoupon, minQuantity ,maxPrice);


            }
            JDBCUtil.closeConnection(con);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    public Coupon selectByCode(String code) {
        Coupon result = null;

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM book.coupons WHERE code =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idCoupon = rs.getInt("coupon_id");
                String codeCoupon = rs.getString("code");
                int type = rs.getInt("coupon_type_id");
                double price = rs.getDouble("discount_value");
                Timestamp start = rs.getTimestamp("start_date");
                Timestamp end = rs.getTimestamp("end_date");
                double minPrice = rs.getDouble("min_total_price");
                int maxCoupon = rs.getInt("max_use_of_coupon");
                int maxUseCoupon = rs.getInt("max_quantity_use_of_user");
                int minQuantity = rs.getInt("min_quantity");
                double maxPrice = rs.getDouble("max_total_price");
                CouponType couponType = new CouponTypeDAO().selectById(type);
                result = new Coupon(idCoupon, codeCoupon, couponType, price, start, end, minPrice, maxCoupon, maxUseCoupon, minQuantity, maxPrice);


            }
            JDBCUtil.closeConnection(con);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    public int saveCoupon(Coupon coupon, ArrayList<Integer> categoryIds) {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "INSERT INTO coupons(coupon_id, code, coupon_type_id, discount_value, start_date, end_date, min_total_price, max_use_of_coupon, max_quantity_use_of_user, min_quantity, max_total_price) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement rs = con.prepareStatement(sql);
            rs.setInt(1, coupon.getCouponId());
            rs.setString(2, coupon.getCode());
            rs.setInt(3, coupon.getDiscountType().getCouponTypeId());
            rs.setDouble(4, coupon.getDiscountValue());
            rs.setTimestamp(5, coupon.getStartDate());
            rs.setTimestamp(6, coupon.getEndDate());
            rs.setDouble(7, coupon.getMinTotalPrice());
            rs.setInt(8, coupon.getMaxUseOfCoupon());
            rs.setInt(9, coupon.getMaxQuantityUseOfUser());
            rs.setInt(10, coupon.getMinQuantity());
            rs.setDouble(11, coupon.getMaxTotalPrice());
            rs.executeUpdate();
            ResultSet resultSet = rs.getGeneratedKeys();
            int couponId = 0;
            if (resultSet.next()) {
                couponId = resultSet.getInt(1);
            }

            if (coupon.getDiscountType().getCouponTypeId() == 3) {
                sql = "INSERT INTO coupon_categories(coupon_id, category_id) VALUES (?, ?)";
                rs = con.prepareStatement(sql);
                for (int categoryId : categoryIds) {
                    rs.setInt(1, couponId);
                    rs.setInt(2, categoryId);
                    rs.addBatch();
                }
                rs.executeBatch();
            }

            con.commit();
            result = couponId;
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
    @Override
    public int insert(Coupon coupon) throws SQLException {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "INSERT INTO coupons(coupon_id, code, coupon_type_id, discount_value, start_date, end_date, min_total_price, max_use_of_coupon, max_quantity_use_of_user, min_quantity, max_total_price) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement rs = con.prepareStatement(sql);
            rs.setInt(1, coupon.getCouponId());
            rs.setString(2, coupon.getCode());
            rs.setInt(3, coupon.getDiscountType().getCouponTypeId());
            rs.setDouble(4, coupon.getDiscountValue());
            rs.setTimestamp(5, coupon.getStartDate());
            rs.setTimestamp(6, coupon.getEndDate());
            rs.setDouble(7, coupon.getMinTotalPrice());
            rs.setInt(8, coupon.getMaxUseOfCoupon());
            rs.setInt(9, coupon.getMaxQuantityUseOfUser());
            rs.setInt(10, coupon.getMinQuantity());
            rs.setDouble(11, coupon.getMaxTotalPrice());
            result = rs.executeUpdate();
            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public int insertAll(ArrayList<Coupon> list) throws SQLException {
        int result = 0;
        for (Coupon o : list) {

            ;
            if (this.insert(o) == 1)
                result += 1;
        }
        return result;
    }

    @Override
    public int delete(Coupon coupon) {
        int result = 0;

        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "DELETE from coupons " + "WHERE coupon_id=?";

            PreparedStatement rs = con.prepareStatement(sql);
            rs.setInt(1, coupon.getCouponId());

            result = rs.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return result;
    }

    @Override
    public int deleteAll(ArrayList<Coupon> list) {
        int result = 0;

        for (Coupon o : list) {
            result += delete(o);
        }
        return result;
    }

    @Override
    public int update(Coupon coupon) {
        int result = 0;
        Coupon oldCoupon = this.selectById(coupon.getCouponId());

        if (oldCoupon != null) {

            try {
                Connection con = JDBCUtil.getConnection();

                String sql = "UPDATE coupons SET code=? " +
                        ", coupon_type_id=? " +
                        ", discount_value=? " +
                        ", start_date=? " +
                        ", end_date=? " +
                        ", min_total_price=? " +
                        ", max_use_of_coupon=? " +
                        ", max_quantity_use_of_user=? " +
                        ", min_quantity=? " +
                        ", max_total_price=? " +
                        "WHERE coupon_id = ?";

                PreparedStatement rs = con.prepareStatement(sql);

                rs.setInt(1, coupon.getCouponId());
                rs.setString(2, coupon.getCode());
                rs.setInt(3, coupon.getDiscountType().getCouponTypeId());
                rs.setDouble(4, coupon.getDiscountValue());
                rs.setTimestamp(5, coupon.getStartDate());
                rs.setTimestamp(6, coupon.getEndDate());
                rs.setDouble(7, coupon.getMinTotalPrice());
                rs.setInt(8, coupon.getMaxUseOfCoupon());
                rs.setInt(9, coupon.getMaxQuantityUseOfUser());
                rs.setInt(10, coupon.getMinQuantity());
                rs.setDouble(11, coupon.getMaxTotalPrice());
                result = rs.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }


        return result;
    }
    public int updateQuantiyCouponById(int id, int maxUseUser, int maxUseCoupon) {
        int result = 0;
        Coupon oldCoupon = this.selectById(id);

        if (oldCoupon != null) {

            try {
                Connection con = JDBCUtil.getConnection();

                String sql = "UPDATE coupons SET max_use_of_coupon=? " +
                        ", max_quantity_use_of_user=? " +
                        "WHERE coupon_id = ?";

                PreparedStatement rs = con.prepareStatement(sql);

                rs.setInt(1, maxUseUser);
                rs.setInt(2, maxUseCoupon);
                rs.setInt(3, id);

                result = rs.executeUpdate();
                System.out.println("Coupon cap nhat so luong thanh cong");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }


        return result;
    }
    public boolean deleteCoupons(StringBuilder couponId) {
        try (Connection connection = JDBCUtil.getConnection()) {
            // Disable foreign key checks
            try (PreparedStatement disableChecksStmt = connection.prepareStatement("SET FOREIGN_KEY_CHECKS=0;")) {
                disableChecksStmt.executeUpdate();
            }

            // Truncate the Comments table
            try (PreparedStatement truncateStmt = connection.prepareStatement("DELETE FROM coupons where coupon_id IN (" + couponId + ")")) {
                truncateStmt.executeUpdate();
            }

            // Enable foreign key checks
            try (PreparedStatement enableChecksStmt = connection.prepareStatement("SET FOREIGN_KEY_CHECKS=1;")) {
                enableChecksStmt.executeUpdate();
            }

            return true; // Successful if no exceptions were thrown
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}

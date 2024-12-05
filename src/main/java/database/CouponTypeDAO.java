package database;

import model.Category;
import model.CouponType;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CouponTypeDAO  implements DAOInterface<CouponType>{
    @Override
    public ArrayList<CouponType> selectAll() {
        ArrayList<CouponType> couponTypes = new ArrayList<>();
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM coupon_type";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("coupon_type_id");
                String name = rs.getString("coupon_type");

                CouponType couponType = new CouponType(id, name);
                couponTypes.add(couponType);

            }

            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return couponTypes;
    }

    @Override
    public CouponType selectById(int id) {
        CouponType result = null;

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM book.coupon_type WHERE coupon_type_id =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int couponId = rs.getInt("coupon_type_id");
                String couponType = rs.getString("coupon_type");

                result = new CouponType(couponId, couponType);


            }
            JDBCUtil.closeConnection(con);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int insert(CouponType couponType) throws SQLException {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "INSERT INTO coupon_type(coupon_type_id, coupon_type)"
                    + "VALUE(?, ?)";
            PreparedStatement rs = con.prepareStatement(sql);
            rs.setInt(1, couponType.getCouponTypeId());
            rs.setString(2, couponType.getCouponTye());
            result = rs.executeUpdate();
            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    @Override
    public int insertAll(ArrayList<CouponType> list) throws SQLException {
        int result = 0;
        for (CouponType couponType : list) {
            if (this.insert(couponType) == 1)
                result += 1;
        }
        return result;
    }

    @Override
    public int delete(CouponType couponType) {
        int result =0;

        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "DELETE from coupon_type "
                    + "WHERE coupon_type_id=?";

            PreparedStatement rs = con.prepareStatement(sql);
            rs.setInt(1, couponType.getCouponTypeId());



            result= rs.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int deleteAll(ArrayList<CouponType> list) {
        int result = 0;
        for (CouponType couponType : list) {
            result += delete(couponType);
        }
        return result;
    }

    @Override
    public int update(CouponType couponType) {
        int result = 0;
        CouponType oldCouponType = this.selectById(couponType.getCouponTypeId());
        if(oldCouponType !=null) {
            try {
                Connection con = JDBCUtil.getConnection();
                String sql = "UPDATE book.coupon_type SET  coupon_type=? "+ "WHERE coupon_type_id =?";
                PreparedStatement rs = con.prepareStatement(sql);
                rs.setString(1, couponType.getCouponTye());
                rs.setInt(2, couponType.getCouponTypeId());
                result = rs.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }
}

package database;

import model.Product;
import model.User;
import model.WishlistItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class WishListDAO implements DAOInterface<WishlistItem> {
    private ArrayList<WishlistItem> data = new ArrayList<>();
    public int creatId() {
        data = selectAll();
        return data.size();
    }

    @Override
    public ArrayList<WishlistItem> selectAll() {
        ArrayList<WishlistItem> wishlists = new ArrayList<>();
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM WishlistItem";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                int idwishlist = rs.getInt("itemId");
                int iduser = rs.getInt("user_id");
                int idproduct = rs.getInt("product_id");
//                String name = rs.getString("productname");
//                double price = rs.getDouble("productprice");



                Product pr = new ProductDAO().selectById(idproduct);
                User use = new UserDAO().selectById(iduser);
                WishlistItem wlist = new WishlistItem(idwishlist,use,pr,pr.getProduct_name(),pr.getPrice());


                wishlists.add(wlist);

            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return wishlists;
    }

    @Override
    public WishlistItem selectById(int id) {
        return null;
    }
    public ArrayList<WishlistItem> selectWById(int id) {
        ArrayList<WishlistItem> wishlistItems = new ArrayList<>();


        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM WishlistItem WHERE user_id =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idwishlist = rs.getInt("itemId");
                int iduser = rs.getInt("user_id");
                int idproduct = rs.getInt("product_id");
//                String name = rs.getString("productname");
//                double price = rs.getDouble("productprice");



                Product pr = new ProductDAO().selectById(idproduct);
                User use = new UserDAO().selectById(iduser);
                WishlistItem wlist = new WishlistItem(idwishlist,use,pr,pr.getProduct_name(),pr.getPrice());
                wishlistItems.add(wlist);
            }

            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return wishlistItems;
    }


    @Override
    public int insert(WishlistItem wishlistItem) throws SQLException {
        int result = 0;
        Connection con = JDBCUtil.getConnection();

        // Check for existing item before insertion
        String checkSql = "SELECT COUNT(*) FROM WishlistItem WHERE user_id = ? AND product_id = ?";
        PreparedStatement checkSt = con.prepareStatement(checkSql);
        checkSt.setInt(1, wishlistItem.getUser().getUserId());
        checkSt.setInt(2, wishlistItem.getProductid().getProductId());
        ResultSet checkRs = checkSt.executeQuery();

        if (checkRs.next() && checkRs.getInt(1) > 0) {
            // Product already exists in wishlist
            throw new SQLException("Product already exists in wishlist");
        }

        // Insert if product doesn't exist
        String insertSql = "INSERT INTO WishlistItem(itemId, user_id, product_id, productname, productprice)"
                + "VALUES(?, ?, ?, ?, ?)";
        PreparedStatement rs = con.prepareStatement(insertSql);

        rs.setInt(1, wishlistItem.getItemId());
        rs.setInt(2, wishlistItem.getUser().getUserId());
        rs.setInt(3, wishlistItem.getProductid().getProductId());
        rs.setString(4, wishlistItem.getProductid().getProduct_name());
        rs.setDouble(5, wishlistItem.getProductid().getPrice());

        result = rs.executeUpdate();

        JDBCUtil.closeConnection(con);

        return result;
    }

    @Override
    public int insertAll(ArrayList<WishlistItem> list) {
        return 0;
    }

    @Override
    public int delete(WishlistItem wishlistItem) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<WishlistItem> list) {
        return 0;
    }

    @Override
    public int update(WishlistItem wishlistItem) {
        return 0;
    }
    public int countByUserId(int userId) {
        int productCount = 0;
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT COUNT(*) AS product_count FROM WishlistItem WHERE user_id = ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                productCount = rs.getInt("product_count");
            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return productCount;
    }
    public int deleteWishlistItem(int itemId) throws SQLException {
        int result = 0;
        Connection con = JDBCUtil.getConnection();

        String sql = "DELETE FROM WishlistItem WHERE itemId = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, itemId);

        result = ps.executeUpdate();

        JDBCUtil.closeConnection(con);

        return result;
    }
}

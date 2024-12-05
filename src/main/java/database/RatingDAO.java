package database;

import model.Product;
import model.Rating;
import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class RatingDAO implements DAOInterface<Rating> {
    private ArrayList<Rating> data = new ArrayList<>();


    @Override
    public ArrayList<Rating> selectAll() {
        ArrayList<Rating> ratings = new ArrayList<>();
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM ratings";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                int idrating = rs.getInt("rating_id");
                int idproduct = rs.getInt("product_id");
                int iduser = rs.getInt("user_id");
                int ratingStar = rs.getInt("rating_star");
                String ratingText = rs.getString("rating_text");
                Long daterating = rs.getTimestamp("date_rating").getTime();
                Product pr = new ProductDAO().selectById(idproduct);
                User use = new UserDAO().selectById(iduser);

                Rating ra = new Rating(idrating,pr,use,ratingStar,ratingText,daterating);

                ratings.add(ra);

            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return ratings;
    }
    public int creatId() {
        data = selectAll();
        return data.size();
    }
    public ArrayList<Rating> selectRByproductid(int productId) {
        ArrayList<Rating> ratings = new ArrayList<>();
        try {
            // Tạo một kết nối
            Connection con = JDBCUtil.getConnection();

            // Tạo câu lệnh SQL với điều kiện WHERE product_id = ?
            String sql = "SELECT * FROM ratings WHERE product_id = ?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, productId); // Thiết lập giá trị cho tham số product_id

            // Thực thi truy vấn
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int idrating = rs.getInt("rating_id");
                int idproduct = rs.getInt("product_id");
                int iduser = rs.getInt("user_id");
                int ratingStar = rs.getInt("rating_star");
                String ratingText = rs.getString("rating_text");
                Long daterating = rs.getTimestamp("date_rating").getTime();
                Product pr = new ProductDAO().selectById(idproduct);
                User use = new UserDAO().selectById(iduser);

                Rating ra = new Rating(idrating, pr, use, ratingStar, ratingText, daterating);
                ratings.add(ra);
            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return ratings;
    }
    public ArrayList<Rating> selectRByuserid(int userId) {
        ArrayList<Rating> ratings = new ArrayList<>();
        try {
            // Tạo một kết nối
            Connection con = JDBCUtil.getConnection();

            // Tạo câu lệnh SQL với điều kiện WHERE product_id = ?
            String sql = "SELECT pr.product_name, r.rating_id, r.user_id, " +
                    "r.rating_star, r.rating_text, r.date_rating " +
                    "FROM ratings r JOIN products pr on r.product_id = pr.product_id " +
                    "WHERE user_id = ? " +
                    "ORDER BY date_rating DESC";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, userId); // Thiết lập giá trị cho tham số product_id

            // Thực thi truy vấn
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int idrating = rs.getInt("rating_id");
                int iduser = rs.getInt("user_id");
                String name = rs.getString("product_name");
                int ratingStar = rs.getInt("rating_star");
                String ratingText = rs.getString("rating_text");
                long dateratingLong = rs.getTimestamp("date_rating").getTime();

                // Convert milliseconds to formatted date string using getter method

                Product pr = new ProductDAO().selectByName(name);
                User use = new UserDAO().selectById(iduser);

                Rating ra = new Rating(idrating, pr, use, ratingStar, ratingText, dateratingLong);
                ratings.add(ra);

            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return ratings;
    }

    @Override
    public Rating selectById(int id) {
        Rating result = null;

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM ratings WHERE rating_id =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idrating = rs.getInt("rating_id");
                int idproduct = rs.getInt("product_id");
                int iduser = rs.getInt("user_id");
                double ratingStar = rs.getDouble("rating_star");
                String ratingText = rs.getString("rating_text");
                Long dater = rs.getLong("date_rating");

                Product pr = new ProductDAO().selectById(idproduct);
                User use = new UserDAO().selectById(iduser);

                result = new Rating(idrating,pr,use,ratingStar,ratingText,dater);

            }

            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;

    }
    public List<Rating> selectNameFromRatings(int productid) {
        List<Rating> ratings = new ArrayList<>();
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT u.name, r.rating_id, r.product_id, r.rating_star, r.rating_text, UNIX_TIMESTAMP(NOW()) - UNIX_TIMESTAMP(r.date_rating) as date_rating FROM ratings r JOIN users u ON r.user_id = u.user_id WHERE r.product_id = ? ORDER BY r.date_rating DESC";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, productid);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int idrating = rs.getInt("rating_id");
                int idproduct = rs.getInt("product_id");
                String name = rs.getString("name");
                int ratingStar = rs.getInt("rating_star");
                String ratingText = rs.getString("rating_text");
                long dateRating = rs.getLong("date_rating");
                Product pr = new ProductDAO().selectById(idproduct);

                User use = new UserDAO().selectByName(name);

                Rating ra = new Rating(idrating, pr, use, ratingStar, ratingText, dateRating);
                ratings.add(ra);
            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return ratings;
    }
    public ArrayList<Rating> selectStarFromRatings(int productid, int rating_star) {
        ArrayList<Rating> ratings = new ArrayList<>();
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT u.name, r.rating_id, r.product_id, r.rating_star, r.rating_text, UNIX_TIMESTAMP(NOW()) - UNIX_TIMESTAMP(r.date_rating) as date_rating " +
                    "FROM ratings r JOIN users u ON r.user_id = u.user_id " +
                    "WHERE r.product_id = ? AND r.rating_star = ? ORDER BY r.date_rating DESC";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, productid);
            st.setInt(2, rating_star);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int idrating = rs.getInt("rating_id");
                int idproduct = rs.getInt("product_id");
                String name = rs.getString("name");
                int ratingStar = rs.getInt("rating_star");
                String ratingText = rs.getString("rating_text");
                long dateRating = rs.getLong("date_rating");
                Product pr = new ProductDAO().selectById(idproduct);

                User use = new UserDAO().selectByName(name);

                Rating ra = new Rating(idrating, pr, use, ratingStar, ratingText, dateRating);
                ratings.add(ra);
            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return ratings;
    }

    public List<Rating> selectInfoRatings(int productid) {
        List<Rating> ratings = new ArrayList<>();
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT u.name AS reviewer_name,\n" +
                    "       r.rating_star,\n" +
                    "       r.rating_text,\n" +
                    "       r.date_rating\n" +
                    "FROM ratings r\n" +
                    "JOIN users u ON r.user_id = u.user_id\n" +
                    "WHERE u.user_id = ?\n" + // Thêm điều kiện lọc theo product_id
                    "ORDER BY r.date_rating DESC";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, productid); // Chỉ định giá trị cho tham số
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                // Các dòng trong vòng lặp này giữ nguyên
                int ratingStar = rs.getInt("rating_star");
                String ratingText = rs.getString("rating_text");
                long dateRating = rs.getLong("date_rating");
                // Bạn không cần lấy idrating và idproduct từ ResultSet vì chúng không được chọn trong SQL
                // Thay vào đó, bạn đã có productid từ tham số đầu vào của phương thức
                // Tên người đánh giá đã được lấy từ cột "reviewer_name", không phải "name"
                String reviewerName = rs.getString("reviewer_name");
                // Bạn không cần truy vấn lại product hoặc user, vì bạn chỉ cần id của chúng từ ResultSet
                Product pr = new ProductDAO().selectById(productid);
                User use = new UserDAO().selectByName(reviewerName);
                Rating ra = new Rating(productid, pr, use, ratingStar, ratingText, dateRating);
                ratings.add(ra);
            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return ratings;
    }

    @Override
    public int insert(Rating rating) {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();

            // convert Unix timestamp to java.sql.Timestamp
            Timestamp dateRating = new Timestamp(rating.getDateRating() * 1000);

            String sql = "INSERT INTO ratings(rating_id,product_id,user_id,rating_star,rating_text,date_rating)"
                    + "VALUE(?, ?, ?, ?, ?, ?)";

            PreparedStatement rs = con.prepareStatement(sql);

            rs.setInt(1, rating.getRatingId());
            rs.setInt(2,rating.getProduct().getProductId());
            rs.setInt(3,rating.getUser().getUserId());
            rs.setDouble(4,rating.getRatingstar());
            rs.setString(5,rating.getRatingtext());
            rs.setTimestamp(6, dateRating);

            result = rs.executeUpdate();

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return result;
    }

    @Override
    public int insertAll(ArrayList<Rating> list) {
        int result = 0;
        for (Rating ra : list) {

            ;
            if (this.insert(ra) == 1)
                result += 1;
        }
        return result;
    }

    @Override
    public int delete(Rating rating) {
        int result = 0;

        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "DELETE from ratings " + "WHERE rating_id=?";

            PreparedStatement rs = con.prepareStatement(sql);
            rs.setInt(1, rating.getRatingId());

            result = rs.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return result;
    }

    @Override
    public int deleteAll(ArrayList<Rating> list) {
        int result = 0;

        for (Rating ra : list) {
            result += delete(ra);
        }
        return result;
    }

    @Override
    public int update(Rating rating) {
        int result = 0;
        Rating oldProduct = this.selectById(rating.getRatingId());

        if (oldProduct != null) {

            try {
                Connection con = JDBCUtil.getConnection();

                String sql = "UPDATE ratings SET product_id=? " +
                        ", user_id=? " +
                        ", rating_star=? " +
                        ", rating_text=? " +
                        ", date_rating=? " +

                        "WHERE rating_id = ?";

                PreparedStatement rs = con.prepareStatement(sql);

                rs.setInt(1, rating.getRatingId());
                rs.setInt(2,rating.getProduct().getProductId());
                rs.setInt(3,rating.getUser().getUserId());
                rs.setDouble(4,rating.getRatingstar());
                rs.setString(5,rating.getRatingtext());
                rs.setLong(6, rating.getDateRating());


                result = rs.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return result;
    }
    public List<Rating> getListByPage(List<Rating> list, int start, int end){
        List<Rating> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }
    public int getSumRatingByProductId(int productId) {
        int SumRating = 0;
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT COUNT(rating_star) AS count_rating FROM ratings WHERE product_id = ?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, productId);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                SumRating = rs.getInt("count_rating");
            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return SumRating;
    }


    public double getAverageRatingByProductId(int productId) {
        double averageRating = 0.0;
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT ROUND(AVG(rating_star), 1) AS average_rating FROM ratings WHERE product_id = ?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, productId);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                averageRating = rs.getDouble("average_rating");
            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return averageRating;
    }
    public int getAverageRatingsByProductId(double rating,int productId) {
        int averageRating = 0;
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT COUNT(*) AS star_ratings\n" +
                    "FROM ratings\n" +
                    "WHERE rating_star = ? and product_id = ?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setDouble(1,rating);
            st.setInt(2, productId);

            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                averageRating = rs.getInt("star_ratings");
            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return averageRating;
    }
    public void printAverageRatingsByProductIds(List<Integer> productIds) {
        Map<Integer, Double> averageRatings = new HashMap<>();

        for (int productId : productIds) {
            double averageRating = getAverageRatingByProductId(productId);
            averageRatings.put(productId, averageRating);
        }

        for (Map.Entry<Integer, Double> entry : averageRatings.entrySet()) {
            System.out.println("Product ID: " + entry.getKey() + ", Average Rating: " + entry.getValue());
        }
    }





}

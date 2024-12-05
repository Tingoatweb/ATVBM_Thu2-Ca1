package database;

import model.Comment;
import model.Product;
import model.Rating;
import model.User;

import java.sql.*;
import java.util.ArrayList;

public class CommentDAO implements DAOInterface<Comment> {
    private ArrayList<Comment> data = new ArrayList<>();

    public int creatId() {
        data = selectAll();
        return data.size();
    }

    @Override
    public ArrayList<Comment> selectAll() {
        ArrayList<Comment> comments = new ArrayList<>();
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM comments";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                int idcomment = rs.getInt("comment_id");
                int idrating = rs.getInt("rating_id");
                int idproduct = rs.getInt("product_id");
                double rastar = rs.getDouble("rating_star");
                String ratext = rs.getString("rating_text");
                int iduser = rs.getInt("user_id");
                String detailcomment = rs.getString("detail_comment");
                Long datecomment = rs.getTimestamp("date_comment").getTime();


                Product pr = new ProductDAO().selectById(idproduct);
                User use = new UserDAO().selectById(iduser);
                Comment co = new Comment(idcomment,idrating,pr,rastar,ratext,use,detailcomment,datecomment);


                comments.add(co);

            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return comments;
    }

    @Override
    public Comment selectById(int id) {
        Comment result = null;

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM comments WHERE comment_id =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idcomment = rs.getInt("comment_id");
                int idrating = rs.getInt("rating_id");

                int idproduct = rs.getInt("product_id");
                double rastar = rs.getDouble("rating_star");
                String ratext = rs.getString("rating_text");
                int iduser = rs.getInt("user_id");
                String detailcomment = rs.getString("detail_comment");
                Long datecomment = rs.getTimestamp("date_comment").getTime();
                Rating ra = new RatingDAO().selectById(idrating);

                Product pr = new ProductDAO().selectById(idproduct);
                User use = new UserDAO().selectById(iduser);
                result = new Comment(idcomment,idrating,pr,rastar,ratext,use,detailcomment,datecomment);

            }

            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    public ArrayList<Comment> selectCByuserid(int userId) {
        ArrayList<Comment> comments = new ArrayList<>();
        try {
            // Tạo một kết nối
            Connection con = JDBCUtil.getConnection();

            // Tạo câu lệnh SQL với điều kiện WHERE user_id =?
            String sql = "SELECT c.comment_id, c.rating_id, c.product_id, " +
                    "c.rating_star, c.rating_text, c.detail_comment, c.date_comment, " +
                    "r.rating_star, r.rating_text " +
                    "FROM comments c JOIN ratings r ON c.rating_id = r.rating_id " +
                    "WHERE c.user_id =? " +
                    "ORDER BY c.date_comment DESC";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, userId); // Thiết lập giá trị cho tham số user_id

            // Thực thi truy vấn
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int idcomment = rs.getInt("comment_id");
                int ratingId = rs.getInt("rating_id");
                int productId = rs.getInt("product_id");
                int ratingStar = rs.getInt("rating_star");
                String ratingText = rs.getString("rating_text");
                String detailComment = rs.getString("detail_comment");
                Long dateCommentLong = rs.getTimestamp("date_comment").getTime();

                // Convert milliseconds to formatted date string using getter method

                Product pr = new ProductDAO().selectById(productId);
                User use = new UserDAO().selectById(userId);

                Comment cm = new Comment(idcomment, ratingId, pr,ratingStar,ratingText, use, detailComment, dateCommentLong);
                comments.add(cm);
            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return comments;
    }

    @Override
    public int insert(Comment comment) {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();
            Timestamp dateComment = new Timestamp(comment.getDateComment() * 1000);


            String sql = "INSERT INTO comments(comment_id,rating_id,product_id,rating_star,rating_text,user_id,detail_comment,date_comment)"
                    + "VALUE(?,?, ?,?,?, ?, ?, ?)";

            PreparedStatement rs = con.prepareStatement(sql);

            rs.setInt(1, comment.getCommentid());
            rs.setInt(2,comment.getRatingid());
            rs.setInt(3,comment.getProduct().getProductId());
            rs.setDouble(4,comment.getRatingstar());
            rs.setString(5,comment.getRatingtext());
            rs.setInt(6,comment.getUser().getUserId());
            rs.setString(7,comment.getDetailComment());
            rs.setTimestamp(8, dateComment);

            result = rs.executeUpdate();

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return result;
    }

    @Override
    public int insertAll(ArrayList<Comment> list) {
        int result = 0;
        for (Comment co : list) {

            ;
            if (this.insert(co) == 1)
                result += 1;
        }
        return result;
    }

    @Override
    public int delete(Comment comment) {
        int result = 0;

        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "DELETE from comments " + "WHERE comment_id=?";

            PreparedStatement rs = con.prepareStatement(sql);
            rs.setInt(1, comment.getCommentid());

            result = rs.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return result;
    }

    @Override
    public int deleteAll(ArrayList<Comment> list) {
        int result = 0;

        for (Comment co : list) {
            result += delete(co);
        }
        return result;
    }

    @Override
    public int update(Comment comment) {
        int result = 0;
        Comment oldProduct = this.selectById(comment.getCommentid());

        if (oldProduct != null) {

            try {
                Connection con = JDBCUtil.getConnection();

                String sql = "UPDATE comments SET" + "rating_id=? " +
                        " product_id=? " +
                        ", user_id=? " +
                        ", detail_comment=? " +
                        ", date_comment=? " +

                        "WHERE comment_id = ?";

                PreparedStatement rs = con.prepareStatement(sql);

                rs.setInt(1, comment.getCommentid());
                rs.setInt(2,comment.getRatingid());
                rs.setInt(3,comment.getProduct().getProductId());
                rs.setInt(4,comment.getUser().getUserId());
                rs.setString(5,comment.getDetailComment());
                rs.setLong(6, comment.getDateComment());



                result = rs.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return result;
    }
}

package model;


import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment {
    private int commentid;
    public int ratingid;
    private Product product;
    private double ratingstar;
    private String ratingtext;
    private User user;
    private String detailComment;
    private long dateComment;

    public Comment(int commentid, int ratingid, Product product, double ratingstar, String ratingtext, User user, String detailComment, long dateComment) {
        this.commentid = commentid;
        this.ratingid = ratingid;
        this.product = product;
        this.ratingstar = ratingstar;
        this.ratingtext = ratingtext;
        this.user = user;
        this.detailComment = detailComment;
        this.dateComment = dateComment;
    }

    public int getCommentid() {
        return commentid;
    }

    public int getRatingid() {
        return ratingid;
    }

    public Product getProduct() {
        return product;
    }

    public double getRatingstar() {
        return ratingstar;
    }

    public String getRatingtext() {
        return ratingtext;
    }

    public User getUser() {
        return user;
    }

    public String getDetailComment() {
        return detailComment;
    }

    public long getDateComment() {
        return dateComment;
    }

    public void setCommentid(int commentid) {
        this.commentid = commentid;
    }

    public void setRatingid(int ratingid) {
        this.ratingid = ratingid;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public void setRatingstar(double ratingstar) {
        this.ratingstar = ratingstar;
    }

    public void setRatingtext(String ratingtext) {
        this.ratingtext = ratingtext;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setDetailComment(String detailComment) {
        this.detailComment = detailComment;
    }

    public void setDateComment(long dateComment) {
        this.dateComment = dateComment;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "commentid=" + commentid +
                ", ratingid=" + ratingid +
                ", product=" + product +
                ", ratingstar=" + ratingstar +
                ", ratingtext='" + ratingtext + '\'' +
                ", user=" + user +
                ", detailComment='" + detailComment + '\'' +
                ", dateComment=" + dateComment +
                '}';
    }
    public String getFormattedDateComment() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(new Date(dateComment));
    }
}
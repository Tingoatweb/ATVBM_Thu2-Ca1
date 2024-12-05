package model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Rating {
    private int ratingId;
    private Product product;
    private User user;
    private double ratingstar;
    private String ratingtext;
    private long dateRating;

    public Rating(int ratingId, Product product, User user, double ratingstar, String ratingtext, long dateRating) {
        this.ratingId = ratingId;
        this.product = product;
        this.user = user;
        this.ratingstar = ratingstar;
        this.ratingtext = ratingtext;
        this.dateRating = dateRating;
    }


    public int getRatingId() {
        return ratingId;
    }

    public Product getProduct() {
        return product;
    }

    public User getUser() {
        return user;
    }

    public double getRatingstar() {
        return ratingstar;
    }

    public String getRatingtext() {
        return ratingtext;
    }

    public long getDateRating() {
        return dateRating;
    }

    public void setRatingId(int ratingId) {
        this.ratingId = ratingId;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setRatingstar(double ratingstar) {
        this.ratingstar = ratingstar;
    }

    public void setRatingtext(String ratingtext) {
        this.ratingtext = ratingtext;
    }

    public void setDateRating(long dateRating) {
        this.dateRating = dateRating;
    }

    @Override
    public String toString() {
        return "Rating{" +
                "ratingId=" + ratingId +
                ", product=" + product +
                ", user=" + user +
                ", ratingstar=" + ratingstar +
                ", ratingtext='" + ratingtext + '\'' +
                ", dateRating=" + dateRating +
                '}';
    }
    public String getFormattedDateRating() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(new Date(dateRating));
    }
}

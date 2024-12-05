package model;

import java.sql.Date;

public class ChangePrice {
    public int stt;
    public User user;
    public Product product;
    public int oldPrice;
    public int newPrice;
    public Date date;

    public ChangePrice(int stt, User user, Product productId, int oldPrice, int newPrice, Date date) {
        this.stt = stt;
        this.user = user;
        this.product = productId;
        this.oldPrice = oldPrice;
        this.newPrice = newPrice;
        this.date = date;
    }

    public ChangePrice( User user, Product productId, int oldPrice, int newPrice, Date date) {
        this.user = user;
        this.product = productId;
        this.oldPrice = oldPrice;
        this.newPrice = newPrice;
        this.date = date;
    }

    public int getStt() {
        return stt;
    }

    public void setStt(int stt) {
        this.stt = stt;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProductId() {
        return product;
    }

    public void setProductId(Product productId) {
        this.product = productId;
    }

    public int getOldPrice() {
        return oldPrice;
    }

    public void setOldPrice(int oldPrice) {
        this.oldPrice = oldPrice;
    }

    public int getNewPrice() {
        return newPrice;
    }

    public void setNewPrice(int newPrice) {
        this.newPrice = newPrice;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "ChangePrice{" +
                "stt=" + stt +
                ", user=" + user +
                ", product=" + product +
                ", oldPrice=" + oldPrice +
                ", newPrice=" + newPrice +
                ", date=" + date +
                '}';
    }
}

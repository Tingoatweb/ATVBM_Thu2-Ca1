package model;

public class WishlistItem {
    private int itemId;
    private User user;
    private Product productid;
    private String productname;
    private double productprice;

    public WishlistItem(int itemId, User user, Product productid, String productname, double productprice) {
        this.itemId = itemId;
        this.user = user;
        this.productid = productid;
        this.productname = productname;
        this.productprice = productprice;
    }

    // Constructor without itemId parameter
    public WishlistItem(User user, Product productid, String productname, double productprice) {
        this.user = user;
        this.productid = productid;
        this.productname = productname;
        this.productprice = productprice;
    }

    public int getItemId() {
        return itemId;
    }

    public User getUser() {
        return user;
    }

    public Product getProductid() {
        return productid;
    }

    public String getProductname() {
        return productname;
    }

    public double getProductprice() {
        return productprice;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setProductid(Product productid) {
        this.productid = productid;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public void setProductprice(double productprice) {
        this.productprice = productprice;
    }

    @Override
    public String toString() {
        return "WishlistItem{" +
                "itemId=" + itemId +
                ", user=" + user +
                ", productid=" + productid +
                ", productname='" + productname + '\'' +
                ", productprice=" + productprice +
                '}';
    }
}

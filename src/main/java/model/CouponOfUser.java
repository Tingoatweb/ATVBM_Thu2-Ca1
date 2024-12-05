package model;

public class CouponOfUser {
    private int id;
    private User user;
    private Coupon coupon;
    private boolean isUsed;

    public CouponOfUser(int id, User user, Coupon coupon, boolean isUsed) {
        this.id = id;
        this.user = user;
        this.coupon = coupon;
        this.isUsed = isUsed;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Coupon getCoupon() {
        return coupon;
    }

    public void setCoupon(Coupon coupon) {
        this.coupon = coupon;
    }

    public boolean isUsed() {
        return isUsed;
    }

    public void setUsed(boolean used) {
        isUsed = used;
    }
}

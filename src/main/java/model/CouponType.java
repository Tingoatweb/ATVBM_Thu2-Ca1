package model;

public class CouponType {
    private int couponTypeId;
    private String couponTye;

    public CouponType(int couponTypeId, String couponTye) {
        this.couponTypeId = couponTypeId;
        this.couponTye = couponTye;
    }

    public CouponType(int couponTypeId) {
        this.couponTypeId = couponTypeId;
    }

    public CouponType() {
    }

    public int getCouponTypeId() {
        return couponTypeId;
    }

    public void setCouponTypeId(int couponTypeId) {
        this.couponTypeId = couponTypeId;
    }

    public String getCouponTye() {
        return couponTye;
    }

    public void setCouponTye(String couponTye) {
        this.couponTye = couponTye;
    }
}

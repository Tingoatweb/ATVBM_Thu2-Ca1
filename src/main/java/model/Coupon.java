package model;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class Coupon {
    private int couponId;
    private String code;
    private CouponType discountType;
    private double discountValue;
    private Timestamp startDate;
    private Timestamp endDate;
    private double minTotalPrice;
    private int maxUseOfCoupon;
    private int maxQuantityUseOfUser;
    private int minQuantity;
    private double maxTotalPrice;
    private List<User> userIds; // Danh sách user có coupon
    private List<Category> categoryIds; // Danh sách ccategory có coupon

    /**
     *
     * @param couponId // id
     * @param code // code mã giảm
     * @param discountType // loại giảm giá
     * @param discountValue // Giá trị giảm giá
     * @param startDate // ngày bắt đầu
     * @param endDate // ngày end
     * @param minTotalPrice //tổng tiền tối thiểu để áp dụng mã
     * @param maxUseOfCoupon // Số lượng của mã giảm
     * @param maxQuantityUseOfUser // số lần dùng mã của người dùng
     * @param minQuantity // sô lượng sản phẩm mua tối thiểu để áp dụng mã
     */
    public Coupon(int couponId, String code, CouponType discountType, double discountValue, Timestamp startDate, Timestamp endDate, double minTotalPrice, int maxUseOfCoupon, int maxQuantityUseOfUser, int minQuantity, double maxTotalPrice) {
        this.couponId = couponId;
        this.code = code;
        this.discountType = discountType;
        this.discountValue = discountValue;
        this.startDate = startDate;
        this.endDate = endDate;
        this.minTotalPrice = minTotalPrice;
        this.maxUseOfCoupon = maxUseOfCoupon;
        this.maxQuantityUseOfUser = maxQuantityUseOfUser;
        this.minQuantity = minQuantity;
        this.maxTotalPrice = maxTotalPrice;
    }

    public double getMaxTotalPrice() {
        return maxTotalPrice;
    }

    public void setMaxTotalPrice(double maxTotalPrice) {
        this.maxTotalPrice = maxTotalPrice;
    }

    public List<User> getUserIds() {
        return userIds;
    }

    public void setUserIds(List<User> userIds) {
        this.userIds = userIds;
    }

    public List<Category> getCategoryIds() {
        return categoryIds;
    }

    public void setCategoryIds(List<Category> categoryIds) {
        this.categoryIds = categoryIds;
    }

    public int getCouponId() {
        return couponId;
    }

    public void setCouponId(int couponId) {
        this.couponId = couponId;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public CouponType getDiscountType() {
        return discountType;
    }

    public void setDiscountType(CouponType discountType) {
        this.discountType = discountType;
    }

    public double getDiscountValue() {
        return discountValue;
    }

    public void setDiscountValue(double discountValue) {
        this.discountValue = discountValue;
    }

    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    public Timestamp getEndDate() {
        return endDate;
    }

    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }

    public double getMinTotalPrice() {
        return minTotalPrice;
    }

    public void setMinTotalPrice(double minTotalPrice) {
        this.minTotalPrice = minTotalPrice;
    }

    public int getMaxUseOfCoupon() {
        return maxUseOfCoupon;
    }

    public void setMaxUseOfCoupon(int maxUseOfCoupon) {
        this.maxUseOfCoupon = maxUseOfCoupon;
    }

    public int getMaxQuantityUseOfUser() {
        return maxQuantityUseOfUser;
    }

    public void setMaxQuantityUseOfUser(int maxQuantityUseOfUser) {
        this.maxQuantityUseOfUser = maxQuantityUseOfUser;
    }

    public int getMinQuantity() {
        return minQuantity;
    }

    public void setMinQuantity(int minQuantity) {
        this.minQuantity = minQuantity;
    }
}

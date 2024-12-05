package model;



import java.sql.Timestamp;
import java.util.List;

public class Order{
    private int orderId;
    private User user;
    private double totalPrice;
    private String nameConsignee;
    private String phone;
    private String address;
    private Payment payment;
    private Timestamp bookingDate;
    private String note;
    private double shippingFee;
    private StatusOrder status;
    private List<OrderDetail> orderDetailList;

    public Order(int orderId, User user, double totalPrice, String nameConsignee, String phone, String address, Payment payment, Timestamp bookingDate, String note, double shippingFee, StatusOrder status) {
        this.orderId = orderId;
        this.user = user;
        this.totalPrice = totalPrice;
        this.nameConsignee = nameConsignee;
        this.phone = phone;
        this.address = address;
        this.payment = payment;
        this.bookingDate = bookingDate;
        this.note = note;
        this.shippingFee = shippingFee;
        this.status = status;
    }

    public Order() {
    }

    public Timestamp getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Timestamp bookingDate) {
        this.bookingDate = bookingDate;
    }

    public double getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(double shippingFee) {
        this.shippingFee = shippingFee;
    }

    public StatusOrder getStatus() {
        return status;
    }

    public void setStatus(StatusOrder status) {
        this.status = status;
    }

    public int getOrderId() {
        return orderId;
    }

    public User getUser() {
        return user;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public String getNameConsignee() {
        return nameConsignee;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public Payment getPayment() {
        return payment;
    }


    public String getNote() {
        return note;
    }

    public List<OrderDetail> getOrderDetailList() {
        return orderDetailList;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void setNameConsignee(String nameConsignee) {
        this.nameConsignee = nameConsignee;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }


    public void setNote(String note) {
        this.note = note;
    }

    public void setOrderDetailList(List<OrderDetail> orderDetailList) {
        this.orderDetailList = orderDetailList;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", user=" + user +
                ", totalPrice=" + totalPrice +
                ", nameConsignee='" + nameConsignee + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", payment=" + payment +
                ", status='" + status + '\'' +
                ", bookingDate=" + bookingDate +
                ", note='" + note + '\'' +
                ", orderDetailList=" + orderDetailList +
                '}';
    }

}
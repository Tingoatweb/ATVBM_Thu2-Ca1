package model;

public class Payment {
    private int paymentId;
    private String paymentName;

    public Payment(int paymentId, String paymentName) {
        this.paymentId = paymentId;
        this.paymentName = paymentName;
    }

    public int getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(int paymentId) {
        this.paymentId = paymentId;
    }

    public String getPaymentName() {
        return paymentName;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName;
    }

    @Override
    public String toString() {
        return "Payment{" +
                "paymentId=" + paymentId +
                ", paymentName='" + paymentName + '\'' +
                '}';
    }
}

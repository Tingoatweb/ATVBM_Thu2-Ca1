package database;

import model.Payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PaymentDAO implements DAOInterface<Payment>{
    @Override
    public ArrayList<Payment> selectAll() {
        ArrayList<Payment> payments = new ArrayList<>();
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM payment_methods";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                int idpayment = rs.getInt("payment_id");
                String paymentname = rs.getString("payment_name");
                Payment pay = new Payment(idpayment,paymentname);



                payments.add(pay);

            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return payments;

    }

    @Override
    public Payment selectById(int id) {
        Payment result = null;

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM payment_methods WHERE payment_id =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idpayment = rs.getInt("payment_id");
                String paymentname = rs.getString("payment_name");
                result = new Payment(idpayment,paymentname);
            }

            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;

    }

    @Override
    public int insert(Payment payment) {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "INSERT INTO payment_methods(payment_id,payment_name)"
                    + "VALUE(?, ?)";

            PreparedStatement rs = con.prepareStatement(sql);

            rs.setInt(1, payment.getPaymentId());
            rs.setString(2, payment.getPaymentName());



            result = rs.executeUpdate();

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return result;
    }

    @Override
    public int insertAll(ArrayList<Payment> list) {
        int result = 0;
        for (Payment p : list) {

            ;
            if (this.insert(p) == 1)
                result += 1;
        }
        return result;
    }

    @Override
    public int delete(Payment payment) {
        int result = 0;

        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "DELETE from payment_methods " + "WHERE payment_id=?";

            PreparedStatement rs = con.prepareStatement(sql);
            rs.setInt(1, payment.getPaymentId());

            result = rs.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return result;
    }

    @Override
    public int deleteAll(ArrayList<Payment> list) {
        int result = 0;

        for (Payment p : list) {
            result += delete(p);
        }
        return result;
    }

    @Override
    public int update(Payment payment) {
        int result = 0;
        Payment oldPayment = this.selectById(payment.getPaymentId());

        if (oldPayment != null) {

            try {
                Connection con = JDBCUtil.getConnection();

                String sql = "UPDATE payment_methods SET  payment_id=? " +

                        "WHERE payment_id = ?";

                PreparedStatement rs = con.prepareStatement(sql);

                rs.setInt(1, payment.getPaymentId());
                rs.setString(2, payment.getPaymentName());





                result = rs.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return result;
    }
    public void createIndex() {
        try {
            Connection con = JDBCUtil.getConnection();

            // Tạo chỉ mục trên cột category_name
            String sql = "CREATE INDEX idx_payment_id ON payment_methods(payment_id)";
            PreparedStatement st = con.prepareStatement(sql);

            // Thực thi câu lệnh
            st.executeUpdate();

            JDBCUtil.closeConnection(con);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        new PaymentDAO().createIndex();
    }
}
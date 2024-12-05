package database;

import model.Import;
import model.ImportDetail;
import model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ImportDetailDAO extends AbsDAO<ImportDetail>{
    ArrayList<ImportDetail> importdes = new ArrayList<>();
    public int creatId() {
        ArrayList<ImportDetail> list= selectAll();
        return list.get(list.size()-1).getImportDetail()+1;
    }
    @Override
    public ArrayList<ImportDetail> selectAll() {

        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM importDetails";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                int idImportDetail = rs.getInt("importDetail_id");
                int idImport = rs.getInt("import_id");
                int idProduct = rs.getInt("product_id");
                int numbersupplier = rs.getInt("number_of_warehouses");
                Double price = rs.getDouble("unit_price");
                Double totalprice = rs.getDouble("total_price");
                Import im = new ImportDAO().selectById(idImport);
                Product pr = new ProductDAO().selectById(idProduct);
                ImportDetail imdetail = new ImportDetail(idImportDetail,im,pr,numbersupplier,price,totalprice);


                importdes.add(imdetail);

            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return importdes;
    }

    @Override
    public ImportDetail selectById(int id) {
        ImportDetail result = null;

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM importDetails WHERE importDetail_id =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idImportDetail = rs.getInt("importDetail_id");
                int idImport = rs.getInt("import_id");
                int idProduct = rs.getInt("product_id");
                int numbersupplier = rs.getInt("number_of_warehouses");
                Double price = rs.getDouble("unit_price");
                Double totalprice = rs.getDouble("total_price");
                Import im = new ImportDAO().selectById(idImport);
                Product pr = new ProductDAO().selectById(idProduct);

                result = new ImportDetail(idImportDetail,im,pr,numbersupplier,price,totalprice);

            }

            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public ArrayList<ImportDetail> selectByImportId(int id) {
        ArrayList<ImportDetail> result = new ArrayList<>();

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM importDetails WHERE import_id =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idImportDetail = rs.getInt("importDetail_id");
                int idImport = rs.getInt("import_id");
                int idProduct = rs.getInt("product_id");
                int numbersupplier = rs.getInt("number_of_warehouses");
                Double price = rs.getDouble("unit_price");
                Double totalprice = rs.getDouble("total_price");
                Import im = new ImportDAO().selectById(idImport);
                Product pr = new ProductDAO().selectById(idProduct);

                ImportDetail importDetail = new ImportDetail(idImportDetail,im,pr,numbersupplier,price,totalprice);
                result.add(importDetail);

            }

            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int insert(ImportDetail importDetail) {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "INSERT INTO importdetails(importDetail_id, import_id,product_id,number_of_warehouses,unit_price,total_price)"
                    + "VALUE(?, ?, ?, ?,?,?)";

            PreparedStatement rs = con.prepareStatement(sql);

            rs.setInt(1, importDetail.getImportDetail());
            rs.setInt(2, importDetail.getImportId().getImportId());
            rs.setInt(3, importDetail.getProduct().getProductId());
            rs.setInt(4, importDetail.getNumberOfWarehouses());
            rs.setDouble(5, importDetail.getUnitPrice());
            rs.setDouble(6,importDetail.getTotalPrice());


            ProductDAO productDAO = new ProductDAO();



            result = rs.executeUpdate();
            System.out.println("insert successfull");

            this.setValue(this.gson.toJson(importDetail));
            //int x = super.insert(importDetail);
            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        return result;
    }

    @Override
    public int insertAll(ArrayList<ImportDetail> list) {
        int result = 0;
        for (ImportDetail imdetail : list) {

            ;
            if (this.insert(imdetail) == 1)
                result += 1;
        }
        return result;
    }

    @Override
    public int delete(ImportDetail importDetail) {
        int result = 0;

        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "DELETE from importDetails " + "WHERE importDetail_id=?";

            PreparedStatement rs = con.prepareStatement(sql);
            rs.setInt(1, importDetail.getImportDetail());

            result = rs.executeUpdate();

            this.setValue(this.gson.toJson(importDetail));
            int x = super.delete(importDetail);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return result;
    }
    public int deleteByImportId(int import_id) {
        int result = 0;

        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "DELETE from importDetails " + "WHERE import_id=?";

            PreparedStatement rs = con.prepareStatement(sql);
            rs.setInt(1, import_id);

            result = rs.executeUpdate();

            this.setValue(this.gson.toJson(import_id));
          //  int x = super.delete(import_id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return result;
    }

    @Override
    public int deleteAll(ArrayList<ImportDetail> list) {
        int result = 0;

        for (ImportDetail imdetail : list) {
            result += delete(imdetail);
        }
        return result;
    }

    @Override
    public int update(ImportDetail importDetail) {
        int result = 0;
        ImportDetail oldimdetail = this.selectById(importDetail.getImportDetail());

        if (oldimdetail != null) {

            try {
                Connection con = JDBCUtil.getConnection();

                String sql = "UPDATE importDetails SET  import_id=? " +
                        ", product_id=? " +
                        ", number_of_warehouses=? " +
                        ",unit_price=? " +
                        ",total_price=? " +
                        "WHERE importDetail_id = ?";

                PreparedStatement rs = con.prepareStatement(sql);

                rs.setInt(1, importDetail.getImportDetail());
                rs.setInt(2, importDetail.getImportId().getImportId());
                rs.setInt(3, importDetail.getProduct().getProductId());
                rs.setInt(4, importDetail.getNumberOfWarehouses());
                rs.setDouble(5, importDetail.getUnitPrice());
                rs.setDouble(6,importDetail.getTotalPrice());



                result = rs.executeUpdate();

                this.setValue(this.gson.toJson(importDetail));
                int x = super.update(importDetail);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return result;
    }

    public static void main(String[] args) {System.out.println(new ImportDetailDAO().creatId());
    }
}
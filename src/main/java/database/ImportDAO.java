package database;

import model.Import;
import model.ImportDetail;
import model.Product;
import model.User;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.ArrayList;

public class ImportDAO extends AbsDAO<Import> {

    ArrayList<Import> imports = new ArrayList<>();

    public ImportDAO(HttpServletRequest request) {
    }
    public ImportDAO() {
    }

    public int creatId() {
        imports = selectAll();
        if (imports.size() == 0){
            return 1;
        }
        return imports.get(imports.size()-1).getImportId()+1;
    }
    @Override
    public ArrayList<Import> selectAll() {
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM imports";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                int idImport = rs.getInt("import_id");
                int userId = rs.getInt("user_id");
                UserDAO userDAO = new UserDAO();
                User importer = userDAO.selectById(userId);
                String supplier = rs.getString("supplier");
                String note = rs.getString("note");
                Date dateI = rs.getDate("import_date");
                double totalPrice = rs.getDouble("total_price");
                Import im = new Import(idImport,importer,supplier,note,dateI, totalPrice);


                imports.add(im);

            }

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return imports;
    }

    @Override
    public Import selectById(int id) {
        Import result = null;

        try {

            Connection con = JDBCUtil.getConnection();

            String sql = "SELECT * FROM imports WHERE import_id =?";

            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int idImport = rs.getInt("import_id");
                int userId = rs.getInt("user_id");
                UserDAO userDAO = new UserDAO();
                User importer = userDAO.selectById(userId);
                String supplier = rs.getString("supplier");
                String note = rs.getString("note");
                Date dateI = rs.getDate("import_date");
                double total = rs.getDouble("total_price");


                result = new Import(idImport,importer, supplier,note,dateI, total);
            }

            String sql2 ="SELECT * FROM importdetails WHERE import_id=?";
            PreparedStatement st2 = con.prepareStatement(sql2); // Corrected from sql to sql2
            st2.setInt(1, id);
            ResultSet rs2 = st2.executeQuery(); // Corrected from st to st2
            while (rs2.next()) {
                int idImportDetail = rs2.getInt("importDetail_id");
                int idImport = rs2.getInt("import_id");
                int idProduct = rs2.getInt("product_id");
                int numbersupplier = rs2.getInt("number_of_warehouses");
                double price = rs2.getDouble("unit_price");
                double totalprice = rs2.getDouble("total_price");
                Product pr = new ProductDAO().selectById(idProduct);
                ImportDetail importDetail = new ImportDetail(idImportDetail,result,pr,numbersupplier,price,totalprice);
                result.getImportDetailList().add(importDetail);

            }

            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int insert(Import imported) {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "INSERT INTO imports(import_id, user_id, supplier,note,import_date, total_price)"
                    + "VALUE(?, ?, ?, ?, ?, ?)";

            PreparedStatement rs = con.prepareStatement(sql);

            rs.setInt(1, imported.getImportId());
            rs.setInt(2, imported.getImporter().getUserId());
            rs.setString(3, imported.getSupplier());
            rs.setString(4, imported.getNote());
            rs.setDate(5,  imported.getImportDate());
            rs.setDouble(6, imported.getTotalPrice());


            result = rs.executeUpdate();
            JDBCUtil.closeConnection(con);
            this.setValue("import_id: "+imported.getImportId()+"-"+ "user_id: "+ imported.getImporter().getUserId()+"-"+ "supplier: "+ imported.getSupplier()+"-"+"note: "+imported.getNote()+"-import_date: "+imported.getImportDate().toString()+"-total_price: "+imported);
            //super.insert(imported);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        return result;
    }

    @Override
    public int insertAll(ArrayList<Import> list) {
        int result = 0;
        for (Import im : list) {

            ;
            if (this.insert(im) == 1)
                result += 1;
        }
        return result;
    }

    @Override
    public int delete(Import imported) {
        int result = 0;
        ImportDetailDAO importDetailDAO = new ImportDetailDAO();
        importDetailDAO.deleteByImportId(imported.getImportId());


        //new ImportDetailDAO().deleteByImportId(imported.getImportId());
        try {

            Connection con = JDBCUtil.getConnection();


            String sql = "DELETE from imports " + "WHERE import_id=?";

            PreparedStatement rs = con.prepareStatement(sql);
            rs.setInt(1, imported.getImportId());

            result = rs.executeUpdate();

//            this.setValue(this.gson.toJson(imported));
//            int x = super.delete(imported);


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return result;
    }

    @Override
    public int deleteAll(ArrayList<Import> list) {
        int result = 0;

        for (Import im : list) {
            result += delete(im);
        }
        return result;
    }

    @Override
    public int update(Import imported) {
        int result = 0;
        Import oldRating = this.selectById(imported.getImportId());

        if (oldRating != null) {

            try {
                Connection con = JDBCUtil.getConnection();

                String sql = "UPDATE imports SET user_id=?"+", supplier=? " +
                        ", note=? " +

                        ", import_date=? " +
                        ", total_price=? " +
                        "WHERE import_id = ?";

                PreparedStatement rs = con.prepareStatement(sql);

                rs.setInt(1, imported.getImporter().getUserId());
                rs.setString(2, imported.getSupplier());
                rs.setString(3, imported.getNote());
                rs.setDate(4, (Date) imported.getImportDate());
                rs.setDouble(5, imported.getTotalPrice());
                rs.setInt(6, imported.getImportId());



                result = rs.executeUpdate();

                this.setPreValue(this.gson.toJson(oldRating));
                this.setValue(this.gson.toJson(imported));
                super.update(imported);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        return result;
    }
    public int updatePrice(int impportId, double price) {
        int result = 0;


            try {
                Connection con = JDBCUtil.getConnection();

                String sql = "UPDATE imports SET total_price=?"+

                        " WHERE import_id = ?";

                PreparedStatement rs = con.prepareStatement(sql);

                rs.setDouble(1, price);
                rs.setInt(2, impportId);
                result = rs.executeUpdate();
           System.out.println("đoi gia thanh cong!");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        return result;
    }

    public static void main(String[] args) {
        ImportDAO importDAO = new ImportDAO();
//       Import importedItem = importDAO.selectById(Integer.parseInt("1"));
//       System.out.println(importedItem.toString());
//
//       List<ImportDetail> importDetails =  importedItem.getImportDetailList();
//       int x = importDetails.size();
//       System.out.println(x);
//       for(ImportDetail i: importDetails){
//           System.out.println(i.getProduct().getProduct_name());
        System.out.println(importDAO.creatId());

    }
}

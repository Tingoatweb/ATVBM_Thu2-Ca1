package database;
//KET NOI db-> tao bang log(id, leved, national...)
//dinh nghia absModel, IModel
//->dinh nghia model=> log
//=> log Dao: login logout, access
//=> trang Ql=> Show (Co the dung database)
//dung server size
//=>detail
//=> xoa(xoa nhieu, xoa 1 record00
// kiem tra request thuoc quoc gia nao)? ip2location
//=> chuyen tu int sang ip hoac ip ve int de kiem tra ma quoc gia


import model.Log;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;


public class LogDAO implements DAOInterface<Log>{

    public int creatId() {
        ArrayList<Log> list=this.selectAll();
        return list.get(list.size()-1).getId()+1;
    }
    @Override
    public int deleteAll(ArrayList<Log> list) {
        return 0;
    }

    public void login(){

    }

    @Override
    public ArrayList <Log>selectAll() {
        ArrayList<Log> logs = new ArrayList<>();
        try {
            // tao mot connection
            Connection con = JDBCUtil.getConnection();

            // tao cau lenh sql
            String sql = "SELECT * FROM log";

            PreparedStatement st = con.prepareStatement(sql);

            // thuc thi

            ResultSet rs = st.executeQuery();

            while (rs.next()) {

                int id = rs.getInt("idlog");
                String level = rs.getString("level");
                Timestamp timestamp = rs.getTimestamp("time");
                LocalDateTime createAt = (timestamp != null) ? timestamp.toLocalDateTime() : null;
                String address = rs.getString("address");
                String preValue = rs.getString("preValue");
                String value = rs.getString("value");
                String national = rs.getString("national");

                Log log = new Log(id, level, createAt, address, preValue, value, national);


                logs.add(log);

            }

            JDBCUtil.closeConnection(con);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return logs;
    }

    @Override
    public Log selectById(int id) {
        return null;
    }

    @Override
    public int insert(Log log) {
        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "INSERT INTO log(idlog, time, level, address, preValue, value, national)"
                    + "VALUE(?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement rs = con.prepareStatement(sql);

            rs.setInt(1, log.getId());
            rs.setTimestamp(2, Timestamp.valueOf(log.getCreateAt()));
            rs.setString(3, log.getLevel());
            rs.setString(4, log.getAddress());
            rs.setString(5, log.getPreValue());
            rs.setString(6, log.getValue());
            rs.setString(7, log.getNational());


            result = rs.executeUpdate();

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        return result;
    }

    @Override
    public int delete(Log log) {
        return 0;
    }

    @Override
    public int update(Log log) {

        int result = 0;
        try {
            Connection con = JDBCUtil.getConnection();

            String sql = "INSERT INTO log(idlog, time, level, address, preValue, value, national)"
                    + "VALUE(?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement rs = con.prepareStatement(sql);

            rs.setInt(1, log.getId());
            rs.setTimestamp(2, Timestamp.valueOf(log.getCreateAt()));
            rs.setString(3, log.getLevel());
            rs.setString(4, log.getAddress());
            rs.setString(5, log.getPreValue());
            rs.setString(6, log.getValue());
            rs.setString(7, log.getNational());


            result = rs.executeUpdate();

            JDBCUtil.closeConnection(con);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        return result;
    }


    @Override
    public int insertAll(ArrayList<Log> list) {
        return 0;
    }


}

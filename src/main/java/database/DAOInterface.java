package database;

import java.sql.SQLException;
import java.util.ArrayList;

public interface DAOInterface<T> {
    public ArrayList<T> selectAll();
    public T selectById(int id);


    public int insert(T t) throws SQLException;
    public int insertAll(ArrayList<T> list) throws SQLException;
    public int delete(T t);
    public int deleteAll(ArrayList<T> list);
    public int update(T t);
}

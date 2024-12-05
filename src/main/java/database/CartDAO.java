package database;

import model.Cart;

import java.util.ArrayList;

public class CartDAO implements DAOInterface<Cart> {

    @Override
    public ArrayList<Cart> selectAll() {
        return null;
    }

    @Override
    public Cart selectById(int id) {
        return null;
    }

    @Override
    public int insert(Cart cart) {
        return 0;
    }

    @Override
    public int insertAll(ArrayList<Cart> list) {
        return 0;
    }

    @Override
    public int delete(Cart cart) {
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Cart> list) {
        return 0;
    }

    @Override
    public int update(Cart cart) {
        return 0;
    }

}
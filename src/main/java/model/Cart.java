package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class Cart {
    private String cartId;
    private User buyer;
    private Date buyDate;
    private List<CartItem> cart_items;
    public Cart(String cartId, User buyer, Date buyDate) {
        super();
        this.cartId = cartId;
        this.buyer = buyer;
        this.buyDate = buyDate;
    }

    public Cart() {
        this.cart_items = new ArrayList<>();
    }
    public boolean isEmpty() {
        return cart_items == null || cart_items.isEmpty();
    }

    public List<CartItem> getCart_items() {
        return cart_items;
    }
    public void setCart_items(List<CartItem> cart_items) {
        this.cart_items = cart_items;
    }
    public User getBuyer() {
        return buyer;
    }
    public void setBuyer(User buyer) {
        this.buyer = buyer;
    }
    public String getCartId() {
        return cartId;
    }
    public void setCartId(String cartId) {
        this.cartId = cartId;
    }

    public Date getBuyDate() {
        return buyDate;
    }
    public void setBuyDate(Date buyDate) {
        this.buyDate = buyDate;
    }
    //tinh tong so luong san pham
    public int calculateTotalQuantity() {
        int totalQuantity = 0;
        if (cart_items != null) {
            for (CartItem item : cart_items) {
                totalQuantity += item.getQuantity();
            }
        }
        return totalQuantity;
    }
    public void removeItem(int productid) {
        Iterator<CartItem> iterator = cart_items.iterator();
        while (iterator.hasNext()) {
            CartItem cartItem = iterator.next();
            if (cartItem.getProduct().getProductId()==productid) {
                iterator.remove();
                return; // Đã xóa sản phẩm, không cần kiểm tra các phần tử khác
            }
        }

    }
    public double calculateTotal() {
        double total = 0;

        if (cart_items != null) {
            for (CartItem item : cart_items) {
                total += item.getProduct().getPrice() * item.getQuantity();
            }
        }

        return total;
    }

    public void addToCart(CartItem cartItem) {
        // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng chưa
        for (CartItem item : cart_items) {
            if (item.getProduct().getProductId()==cartItem.getProduct().getProductId()) {
                // Nếu đã tồn tại, tăng số lượng lên
                item.setQuantity(item.getQuantity() + cartItem.getQuantity());
                return;
            }
        }
        // Nếu chưa tồn tại, thêm mới vào giỏ hàng
        cart_items.add(cartItem);
    }
    public void updateQuantity(int productId, int newquantity) {
        for (CartItem cart_item : cart_items) {
            if(cart_item.getProduct().getProductId()==productId) {
                cart_item.setQuantity(newquantity);
                return;
            }
        }
    }
    public CartItem findCartItemId(int productid) {
        for (CartItem cart_item : cart_items) {
            if(cart_item.getProduct().getProductId()==productid) {
                return cart_item;
            }
        }
        return null;
    }
    public void increaseQuantity(int productId) {
        CartItem item = findCartItemId(productId);
        if(item!=null) {
            //tang so luong cua cartiem len 1
            item.setQuantity(item.getQuantity()+1);
        }
    }
    public void clearCart() {
        cart_items.clear();
    }
    public double calculateTotalPrice() {
        double totalPrice = 0;

        if (cart_items != null) {
            for (CartItem item : cart_items) {
                totalPrice += item.getProduct().getPrice() * item.getQuantity();
            }
        }

        return totalPrice;
    }

}
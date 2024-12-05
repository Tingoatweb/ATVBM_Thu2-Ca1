package model;

public class CartItem {
    private int cartItemId;
    private Product product;
    private int quantity;
    private double price;
    private Cart cart;

    public CartItem() {
    }

    public CartItem(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public CartItem(int cartItemId, Product product, int quantity, double price, Cart cart) {
        this.cartItemId = cartItemId;
        this.product = product;
        this.quantity = quantity;
        this.price = price;
        this.cart = cart;
    }

    public int getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(int cartItemId) {
        this.cartItemId = cartItemId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = Math.max(quantity, 1);
        this.price = totalProduct();
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }
    public double totalProduct() {
        return quantity*product.getPrice();
    }
}
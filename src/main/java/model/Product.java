package model;


import java.io.Serializable;
import java.util.List;

public class Product  implements Serializable {
    private int productId;
    private String product_name;
    private String description;
    private String image;
    private double unitPrice;
    private double price;
    private int quantity;
    private String author;
    private int publicationYear;
    private String publisher;
    private Category category;
    private List<Import> importList;
    private List<Comment> commentList;
    private List<Rating> ratingList;

    public Product(int productId, String product_name, String description, String image, double unitPrice, double price, int quantity, String author, int publicationYear, String publisher, Category category) {
        this.productId = productId;
        this.product_name = product_name;
        this.description = description;
        this.image = image;
        this.unitPrice = unitPrice;
        this.price = price;
        this.quantity = quantity;
        this.author = author;
        this.publicationYear = publicationYear;
        this.publisher = publisher;
        this.category = category;
    }

    public List<Import> getImportList() {
        return importList;
    }

    public void setImportList(List<Import> importList) {
        this.importList = importList;
    }

    public List<Comment> getCommentList() {
        return commentList;
    }

    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }

    public List<Rating> getRatingList() {
        return ratingList;
    }

    public void setRatingList(List<Rating> ratingList) {
        this.ratingList = ratingList;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getPublicationYear() {
        return publicationYear;
    }

    public void setPublicationYear(int publicationYear) {
        this.publicationYear = publicationYear;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public List<Import> getImportsList() {
        return importList;
    }

    public void setImportsList(List<Import> importList) {
        this.importList = importList;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productId=" + productId +
                ", product_name='" + product_name + '\'' +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                ", unitPrice=" + unitPrice +
                ", price=" + price +
                ", quantity=" + quantity +
                ", author='" + author + '\'' +
                ", publicationYear=" + publicationYear +
                ", publisher='" + publisher + '\'' +
                ", category=" + category +
                ", importList=" + importList +
                ", commentList=" + commentList +
                ", ratingList=" + ratingList +
                '}';
    }
}
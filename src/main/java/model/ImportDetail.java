package model;

public class ImportDetail {
    private int importDetail;
    private Import importId;
    private Product product;
    private int numberOfWarehouses; //so luong nhap
    private double unitPrice;//don gia/1 san pham
    private double totalPrice; //tong tien

    public ImportDetail(int importDetail, Import importId, Product product, int numberOfWarehouses, double unitPrice, double totalPrice) {
        this.importDetail = importDetail;
        this.importId = importId;
        this.product = product;
        this.numberOfWarehouses = numberOfWarehouses;
        this.unitPrice = unitPrice;
        this.totalPrice = totalPrice;
    }

    public int getImportDetail() {
        return importDetail;
    }

    public void setImportDetail(int importDetail) {
        this.importDetail = importDetail;
    }

    public Import getImportId() {
        return importId;
    }

    public void setImportId(Import importId) {
        this.importId = importId;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getNumberOfWarehouses() {
        return numberOfWarehouses;
    }

    public void setNumberOfWarehouses(int numberOfWarehouses) {
        this.numberOfWarehouses = numberOfWarehouses;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
}

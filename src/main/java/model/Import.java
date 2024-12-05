package model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Import {
    private int importId;
    private User importer; //nguoi nhap
    private String supplier; //nha cung cap
    private String note;
    private Date importDate; //ngay nhap
    private List<ImportDetail> importDetailList;
    private double totalPrice;


    public Import() {
    }

    public Import(int importId, User importer, String supplier, String note, Date importDate) {
        this.importId = importId;
        this.importer=importer;
        this.supplier = supplier;
        this.note = note;
        this.importDate = importDate;
        importDetailList = new ArrayList<>();
        this.totalPrice=0;
    }

    public Import(int importId, User importer, String supplier, String note, Date importDate, List<ImportDetail> importDetailList, double totalPrice) {
        this.importId = importId;
        this.importer = importer;
        this.supplier = supplier;
        this.note = note;
        this.importDate = importDate;
        this.importDetailList = importDetailList;
        this.totalPrice = totalPrice;
    }

    public Import(int importId, User importer, String supplier, String note, Date importDate, double totalPrice) {
        this.importId = importId;
        this.importer = importer;
        this.supplier = supplier;
        this.note = note;
        this.importDate = importDate;
        this.totalPrice = totalPrice;
        importDetailList = new ArrayList<>();
    }

    public User getImporter() {
        return importer;
    }

    public void setImporter(User importer) {
        this.importer = importer;
    }

    public int getImportId() {
        return importId;
    }

    public void setImportId(int importId) {
        this.importId = importId;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public java.sql.Date getImportDate() {
        return importDate;
    }

    public void setImportDate(Date importDate) {
        this.importDate = importDate;
    }

    public List<ImportDetail> getImportDetailList() {
        return importDetailList;
    }

    public void setImportDetailList(List<ImportDetail> importDetailList) {
        this.importDetailList = importDetailList;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
}

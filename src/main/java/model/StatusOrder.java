package model;

import com.mysql.cj.x.protobuf.MysqlxDatatypes;

public class StatusOrder {
    private int statusId;
    private String statusName;

    public StatusOrder() {
    }

    public StatusOrder(int statusId) {
        this.statusId = statusId;
    }

    public StatusOrder(int statusId, String statusName) {
        this.statusId = statusId;
        this.statusName = statusName;
    }

    public int getStatusId() {
        return statusId;
    }

    public void setStatusId(int statusId) {
        this.statusId = statusId;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
}

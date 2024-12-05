package model;

import java.sql.Date;
import java.util.List;

public class User{
    private int userId;
    private String username;
    private String password;
    private int role;
    private String name;
    private Date birthday;
    private String sexual;
    private String phone;
    private String email;
    private String avatar;
    private int failedLogin;
    private List<Order> orderList;

    public User(int userId, String username, String password, int role, String name, Date birthday, String sexual, String phone, String email, String avatar, int failedLogin) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.role = role;
        this.name = name;
        this.birthday = birthday;
        this.sexual = sexual;
        this.phone = phone;
        this.email = email;
        this.avatar = avatar;
        this.failedLogin = failedLogin;
    }

    public User(int userId, String username, String password, int role, String name, Date birthday, String sexual, String phone, String email, String avatar) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.role = role;
        this.name = name;
        this.birthday = birthday;
        this.sexual = sexual;
        this.phone = phone;
        this.email = email;
        this.avatar = avatar;
    }

    public int getFailedLogin() {
        return failedLogin;
    }

    public void setFailedLogin(int failedLogin) {
        this.failedLogin = failedLogin;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public java.sql.Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getSexual() {
        return sexual;
    }

    public void setSexual(String sexual) {
        this.sexual = sexual;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public List<Order> getOrderList() {
        return orderList;
    }

    public void setOrderList(List<Order> orderList) {
        this.orderList = orderList;
    }

}

package com.robotautomatic.robotshop.domain;

import com.funtl.my.shop.commons.persistence.BaseEntity;

import java.sql.Timestamp;

public class User extends BaseEntity {
    private Integer userId;
    private String userName;
    private String userPassword;
    private String userPhone;
    private String userEmail;
    private String userQQ;
    private Timestamp userCreated;
    private Timestamp userUpdated;

    public User(){

    }

    public User( String userName, String userPassword, String userPhone, String userEmail, String userQQ) {
        this.userName = userName;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userEmail = userEmail;
        this.userQQ = userQQ;
    }

    public User(Integer userId, String userName, String userPassword, String userPhone, String userEmail, String userQQ) {
        this.userId = userId;
        this.userName = userName;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.userEmail = userEmail;
        this.userQQ = userQQ;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userPhone='" + userPhone + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userQQ='" + userQQ + '\'' +
                ", userCreated=" + userCreated +
                ", userUpdated=" + userUpdated +
                '}';
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserQQ() {
        return userQQ;
    }

    public void setUserQQ(String userQQ) {
        this.userQQ = userQQ;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public Timestamp getUserCreated() {
        return userCreated;
    }

    public void setUserCreated(Timestamp userCreated) {
        this.userCreated = userCreated;
    }

    public Timestamp getUserUpdated() {
        return userUpdated;
    }

    public void setUserUpdated(Timestamp userUpdated) {
        this.userUpdated = userUpdated;
    }
}

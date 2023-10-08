/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class User {

    private int userId;
    private String fullName;
    private Date dateOfBirth;
    private String email;
    private String password;
    private String phone;
    private String address;
    private Boolean gender;
    private model.Role roleid;
    private String reason;
    private Date timeBan;
    private String avatar;
    private int courseCount;
   

    public User() {
    }

    public User(int userId, String fullName, Date dateOfBirth, String email, String password, String phone, String address, Boolean gender, Role roleid, String reason, Date timeBan, String avatar) {
        this.userId = userId;
        this.fullName = fullName;
        this.dateOfBirth = dateOfBirth;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.gender = gender;
        this.roleid = roleid;
        this.reason = reason;
        this.timeBan = timeBan;
        this.avatar = avatar;
    }
    

    public User(int userId, String fullName) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public Role getRoleid() {
        return roleid;
    }

    public void setRoleid(Role roleid) {
        this.roleid = roleid;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Date getTimeBan() {
        return timeBan;
    }

    public void setTimeBan(Date timeBan) {
        this.timeBan = timeBan;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getCourseCount() {
        return courseCount;
    }

    public void setCourseCount(int courseCount) {
        this.courseCount = courseCount;
    }

    

  

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", fullName=" + fullName + ", dateOfBirth=" + dateOfBirth + ", email=" + email + ", password=" + password + ", phone=" + phone + ", address=" + address + ", gender=" + gender + ", roleid=" + roleid + ", reason=" + reason + ", timeBan=" + timeBan + ", avatar=" + avatar + '}';
    }

   



}

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
public class Enroll {

    private User userId;
    private Course courseId;
    private boolean status;
    private int progess;
    private Date dateEnroll;

    public Enroll() {
    }

    public Enroll(User userId, Course courseId, boolean status, int progess, Date dateEnroll) {
        this.userId = userId;
        this.courseId = courseId;
        this.status = status;
        this.progess = progess;
        this.dateEnroll = dateEnroll;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public Course getCourseId() {
        return courseId;
    }

    public void setCourseId(Course courseId) {
        this.courseId = courseId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getProgess() {
        return progess;
    }

    public void setProgess(int progess) {
        this.progess = progess;
    }

    public Date getDateEnroll() {
        return dateEnroll;
    }

    public void setDateEnroll(Date dateEnroll) {
        this.dateEnroll = dateEnroll;
    }

    @Override
    public String toString() {
        return "Enroll{" + "userId=" + userId + ", courseId=" + courseId + ", status=" + status + ", progess=" + progess + ", dateEnroll=" + dateEnroll + '}';
    }
    
    
    
}

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
public class Course {
    private int courseId;
    private User userId;
    private Category categoryId;
    private String courseImg;
    private String courseName;
    private Date Publish;
    private Double duration;
    private String report;
    private boolean idContinued;
    private int newVersion;
    private String description;

    public Course() {
    }

    public Course(int courseId, User userId, Category categoryId, String courseImg, String courseName, Date Publish, Double duration, String report, boolean idContinued, int newVersion, String description) {
        this.courseId = courseId;
        this.userId = userId;
        this.categoryId = categoryId;
        this.courseImg = courseImg;
        this.courseName = courseName;
        this.Publish = Publish;
        this.duration = duration;
        this.report = report;
        this.idContinued = idContinued;
        this.newVersion = newVersion;
        this.description = description;
    }

    public Course(int courseId, Category categoryId, String courseImg, String courseName, Date Publish, Double duration, String report, boolean idContinued, int newVersion, String description) {
        this.courseId = courseId;
        this.categoryId = categoryId;
        this.courseImg = courseImg;
        this.courseName = courseName;
        this.Publish = Publish;
        this.duration = duration;
        this.report = report;
        this.idContinued = idContinued;
        this.newVersion = newVersion;
        this.description = description;
    }
    

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public Category getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Category categoryId) {
        this.categoryId = categoryId;
    }

    public String getCourseImg() {
        return courseImg;
    }

    public void setCourseImg(String courseImg) {
        this.courseImg = courseImg;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Date getPublish() {
        return Publish;
    }

    public void setPublish(Date Publish) {
        this.Publish = Publish;
    }

    public Double getDuration() {
        return duration;
    }

    public void setDuration(Double duration) {
        this.duration = duration;
    }

    public String getReport() {
        return report;
    }

    public void setReport(String report) {
        this.report = report;
    }

    public boolean isIdContinued() {
        return idContinued;
    }

    public void setIdContinued(boolean idContinued) {
        this.idContinued = idContinued;
    }

    public int getNewVersion() {
        return newVersion;
    }

    public void setNewVersion(int newVersion) {
        this.newVersion = newVersion;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "course{" + "courseId=" + courseId + ", userId=" + userId + ", categoryId=" + categoryId + ", courseImg=" + courseImg + ", courseName=" + courseName + ", Publish=" + Publish + ", duration=" + duration + ", report=" + report + ", idContinued=" + idContinued + ", newVersion=" + newVersion + ", description=" + description + '}';
    }
    
}

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
public class Review {
    private int reviewId;
    private Course courseId;
    private User userId;
    private int rating;
    private Date time;
    private String reviewContent;
    private boolean isReport;

    public Review() {
    }

    public Review(int reviewId, Course courseId, User userId, int rating, Date time, String reviewContent, boolean isReport) {
        this.reviewId = reviewId;
        this.courseId = courseId;
        this.userId = userId;
        this.rating = rating;
        this.time = time;
        this.reviewContent = reviewContent;
        this.isReport = isReport;
    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public Course getCourseId() {
        return courseId;
    }

    public void setCourseId(Course courseId) {
        this.courseId = courseId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getReviewContent() {
        return reviewContent;
    }

    public void setReviewContent(String reviewContent) {
        this.reviewContent = reviewContent;
    }

    public boolean isIsReport() {
        return isReport;
    }

    public void setIsReport(boolean isReport) {
        this.isReport = isReport;
    }

    @Override
    public String toString() {
        return "Review{" + "reviewId=" + reviewId + ", courseId=" + courseId + ", userId=" + userId + ", rating=" + rating + ", time=" + time + ", reviewContent=" + reviewContent + ", isReport=" + isReport + '}';
    }
    
   
    
    
}

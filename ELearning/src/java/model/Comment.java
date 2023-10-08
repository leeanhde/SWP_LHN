/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Timestamp;

/**
 *
 * @author ADMIN
 */
public class Comment {

    private int commentId;
    private Lesson lessonId;
    private User userId;
    private String content;
    private int like;
    private int disLike;
    private boolean isReply;
    private String image;
    private boolean status;
    private Timestamp commentDate;

    public Comment() {
    }

    public Comment(Lesson lessonId, User userId, String content, int like, int disLike, boolean isReply, String image, boolean status, Timestamp commentDate) {
        this.lessonId = lessonId;
        this.userId = userId;
        this.content = content;
        this.like = like;
        this.disLike = disLike;
        this.isReply = isReply;
        this.image = image;
        this.status = status;
        this.commentDate = commentDate;
    }

    public Comment(int commentId, Lesson lessonId, User userId, String content, int like, int disLike, boolean isReply, String image, boolean status, Timestamp commentDate) {
        this.commentId = commentId;
        this.lessonId = lessonId;
        this.userId = userId;
        this.content = content;
        this.like = like;
        this.disLike = disLike;
        this.isReply = isReply;
        this.image = image;
        this.status = status;
        this.commentDate = commentDate;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public Lesson getLessonId() {
        return lessonId;
    }

    public void setLessonId(Lesson lessonId) {
        this.lessonId = lessonId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public String getcontent() {
        return content;
    }

    public void setcontent(String content) {
        this.content = content;
    }

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public int getDisLike() {
        return disLike;
    }

    public void setDisLike(int disLike) {
        this.disLike = disLike;
    }

    public boolean isIsReply() {
        return isReply;
    }

    public void setIsReply(boolean isReply) {
        this.isReply = isReply;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Timestamp getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Timestamp commentDate) {
        this.commentDate = commentDate;
    }

    @Override
    public String toString() {
        return "Comment{" + "commentId=" + commentId + ", lessonId=" + lessonId + ", userId=" + userId + ", content=" + content + ", like=" + like + ", disLike=" + disLike + ", isReply=" + isReply + ", image=" + image + ", status=" + status + ", commentDate=" + commentDate + '}';
    }

}

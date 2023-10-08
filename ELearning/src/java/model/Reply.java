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
public class Reply {

    private int replyId;
    private Comment commentId;
    private User userId;
    private String content;
    private Timestamp relpyDate;
    private String image;
    private boolean status;
    private int like;
    private int display;

    public Reply() {
    }

    public Reply(int replyId, Comment commentId, User userId, String Content, Timestamp relpyDate, String image, boolean status, int like, int display) {
        this.replyId = replyId;
        this.commentId = commentId;
        this.userId = userId;
        this.content = Content;
        this.relpyDate = relpyDate;
        this.image = image;
        this.status = status;
        this.like = like;
        this.display = display;
    }

    public int getReplyId() {
        return replyId;
    }

    public void setReplyId(int replyId) {
        this.replyId = replyId;
    }

    public Comment getCommentId() {
        return commentId;
    }

    public void setCommentId(Comment commentId) {
        this.commentId = commentId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getRelpyDate() {
        return relpyDate;
    }

    public void setRelpyDate(Timestamp relpyDate) {
        this.relpyDate = relpyDate;
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

    public int getLike() {
        return like;
    }

    public void setLike(int like) {
        this.like = like;
    }

    public int getDisplay() {
        return display;
    }

    public void setDisplay(int display) {
        this.display = display;
    }

    @Override
    public String toString() {
        return "Reply{" + "replyId=" + replyId + ", commentId=" + commentId + ", userId=" + userId + ", Content=" + content + ", relpyDate=" + relpyDate + ", image=" + image + ", status=" + status + ", like=" + like + ", display=" + display + '}';
    }

}

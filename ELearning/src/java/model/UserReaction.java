/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class UserReaction {
    private User userId;
    private Comment commentId;
    private boolean isLike;
    private boolean isDisLike;

    public UserReaction() {
    }

    public UserReaction(User userId, Comment commentId, boolean isLike, boolean isDisLike) {
        this.userId = userId;
        this.commentId = commentId;
        this.isLike = isLike;
        this.isDisLike = isDisLike;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public Comment getCommentId() {
        return commentId;
    }

    public void setCommentId(Comment commentId) {
        this.commentId = commentId;
    }

    public boolean isIsLike() {
        return isLike;
    }

    public void setIsLike(boolean isLike) {
        this.isLike = isLike;
    }

    public boolean isIsDisLike() {
        return isDisLike;
    }

    public void setIsDisLike(boolean isDisLike) {
        this.isDisLike = isDisLike;
    }

    @Override
    public String toString() {
        return "UserReaction{" + "userId=" + userId + ", commentId=" + commentId + ", isLike=" + isLike + ", isDisLike=" + isDisLike + '}';
    }
    
    
    
    
}

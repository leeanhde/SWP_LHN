/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Progress {
    private User userID;
    private Lesson lessonNumber;
    private Mooc moocId;
    private boolean state;

    public Progress() {
    }

    public Progress(User userID, Lesson lessonNumber, Mooc moocId, boolean state) {
        this.userID = userID;
        this.lessonNumber = lessonNumber;
        this.moocId = moocId;
        this.state = state;
    }

    public User getUserID() {
        return userID;
    }

    public void setUserID(User userID) {
        this.userID = userID;
    }

    public Lesson getLessonNumber() {
        return lessonNumber;
    }

    public void setLessonNumber(Lesson lessonNumber) {
        this.lessonNumber = lessonNumber;
    }

    public Mooc getMoocId() {
        return moocId;
    }

    public void setMoocId(Mooc moocId) {
        this.moocId = moocId;
    }

    public boolean isState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Progress{" + "userID=" + userID + ", lessonNumber=" + lessonNumber + ", moocId=" + moocId + ", state=" + state + '}';
    }
    
}

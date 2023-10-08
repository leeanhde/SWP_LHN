/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Lesson {

    private int lessonId;
    private int lessonNumber;
    private String lessonName;
    private Mooc moocId;
    private String lessonUrl;
    private String description;

    public Lesson(int lessonId, int lessonNumber, String lessonName, Mooc moocId, String lessonUrl, String description) {
        this.lessonId = lessonId;
        this.lessonNumber = lessonNumber;
        this.lessonName = lessonName;
        this.moocId = moocId;
        this.lessonUrl = lessonUrl;
        this.description = description;
    }

    public Lesson() {
    }

    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    public int getLessonNumber() {
        return lessonNumber;
    }

    public void setLessonNumber(int lessonNumber) {
        this.lessonNumber = lessonNumber;
    }

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

    public Mooc getMoocId() {
        return moocId;
    }

    public void setMoocId(Mooc moocId) {
        this.moocId = moocId;
    }

    public String getLessonUrl() {
        return lessonUrl;
    }

    public void setLessonUrl(String lessonUrl) {
        this.lessonUrl = lessonUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Lesson{" + "lessonId=" + lessonId + ", lessonNumber=" + lessonNumber + ", lessonName=" + lessonName + ", moocId=" + moocId + ", lessonUrl=" + lessonUrl + ", description=" + description + '}';
    }

}

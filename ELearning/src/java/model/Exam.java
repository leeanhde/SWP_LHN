/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Exam {

    private int examId;
    private String examName;
    private Course courseId;
    private int duration;
    private int quantity;

    public Exam() {
    }

    public Exam(int examId, String examName, Course courseId, int duration, int quantity) {
        this.examId = examId;
        this.examName = examName;
        this.courseId = courseId;
        this.duration = duration;
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getExamId() {
        return examId;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
    }

    public Course getCourseId() {
        return courseId;
    }

    public void setCourseId(Course courseId) {
        this.courseId = courseId;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    @Override
    public String toString() {
        return "Exam{" + "examId=" + examId + ", examName=" + examName + ", courseId=" + courseId + ", duration=" + duration + ", quantity=" + quantity + '}';
    }

   

}

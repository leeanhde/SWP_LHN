/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 *
 * @author ADMIN
 */
public class ExamDetail {

    private int examDetailId;
    private User userId;
    private Exam examId;
    private Timestamp timeStart;
    private Timestamp timeEnd;
    private boolean status;
    private float score;

    public ExamDetail() {
    }

    public ExamDetail(int examDetailId, User userId, Exam examId, Timestamp timeStart, Timestamp timeEnd, boolean status, float score) {
        this.examDetailId = examDetailId;
        this.userId = userId;
        this.examId = examId;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        this.status = status;
        this.score = score;
    }

    public int getExamDetailId() {
        return examDetailId;
    }

    public void setExamDetailId(int examDetailId) {
        this.examDetailId = examDetailId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public Exam getExamId() {
        return examId;
    }

    public void setExamId(Exam examId) {
        this.examId = examId;
    }

    public Timestamp getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(Timestamp timeStart) {
        this.timeStart = timeStart;
    }

    public Timestamp getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(Timestamp timeEnd) {
        this.timeEnd = timeEnd;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "ExamDetail{" + "examDetailId=" + examDetailId + ", userId=" + userId + ", examId=" + examId + ", timeStart=" + timeStart + ", timeEnd=" + timeEnd + ", status=" + status + ", score=" + score + '}';
    }

}

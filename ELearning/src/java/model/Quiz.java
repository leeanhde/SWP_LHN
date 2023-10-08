/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Quiz {

    private int quizId;
    private String quizContent;
    private Exam examId;

    public Quiz() {
    }

    public Quiz(int quizId, String quizContent, Exam examId) {
        this.quizId = quizId;
        this.quizContent = quizContent;
        this.examId = examId;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public String getQuizContent() {
        return quizContent;
    }

    public void setQuizContent(String quizContent) {
        this.quizContent = quizContent;
    }

    public Exam getExamId() {
        return examId;
    }

    public void setExamId(Exam examId) {
        this.examId = examId;
    }

    @Override
    public String toString() {
        return "Quiz{" + "quizId=" + quizId + ", quizContent=" + quizContent + ", examId=" + examId + '}';
    }

}

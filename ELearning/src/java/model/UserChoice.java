/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class UserChoice {
    private int userChoiceId;
    private ExamDetail examDetailId;
    private Choice choiceId;

    public UserChoice() {
    }

    public UserChoice(int userChoiceId, ExamDetail examDetailId, Choice choiceId) {
        this.userChoiceId = userChoiceId;
        this.examDetailId = examDetailId;
        this.choiceId = choiceId;
    }

    public int getUserChoiceId() {
        return userChoiceId;
    }

    public void setUserChoiceId(int userChoiceId) {
        this.userChoiceId = userChoiceId;
    }

    public ExamDetail getExamDetailId() {
        return examDetailId;
    }

    public void setExamDetailId(ExamDetail examDetailId) {
        this.examDetailId = examDetailId;
    }

    public Choice getChoiceId() {
        return choiceId;
    }

    public void setChoiceId(Choice choiceId) {
        this.choiceId = choiceId;
    }

    @Override
    public String toString() {
        return "UserChoice{" + "userChoiceId=" + userChoiceId + ", examDetailId=" + examDetailId + ", choiceId=" + choiceId + '}';
    }
    
}

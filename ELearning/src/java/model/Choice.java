/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Choice {
    private int choiceId;
    private Quiz quizId;
    private String Description;
    private boolean isTrue;

    public Choice() {
    }

    public Choice(int choiceId, Quiz quizId, String Description, boolean isTrue) {
        this.choiceId = choiceId;
        this.quizId = quizId;
        this.Description = Description;
        this.isTrue = isTrue;
    }

    public int getChoiceId() {
        return choiceId;
    }

    public void setChoiceId(int choiceId) {
        this.choiceId = choiceId;
    }

    public Quiz getQuizId() {
        return quizId;
    }

    public void setQuizId(Quiz quizId) {
        this.quizId = quizId;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public boolean isIsTrue() {
        return isTrue;
    }

    public void setIsTrue(boolean isTrue) {
        this.isTrue = isTrue;
    }

    @Override
    public String toString() {
        return "Choice{" + "choiceId=" + choiceId + ", quizId=" + quizId + ", Description=" + Description + ", isTrue=" + isTrue + '}';
    }
    
}

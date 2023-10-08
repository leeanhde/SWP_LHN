/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Choice;
import model.ExamDetail;
import model.UserChoice;

/**
 *
 * @author ADMIN
 */
public class UserChoiceDAO extends DBContext {

    public ArrayList<UserChoice> selectUserChoiceByUserExamID(int userId, int examId) {
        ArrayList<UserChoice> listUserChoice = new ArrayList<>();
        UserChoice userChoice = null;
        try {
            String sql = "select * from UserChoices as uc \n"
                    + "inner join ExamDetail as ed\n"
                    + "on uc.ExamDetailID=ed.ExamDetailID\n"
                    + "inner join Choices as c\n"
                    + "on c.ChoiceID=uc.ChoiceID\n"
                    + "where userID=? and examID=? and ed.ExamDetailID = (SELECT MAX(ExamDetailID) FROM ExamDetail) ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.setInt(2, examId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int userChoiceId = rs.getInt("UserChoiceID");
                int examDetailId = rs.getInt("ExamDetailID");
                ExamDetail examDetail = new ExamDetailDAO().selectById(examDetailId);
                int choiceId = rs.getInt("ChoiceID");
                Choice choice = new ChoiceDAO().selectById(choiceId);
                userChoice = new UserChoice(userChoiceId, examDetail, choice);

                listUserChoice.add(userChoice);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listUserChoice;
    }

    public int addUserChoice(int examDetailId, int choiceId) {
        int check = 0;
        try {
            final String sql = "INSERT INTO ELearning.dbo.UserChoices\n"
                    + "( ExamDetailID, ChoiceID)\n"
                    + "VALUES(?,?);";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, examDetailId);
            st.setInt(2, choiceId);
            check = st.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return check;
    }

    public static void main(String[] args) {
        UserChoiceDAO d = new UserChoiceDAO();
        ArrayList<UserChoice> listUserChoice = new ArrayList<>();
        listUserChoice = d.selectUserChoiceByUserExamID(0, 0);
        ArrayList<Integer> listUserChoiceId = new ArrayList<>();

        for (UserChoice userChoice : listUserChoice) {
            System.out.println((userChoice.getChoiceId().getQuizId().getExamId().getExamName()));
        }
    }
}

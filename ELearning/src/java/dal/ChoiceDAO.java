/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import static dal.DBContext.connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Choice;
import model.Exam;
import model.Quiz;

/**
 *
 * @author ADMIN
 */
public class ChoiceDAO extends DBContext implements DAO {

    public ArrayList selectAllChoiceByQuizID(int quizId) {
        ArrayList<Choice> listChoice = new ArrayList<Choice>();
        Choice choice = null;
        try {
            String sql = "SELECT * FROM Choices where QuizID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quizId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                int choiceId = rs.getInt("ChoiceID");
                Quiz quiz = new QuizDAO().selectById(quizId);
                String des = rs.getString("Description");
                Boolean isTrue = rs.getBoolean("IsTrue");

                choice = new Choice(choiceId, quiz, des, isTrue);

                listChoice.add(choice);
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
        return listChoice;
    }

    public ArrayList getListRightAnswerByExamID(int examId) {
        ArrayList<Integer> listRightAnswer = new ArrayList<Integer>();
        try {
            String sql = "select * from Quiz as q\n"
                    + "inner join Choices as c\n"
                    + "on q.QuizID =c.QuizID\n"
                    + "where ExamID=? and IsTrue=1";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, examId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                int choice = rs.getInt("ChoiceID");
                listRightAnswer.add(choice);
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
        return listRightAnswer;
    }

    @Override
    public ArrayList selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Choice selectById(int id) {

        Choice choice = null;
        try {
            String sql = "SELECT * FROM Choices WHERE ChoiceID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                int choiceId = rs.getInt("ChoiceID");
                int quizId = rs.getInt("QuizID");
                Quiz quiz = new QuizDAO().selectById(quizId);
                String description = rs.getString("Description");
                boolean isTrue = rs.getBoolean("IsTrue");

                choice = new Choice(choiceId, quiz, description, isTrue);
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
        return choice;
    }

    public static void main(String[] args) {
        ChoiceDAO d = new ChoiceDAO();
        Choice c = new Choice();
        c = d.selectById(1);
        System.out.println(c);
    }

    @Override
    public int insert(Object t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insertAll(ArrayList arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int delete(Object t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int deleteAll(ArrayList arr) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int update(Object t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int updateById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}

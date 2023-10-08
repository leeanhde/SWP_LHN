/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Exam;
import model.Quiz;

/**
 *
 * @author ADMIN
 */
public class QuizDAO extends DBContext implements DAO {

    public ArrayList selectAllQuizByExamID(int examId) {
        ArrayList<Quiz> listQuiz = new ArrayList<Quiz>();
        Quiz quiz = null;
        try {
            String sql = "SELECT * FROM Quiz where ExamID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, examId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                int quizId = rs.getInt("QuizID");
                String content = rs.getString("QuizContent");
                Exam exem = new ExamDAO().selectExamByExamId(examId);

                quiz = new Quiz(quizId, content, exem);

                listQuiz.add(quiz);
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
        return listQuiz;
    }

 

    @Override
    public ArrayList selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Quiz selectById(int quizId) {

        Quiz quiz = null;
        try {
            String sql = "SELECT * FROM Quiz WHERE QuizID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, quizId);
            final ResultSet rs = st.executeQuery();
            while (rs.next()) {

                String content = rs.getString("QuizContent");
                int examId = rs.getInt("ExamID");
                Exam exem = new ExamDAO().selectExamByExamId(examId);

                quiz = new Quiz(quizId, content, exem);

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
        return quiz;

    }
       public static void main(String[] args) {
        QuizDAO d = new QuizDAO();
        Quiz q= new Quiz();
        ArrayList<Quiz> listQuiz = new ArrayList<Quiz>();
           System.out.println(d.selectById(3).toString());
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

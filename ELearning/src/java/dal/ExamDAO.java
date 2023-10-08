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
import model.Course;
import model.Exam;
import model.ExamDetail;
import model.User;

/**
 *
 * @author ADMIN
 */
public class ExamDAO extends DBContext implements DAO {

    public ArrayList selectExamByCourseId(int courseId) {
        ArrayList<Exam> listExam = new ArrayList<Exam>();
        Exam exam = null;
        try {
            String sql = "SELECT * FROM Exams WHERE CourseID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, courseId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int examId = rs.getInt("ExamID");
                String examName = rs.getString("ExamName");
                Course course = new CourseDAO().selectById(courseId);
                int duration = rs.getInt("Duration");
                int quantity = rs.getInt("Quantity");
                exam = new Exam(examId, examName, course, duration, quantity);
                listExam.add(exam);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listExam;
    }

    public Exam selectExamByExamId(int examId) {
        Exam exam = null;
        try {
            String sql = "SELECT * FROM Exams WHERE ExamID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, examId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String examName = rs.getString("ExamName");
                int courseId = rs.getInt("CourseID");
                Course course = new CourseDAO().selectById(courseId);
                int duration = rs.getInt("Duration");
                int quantity = rs.getInt("Quantity");
                exam = new Exam(examId, examName, course, duration, quantity);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return exam;
    }

    @Override
    public ArrayList selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Exam selectById(int id) {
        Exam exam = null;
        try {
            String sql = "SELECT * FROM Exams WHERE ExamID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            final ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int examId = rs.getInt("ExamID");
                String examName = rs.getString("ExamName");
                int courseId = rs.getInt("CourseID");
                Course course = new CourseDAO().selectById(courseId);
                int duration = rs.getInt("Duration");
                int quantity = rs.getInt("Quantity");
                exam = new Exam(examId, examName, course, duration, quantity);
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
        return exam;
    }

    public static void main(String[] args) {
        ExamDAO d = new ExamDAO();
        Exam ex = new Exam();
        ArrayList<Exam> listExam = new ArrayList<Exam>();
        ex = d.selectById(1);
        System.out.println(ex);
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Lesson;
import model.Mooc;
import model.Role;

/**
 *
 * @author ADMIN
 */
public class LessonDAO extends DBContext implements DAO {

    public ArrayList selectLessonByMoocId(int moocId) {
        final ArrayList<Lesson> listLesson = new ArrayList<Lesson>();
        Lesson lesson = null;
        try {
            String sql = "SELECT * FROM Lessons WHERE MoocID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, moocId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int lessonId = rs.getInt("LessonID");
                int lessonNumber = rs.getInt("LessonNumber");
                String lessonName = rs.getString("LessonName");
                String lessonUrl = rs.getString("LessonUrl");
                String description = rs.getString("Description");
                Mooc mooc = new MoocDAO().selectById(moocId);
                lesson = new Lesson(lessonId, lessonNumber, lessonName, mooc, lessonUrl, description);
                listLesson.add(lesson);
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
        return listLesson;
    }
    
//    public boolean checkLessonIsLearn(int userId, int lessonId){
//        try {
//            
//            String sql = "SELECT * FROM Lessons WHERE LessonID=?";
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, id);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                int lessonId = rs.getInt("LessonID");
//                int lessonNumber = rs.getInt("LessonNumber");
//                String lessonName = rs.getString("LessonName");
//                String lessonUrl = rs.getString("LessonUrl");
//                String description = rs.getString("Description");
//                int moocId = rs.getInt("MoocID");
//                Mooc mooc = new MoocDAO().selectById(moocId);
//                lesson = new Lesson(lessonId, lessonNumber, lessonName, mooc, lessonUrl, description);
//            }
//        } catch (Exception e) {
//        }
//    }
  

    @Override
    public ArrayList selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Lesson selectById(int id) {
        Lesson lesson = null;
        try {
            String sql = "SELECT * FROM Lessons WHERE LessonID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int lessonId = rs.getInt("LessonID");
                int lessonNumber = rs.getInt("LessonNumber");
                String lessonName = rs.getString("LessonName");
                String lessonUrl = rs.getString("LessonUrl");
                String description = rs.getString("Description");
                int moocId = rs.getInt("MoocID");
                Mooc mooc = new MoocDAO().selectById(moocId);
                lesson = new Lesson(lessonId, lessonNumber, lessonName, mooc, lessonUrl, description);
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
        return lesson;

    }

      public static void main(String[] args) {
        LessonDAO f = new LessonDAO();
        Lesson l = new Lesson();
        l = f.selectById(0);
            System.out.println(l);
        
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

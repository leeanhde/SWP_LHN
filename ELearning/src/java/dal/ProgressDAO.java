/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Logger;
import java.util.logging.Level;

/**
 *
 * @author ADMIN
 */
public class ProgressDAO extends DBContext implements DAO {

    public static int getLessonLearnedByUserId(int userId) {

        try {
            String sql = "select SUM(LessonNumber)  from Progress\n"
                    + "where UserID=? ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                return rs.getInt("");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(MoocDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }

    public static int getTotalLessonByCourseID(int courseId) {

        try {
            String sql = "Select COUNT(*) from Course AS c\n"
                    + "INNER JOIN Mooc AS m on c.CourseID=m.CourseID\n"
                    + "INNER JOIN Lesson as l on m.MoocID= l.MoocID\n"
                    + "WHERE c.CourseID =?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, courseId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(MoocDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }

    public int getNumberLessonLerned(int courseID, int userID) {
        try {
            String sql = "select NumberLearned from Progress2 \n"
                    + "where  CourseID=? and UserID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, courseID);
            st.setInt(2, userID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("NumberLearned");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(MoocDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }

    public int addLessonProgress(int userId, int courseId) {
        try {
            String sql = "UPDATE Progress2\n"
                    + "SET NumberLearned=NumberLearned+1\n"
                    + "Where UserID=? and CourseID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.setInt(2, courseId);
            int rs = st.executeUpdate();
            return rs;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(MoocDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }

    public static void main(String[] args) {
        ProgressDAO d = new ProgressDAO();
       d.addLessonProgress(0,0);
    }

    @Override
    public ArrayList selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Object selectById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
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

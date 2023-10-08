/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import static dal.DBContext.connection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Course;
import model.Enroll;
import model.Role;
import model.User;

/**
 *
 * @author ADMIN
 */
public class EnrollDAO extends DBContext implements DAO {

    public int totalParticipationInCourse(int id) {
        int total = 0;

        try {
            String sql = "SELECT COUNT(CourseID) \n"
                    + "FROM Enroll  \n"
                    + "WHERE CourseID=?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                total = rs.getInt("");

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(EnrollDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return total;
    }

    public ArrayList getListcourseEnrolledByUserID(int userId) {
        ArrayList<Enroll> listCourse = new ArrayList<Enroll>();
        Enroll enroll= null;
        try {
            final String sql = "select * from Enroll \n"
                    + "where UserID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            final ResultSet rs = st.executeQuery();
            while (rs.next()) {

                int courseId = rs.getInt("CourseID");
                Course course = new CourseDAO().selectById(courseId);

                User user=  new UserDAO().selectById(userId);
                
                boolean status = rs.getBoolean("Status");
                int progress = rs.getInt("Progress");
                Date dateEnroll= rs.getDate("DateEnroll");
                
                enroll = new Enroll(user, course, status, progress, dateEnroll);
                listCourse.add(enroll);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listCourse;
    }
    public boolean enrollCourse(int userID, int courseID){
            try {
            String sql = "INSERT INTO Enroll VALUES (?,?,0,0,GETDATE())";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,  userID);
            st.setInt(2,  courseID);
            int check = st.executeUpdate();
            if(check==1){
                return true;
            }
            else{
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
    
    public boolean unEnrollCourse(int userID, int courseID){
            try {
            String sql = "DELETE FROM Enroll WHERE UserID = ? and CourseID = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1,  userID);
            st.setInt(2,  courseID);
            int check = st.executeUpdate();
            if(check==1){
                return true;
            }
            else{
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(CourseDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    public static void main(String[] args) {
        EnrollDAO dao = new EnrollDAO();
        dao.unEnrollCourse(2, 6);
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

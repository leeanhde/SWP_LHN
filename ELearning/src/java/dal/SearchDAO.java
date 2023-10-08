/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import static dal.DBContext.connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Course;
import model.User;

/**
 *
 * @author ADMIN
 */
public class SearchDAO extends DBContext {

    public ArrayList searchTwoWord(String content_search) {
        ArrayList<Course> listCourse = new ArrayList<Course>();
        Course course = null;
        try {
            String sql = "DECLARE @MaxRank INT;\n"
                    + "WITH MaxRankCTE AS (\n"
                    + "    SELECT Max(RANK) AS MaxRank\n"
                    + "    FROM Course\n"
                    + "    JOIN FREETEXTTABLE(Course, *, ?) AS TBL ON TBL.[KEY] = Course.CourseID\n"
                    + ")\n"
                    + "SELECT @MaxRank = MaxRank FROM MaxRankCTE;\n"
                    + "select  Course.*,TBL.RANK\n"
                    + "from Course\n"
                    + "join\n"
                    + "FREETEXTTABLE(Course,*,?)as TBL\n"
                    + "on TBL.[KEY]=Course.CourseID\n"
                    + "where RANK=@MaxRank\n"
                    + "ORDER BY LEN(Course.CourseName) DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, content_search);
            st.setString(2, content_search);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int courseId = rs.getInt("CourseID");
                String courseImg = rs.getString("CourseImg");
                String courseName = rs.getString("CourseName");
                Date publish = rs.getDate("Publish");
                Double duration = rs.getDouble("Duration");
                String report = rs.getString("Report");
                Boolean isDiscontinued = rs.getBoolean("IsDiscontinued");
                int newVersionId = rs.getInt("newVersionId");
                String description = rs.getString("Description");
                int userId = rs.getInt("UserID");
                int categoryId = rs.getInt("CategoryID");
                User user = new UserDAO().selectById(userId);
                Category category = new CategoryDAO().selectById(categoryId);

                course = new Course(courseId, user, category, courseImg, courseName, publish, duration, report, isDiscontinued, newVersionId, description);
                listCourse.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(SearchDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listCourse;
    }

    public ArrayList searchCharacters(String content_search) {
        ArrayList<Course> listCourse = new ArrayList<Course>();
        Course course = null;
        try {
            String sql = "select *from Course where Course.CourseName LIKE '%'+?+'%'";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, content_search);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int courseId = rs.getInt("CourseID");
                String courseImg = rs.getString("CourseImg");
                String courseName = rs.getString("CourseName");
                Date publish = rs.getDate("Publish");
                Double duration = rs.getDouble("Duration");
                String report = rs.getString("Report");
                Boolean isDiscontinued = rs.getBoolean("IsDiscontinued");
                int newVersionId = rs.getInt("newVersionId");
                String description = rs.getString("Description");
                /////
                int userId = rs.getInt("UserID");
                int categoryId = rs.getInt("CategoryID");
                User user = new UserDAO().selectById(userId);
                Category category = new CategoryDAO().selectById(categoryId);

                course = new Course(courseId, user, category, courseImg, courseName, publish, duration, report, isDiscontinued, newVersionId, description);
                listCourse.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(SearchDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listCourse;
    }

    public ArrayList searchOneCharacterFirst(String content_search) {
        ArrayList<Course> listCourse = new ArrayList<Course>();
        Course course = null;
        try {
            String sql = "select *from Course where Course.CourseName LIKE ?+'%'";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, content_search);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int courseId = rs.getInt("CourseID");
                String courseImg = rs.getString("CourseImg");
                String courseName = rs.getString("CourseName");
                Date publish = rs.getDate("Publish");
                Double duration = rs.getDouble("Duration");
                String report = rs.getString("Report");
                Boolean isDiscontinued = rs.getBoolean("IsDiscontinued");
                int newVersionId = rs.getInt("newVersionId");
                String description = rs.getString("Description");
                /////
                int userId = rs.getInt("UserID");
                int categoryId = rs.getInt("CategoryID");
                User user = new UserDAO().selectById(userId);
                Category category = new CategoryDAO().selectById(categoryId);

                course = new Course(courseId, user, category, courseImg, courseName, publish, duration, report, isDiscontinued, newVersionId, description);
                listCourse.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(SearchDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listCourse;
    }

    public static void main(String[] args) {
        SearchDAO dao = new SearchDAO();
        ArrayList<Course> listp = new ArrayList<Course>();
        listp = dao.searchOneCharacterFirst("HTML");
        SearchDAO dao2 = new SearchDAO();

        listp = dao2.searchTwoWord("HTML");
        for (Course product : listp) {
            System.out.println(product.toString());
        }
    }
}

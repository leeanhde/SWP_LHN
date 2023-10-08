/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.oracle.wls.shaded.org.apache.bcel.classfile.Code;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import model.Category;
import model.Course;
import model.Role;
import model.User;

/**
 *
 * @author ADMIN
 */
public class CourseDAO extends DBContext implements DAO {

    //      Course course = new Course();
//       
//        try {
//            String sql = "SELECT * FROM Course WHERE CourseID=?";
//            PreparedStatement st = connection.prepareStatement(sql);
    @Override
    public ArrayList selectAll() {
        ArrayList<Course> listCourse = new ArrayList<Course>();
        try {
            final String sql = "SELECT * FROM Course";
            PreparedStatement st = connection.prepareStatement(sql);
            final ResultSet rs = st.executeQuery();
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

                Course course = new Course(courseId, user, category, courseImg, courseName, publish, duration, report, isDiscontinued, newVersionId, description);
                listCourse.add(course);
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

    @Override
    public Course selectById(int id) {
        Course course = null;
        try {
            String sql = "SELECT * FROM Course WHERE CourseID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
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
        return course;
    }

    public static ArrayList popularCourses() {
        ArrayList<Course> listCourse = new ArrayList<Course>();
        try {
            final String sql = "SELECT TOP 5 E.CourseID, COUNT(E.CourseID) AS count, O.CategoryID, O.UserID,O.CategoryID, O.CourseImg, O.CourseName, O.Publish, O.Publish, O.Report, O.IsDiscontinued,O.newVersionId\n"
                    + "FROM Enroll AS E\n"
                    + "INNER JOIN Course AS O ON E.CourseID = O.CourseID\n"
                    + "GROUP BY E.CourseID, O.CategoryID, O.UserID,O.CategoryID, O.CourseImg, O.CourseName, O.Publish, O.Publish, O.Report, O.IsDiscontinued,O.newVersionId\n"
                    + "ORDER BY count DESC; ";
            PreparedStatement st = connection.prepareStatement(sql);
            final ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int courseId = rs.getInt("CourseID");
                String courseImg = rs.getString("CourseImg");
                String courseName = rs.getString("CourseName");
                Date publish = rs.getDate("Publish");
                Double duration = 0.;
                String report = rs.getString("Report");
                Boolean isDiscontinued = rs.getBoolean("IsDiscontinued");
                int newVersionId = rs.getInt("newVersionId");
                String description = null;
                /////
                int userId = rs.getInt("UserID");
                int categoryId = rs.getInt("CategoryID");
                User user = new UserDAO().selectById(userId);
                Category category = new CategoryDAO().selectById(categoryId);

                Course course = new Course(courseId, user, category, courseImg, courseName, publish, duration, report, isDiscontinued, newVersionId, description);
                listCourse.add(course);
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

    public ArrayList selectByCategoryID(int id) {
        ArrayList<Course> listCourse = new ArrayList<Course>();
        try {
            final String sql = "SELECT * FROM Course Where CategoryID =?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            final ResultSet rs = st.executeQuery();
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

                Course course = new Course(courseId, user, category, courseImg, courseName, publish, duration, report, isDiscontinued, newVersionId, description);
                listCourse.add(course);
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

    public ArrayList<Course> getCourse(int i) {
        ArrayList<Course> listCourse = new ArrayList<Course>();
        CourseDAO dao = new CourseDAO();
        listCourse = dao.selectByCategoryID(i);
        return listCourse;
    }

    public ArrayList selectByDuration(double a, double b) {
        ArrayList<Course> listCourse = new ArrayList<Course>();
        try {
            final String sql = "SELECT * FROM Course where Duration between ? AND ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setDouble(1, a);
            st.setDouble(2, b);
            final ResultSet rs = st.executeQuery();
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

                Course course = new Course(courseId, user, category, courseImg, courseName, publish, duration, report, isDiscontinued, newVersionId, description);
                listCourse.add(course);
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

    public ArrayList selectTop3Course() {
        ArrayList<Course> listCourse = new ArrayList<Course>();
        try {
            final String sql = "SELECT * FROM Course where CourseID in (select top 3 CourseID from Enroll GROUP BY CourseID)";
            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, numTop);
            final ResultSet rs = st.executeQuery();
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

                Course course = new Course(courseId, user, category, courseImg, courseName, publish, duration, report, isDiscontinued, newVersionId, description);
                listCourse.add(course);
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
        
        public static void main(String[] args) {
                    ArrayList<Course> listCourse = new ArrayList<Course>();
        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<Category> listCategory = new ArrayList<Category>();
        CourseDAO dao = new CourseDAO();
        listCategory = categoryDAO.selectAll();
        String[] catMsg = new String[20];
        
        catMsg[0] = "ON";
        catMsg[1] = null;
        catMsg[2] = null;
        catMsg[3] = null;
        catMsg[4] = null;
        String duration1 = "ON";
        String duration2 = null; 
        String duration3 = null; 
        String duration4 = null; 

        for (Category category : listCategory) {
            if (catMsg[category.getCategoryId()] != null) {
                dao = new CourseDAO();
                listCourse.removeAll(dao.selectByCategoryID(category.getCategoryId()));
                dao = new CourseDAO();
                listCourse.addAll(dao.selectByCategoryID(category.getCategoryId()));

            }
        }
           

        
         dao = new CourseDAO();
        
        
        if (duration1 != null) {
            dao = new CourseDAO();
            listCourse.removeAll(dao.selectByDuration(0, 2));
            dao = new CourseDAO();
            listCourse.addAll(dao.selectByDuration(0, 2));
        } else {
            listCourse.removeAll(dao.selectByDuration(0, 2));
        }
        dao = new CourseDAO();
        if (duration2 != null) {
            listCourse.removeAll(dao.selectByDuration(2.01, 5));
            dao = new CourseDAO();
            listCourse.addAll(dao.selectByDuration(2.01, 5));
        } else {
            listCourse.removeAll(dao.selectByDuration(2.01, 5));
        }
        dao = new CourseDAO();
        if (duration3 != null) {
            listCourse.removeAll(dao.selectByDuration(5.01, 8));
            dao = new CourseDAO();
            listCourse.addAll(dao.selectByDuration(5.01, 8));
        } else {
            listCourse.removeAll(dao.selectByDuration(5, 8));
        }
        dao = new CourseDAO();
        if (duration4 != null) {
            listCourse.removeAll(dao.selectByDuration(8.01, 999));
            dao = new CourseDAO();
            listCourse.addAll(dao.selectByDuration(8, 999));
        } else {
            listCourse.removeAll(dao.selectByDuration(8.01, 999));
        }
        Set <Course> listCourse1 = listCourse.stream().collect(Collectors.toCollection(() -> new TreeSet<>(Comparator.comparing(Course::getCourseId))));

        
        
    for (Course course : listCourse1) {
            System.out.println(course.toString());
        }
    }
//    public static void main(String[] args) {
//        ArrayList<Course> listCourse = new ArrayList<Course>();
//        ArrayList<Course> listCourse2 = new ArrayList<Course>();
//        listCourse = getCourse(0);
//        listCourse.addAll(getCourse(1));
////        listCourse2 = getCourse(1);
//        for (Course course : listCourse) {
//            System.out.println(course.toString());
//        }
////        System.out.println("---------");
////        for (Course course : listCourse2) {
////            System.out.println(course.toString());
////        }
//
////        System.out.println(listCourse.size());
//    }

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

    public ArrayList<Course> listTop4Course() {
        ArrayList<Course> listCourse = new ArrayList<>();
        try {
            final String sql = "SELECT TOP 4 * FROM Course"; // Updated query to select the top 4 courses.
            PreparedStatement st = connection.prepareStatement(sql);
            final ResultSet rs = st.executeQuery();
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

                Course course = new Course(courseId, user, category, courseImg, courseName, publish, duration, report, isDiscontinued, newVersionId, description);
                listCourse.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listCourse;
    }

    public List<Course> selectByUserID(int userID) {
        List<Course> courses = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Course WHERE UserID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
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
                int categoryId = rs.getInt("CategoryID");
                Category category = new CategoryDAO().selectById(categoryId);

                Course course = new Course(courseId, category, courseImg, courseName, publish, duration, report, true, newVersionId, description);
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    public int countTotalCourses() {
        int totalCount = 0;
        try {
            final String sql = "SELECT COUNT(*) as total FROM Course";
            PreparedStatement st = connection.prepareStatement(sql);
            final ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalCount = rs.getInt("total");
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
        return totalCount;
    }
}

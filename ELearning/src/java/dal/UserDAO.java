/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import static dal.DBContext.connection;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.Role;
import model.User;
import util.SendMail;
import util.Token;

/**
 *
 * @author ADMIN
 */
public class UserDAO extends DBContext implements DAO {

    public boolean checkEmailExixts(String email) {
        String sql = "select * from [User] where [User].Email like '" + email + "';";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return false;
            }
            return true;
        } catch (Exception e) {
        }
        return true;
    }

    public void changeStatus(String email) {
        String sql = "update [User] set [isVerify] = 1 where [User].Email like '" + email + "'";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
        } catch (Exception e) {
        }
    }

    public boolean RegisterUser(String fname, String lname, String email, String birthdate, String gender, String password, String Phone, String Address) {
        if (checkEmailExixts(email) == false) {
            return false;
        }
        String role = "0";
        String FullName = fname + " " + lname;
        String sql = "insert into [User] ([FullName], [DateOrBirth], [Email], [Password], [Phone], [Address], [Gender], [RoleID],[Avatar],\n"
                + "  [isVerify]) values\n"
                + "  ('" + FullName + "', '" + birthdate + "', '" + email + "', '" + password + "', '" + Phone + "', '" + Address + "', '" + gender + "', '" + role + "', 'https://as2.ftcdn.net/v2/jpg/03/49/49/79/1000_F_349497933_Ly4im8BDmHLaLzgyKg2f2yZOvJjBtlw5.jpg', 0)";
        System.out.println(sql);
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.executeUpdate();
            SendMail.sendMailRegister(email);
            return true;
        } catch (Exception e) {
        }
        return false;
    }

//    public User getUserBYEmailPass(String email, String Password) {
//        User user = null;
//        try {
//            String sql = "select * from [User]  where  [User].Email like '" + email + "' and [User].Password like '" + Password + "' and isVerify = 1;";
//            PreparedStatement st = connection.prepareStatement(sql);
//            final ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                int userId = rs.getInt("UserID");
//                String fullName = rs.getString("FullName");
//                Date dateOfBirh = rs.getDate("DateOrBirth");
//                String password = rs.getString("Password");
//                String phone = rs.getString("Phone");
//                String address = rs.getString("Address");
//                Boolean gender = rs.getBoolean("Gender");
//                String reason = rs.getString("Reason");
//                Date timeBan = rs.getDate("TimeBan");
//                String avatar = rs.getString("Avatar");
//                int roleId = rs.getInt("RoleID");
//                Role role = new RoleDAO().selectById(roleId);
//                user = new User(userId, fullName, dateOfBirh, email, password, phone, address, gender, role, reason, timeBan, avatar);
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                connection.close();
//            } catch (SQLException ex) {
//                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
//            }
//        }
//        return user;
//    }
    public User getUserBYEmail(String email) {
        User user = null;
        try {
            String sql = "select * from [User]  where  [User].Email like '" + email + "' and isVerify = 1;";
            PreparedStatement st = connection.prepareStatement(sql);
            final ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("UserID");
                String fullName = rs.getString("FullName");
                Date dateOfBirh = rs.getDate("DateOrBirth");
                String password = rs.getString("Password");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                Boolean gender = rs.getBoolean("Gender");
                String reason = rs.getString("Reason");
                Date timeBan = rs.getDate("TimeBan");
                String avatar = rs.getString("Avatar");
                int roleId = rs.getInt("RoleID");
                Role role = new RoleDAO().selectById(roleId);
                user = new User(userId, fullName, dateOfBirh, email, password, phone, address, gender, role, reason, timeBan, avatar);
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
        return user;
    }

    @Override
    public ArrayList selectAll() {
        ArrayList<User> listUser = new ArrayList<User>();
        try {
            String sql = "SELECT * FROM [User]";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("UserID");
                String fullName = rs.getString("FullName");
                Date dateOfBirh = rs.getDate("DateOrBirth");
                String email = rs.getString("Email");
                String password = rs.getString("Password");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                Boolean gender = rs.getBoolean("Gender");
                String reason = rs.getString("Reason");
                Date timeBan = rs.getDate("TimeBan");
                String avatar = rs.getString("Avatar");
                //  final TheLoai theLoai = new TheLoaiDAO().selectById(new TheLoai(matheloai, ""));
                int roleId = rs.getInt("RoleID");
                Role role = new RoleDAO().selectById(roleId);
                User user = new User(userId, fullName, dateOfBirh, email, password, phone, address, gender, role, reason, timeBan, avatar);
                listUser.add(user);
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
        return listUser;
    }

    @Override
    public User selectById(int id) {

        User user = null;
        try {
            String sql = "SELECT * FROM [User] WHERE UserID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            final ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("UserID");
                String fullName = rs.getString("FullName");
                Date dateOfBirh = rs.getDate("DateOrBirth");
                String email = rs.getString("Email");
                String password = rs.getString("Password");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                Boolean gender = rs.getBoolean("Gender");
                String reason = rs.getString("Reason");
                Date timeBan = rs.getDate("TimeBan");
                String avatar = rs.getString("Avatar");
                //  final TheLoai theLoai = new TheLoaiDAO().selectById(new TheLoai(matheloai, ""));
                int roleId = rs.getInt("RoleID");
                Role role = new RoleDAO().selectById(roleId);
                user = new User(userId, fullName, dateOfBirh, email, password, phone, address, gender, role, reason, timeBan, avatar);

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
        return user;
    }

    public boolean checkMailRegister(String email) {
        boolean check = false;

        try {
            final String sql = "SELECT * FROM [User] WHERE Email=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            final ResultSet rs = st.executeQuery();
            while (rs.next()) {
                check = true;
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
        return check;
    }

    public int updatePasswordByEmail(String email, String password) {
        int check = 0;

        try {
            final String sql = "UPDATE ELearning.dbo.[User]\n"
                    + "SET  Password=? \n"
                    + "WHERE Email=?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setString(2, email);
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

    public User getUserByEmail(String email) {

        User user = null;
        try {
            String sql = "SELECT * FROM [User] WHERE Email=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            final ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("UserID");
                String fullName = rs.getString("FullName");
                Date dateOfBirh = rs.getDate("DateOrBirth");
                String email2 = rs.getString("Email");
                String password = rs.getString("Password");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                Boolean gender = rs.getBoolean("Gender");
                String reason = rs.getString("Reason");
                Date timeBan = rs.getDate("TimeBan");
                String avatar = rs.getString("Avatar");
                //  final TheLoai theLoai = new TheLoaiDAO().selectById(new TheLoai(matheloai, ""));
                int roleId = rs.getInt("RoleID");
                Role role = new RoleDAO().selectById(roleId);
                user = new User(userId, fullName, dateOfBirh, email, password, phone, address, gender, role, reason, timeBan, avatar);

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
        return user;
    }

    public int insertUserByGoogle(String name, String email, String avatar) {
        int check = 0;

        try {
            final String sql = "INSERT INTO ELearning.dbo.[User]\n"
                    + "( FullName, Email, Gender, RoleID, Avatar,isVerify)\n"
                    + "VALUES( ?, ?, 0, 0, ?,1);";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, email);
            st.setString(3, avatar);
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

    public ArrayList getAllTeacher() {
        ArrayList<User> listUser = new ArrayList<User>();
        try {
            String sql = "SELECT * FROM [User] where RoleID=1";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int userId = rs.getInt("UserID");
                String fullName = rs.getString("FullName");
                Date dateOfBirh = rs.getDate("DateOrBirth");
                String email = rs.getString("Email");
                String password = rs.getString("Password");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                Boolean gender = rs.getBoolean("Gender");
                String reason = rs.getString("Reason");
                Date timeBan = rs.getDate("TimeBan");
                String avatar = rs.getString("Avatar");
                //  final TheLoai theLoai = new TheLoaiDAO().selectById(new TheLoai(matheloai, ""));
                int roleId = rs.getInt("RoleID");
                Role role = new RoleDAO().selectById(roleId);
                User user = new User(userId, fullName, dateOfBirh, email, password, phone, address, gender, role, reason, timeBan, avatar);
                listUser.add(user);
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
        return listUser;
    }

    public int setPasswordForGoogleAccount(int userId, String password) {
        int check = 0;
        try {
            final String sql = "UPDATE ELearning.dbo.[User]\n"
                    + "SET  Password=?\n"
                    + "WHERE UserID =?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, password);
            st.setInt(2, userId);
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

    public ArrayList<User> getTopTeachersWithMostCourses(int limit) {
        ArrayList<User> topTeachers = new ArrayList<>();
        String sql = "SELECT TOP (?) u.UserID, u.FullName, COUNT(c.CourseID) AS CourseCount "
                + "FROM [User] u "
                + "LEFT JOIN Course c ON u.UserID = c.UserID "
                + "WHERE u.RoleID = 1 "
                + "GROUP BY u.UserID, u.FullName "
                + "ORDER BY CourseCount DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, limit); // The number of top teachers you want to retrieve.
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int userId = rs.getInt("UserID");
                String fullName = rs.getString("FullName");
                int courseCount = rs.getInt("CourseCount");

                User teacher = new User();
                teacher.setUserId(userId);
                teacher.setFullName(fullName);
                teacher.setCourseCount(courseCount);

                topTeachers.add(teacher);
            }
            return topTeachers;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static LocalDate getCurrentDate() {
        return LocalDate.now();
    }

    public ArrayList<User> searchUser(String txtSearch) {
        ArrayList<User> listUser = new ArrayList<>();
        try {
            String sql = "     select * from [User] where FullName like ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int userId = rs.getInt("UserID");
                String fullName = rs.getString("FullName");
                Date dateOfBirh = rs.getDate("DateOrBirth");
                String email = rs.getString("Email");
                String password = rs.getString("Password");
                String phone = rs.getString("Phone");
                String address = rs.getString("Address");
                Boolean gender = rs.getBoolean("Gender");
                String reason = rs.getString("Reason");
                Date timeBan = rs.getDate("TimeBan");
                String avatar = rs.getString("Avatar");
                //  final TheLoai theLoai = new TheLoaiDAO().selectById(new TheLoai(matheloai, ""));
                int roleId = rs.getInt("RoleID");
                Role role = new RoleDAO().selectById(roleId);
                User user = new User(userId, fullName, dateOfBirh, email, password, phone, address, gender, role, reason, timeBan, avatar);
                listUser.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listUser;
    }

    public void updateRole(int userId, int roleId) {
        try {
            String sql = "UPDATE [User] SET [RoleID] = ? WHERE [UserID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleId);
            st.setInt(2, userId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void banUser(int userId, String reason, String timeBan) {
        try {
            String sql = "UPDATE [User] SET [Reason] = ?, [TimeBan] = ? WHERE [UserID] = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, reason);
            st.setString(2, timeBan); // Truyền chuỗi thời gian trực tiếp
            st.setInt(3, userId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        String userReason = "I eeeeeeeeeee";
        String dateString = "2025-09-14";
        int userID = 6;
        userDAO.banUser(userID, userReason, dateString);

    }
}

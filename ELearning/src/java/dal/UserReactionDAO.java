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
import model.Comment;
import model.User;
import model.UserReaction;

/**
 *
 * @author ADMIN
 */
public class UserReactionDAO extends DBContext {

    public ArrayList selectCommentIdReaction(int lessonId, int userId) {
        ArrayList<UserReaction> listUserReaction = new ArrayList<UserReaction>();
        try {
            String sql = "select u.CommentID, u.UserID,u.isLike,u.isDisLike from Comment as c inner join UserReaction as u\n"
                    + "on c.CommentID=u.CommentID\n"
                    + "where c.LessonID=? and u.UserID=? ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lessonId);
            st.setInt(2, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int commentId = rs.getInt("CommentID");
                Comment comment = new CommentDAO().selectById(commentId);
                User user = new UserDAO().selectById(userId);
                boolean isLike = rs.getBoolean("isLike");
                boolean isDisLike = rs.getBoolean("isDislike");
                UserReaction userR = new UserReaction(user, comment, isLike, isDisLike);
                listUserReaction.add(userR);
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
        return listUserReaction;
    }

    public int AddNewLikeUserReaction(int uuserId, int commentId) {
        try {
            String sql = "INSERT INTO ELearning.dbo.UserReaction\n"
                    + "(UserID, CommentID, isLike, isDisLike)\n"
                    + "VALUES(?, ?, 1, 0);";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uuserId);
            st.setInt(2, commentId);
            int rs = st.executeUpdate();
            return rs;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }

    public int AddLikeUserReaction(int uuserId, int commentId) {
        int rs = 0;
        try {
            String sql = "UPDATE ELearning.dbo.UserReaction\n"
                    + "SET isLike=1\n"
                    + "WHERE UserID=? AND CommentID=?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uuserId);
            st.setInt(2, commentId);
            rs = st.executeUpdate();
            return rs;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return rs;
    }

    public int SubLikeUserReaction(int uuserId, int commentId) {
        try {
            String sql = "UPDATE ELearning.dbo.UserReaction\n"
                    + "SET isLike=0\n"
                    + "WHERE UserID=? AND CommentID=?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uuserId);
            st.setInt(2, commentId);
            int rs = st.executeUpdate();
            return rs;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return 0;
    }

    public int AddNewDisLikeUserReaction(int uuserId, int commentId) {
        try {
            String sql = "INSERT INTO ELearning.dbo.UserReaction\n"
                    + "(UserID, CommentID, isLike, isDisLike)\n"
                    + "VALUES(?, ?, 0, 1);";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uuserId);
            st.setInt(2, commentId);
            int rs = st.executeUpdate();
            return rs;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return 0;
    }

    public int AddDisLikeUserReaction(int uuserId, int commentId) {
        try {
            String sql = "UPDATE ELearning.dbo.UserReaction\n"
                    + "SET isDisLike=1\n"
                    + "WHERE UserID=? AND CommentID=?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uuserId);
            st.setInt(2, commentId);
            int rs = st.executeUpdate();
            return rs;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }

    public int SubDisLikeUserReaction(int uuserId, int commentId) {
        try {
            String sql = "UPDATE ELearning.dbo.UserReaction\n"
                    + "SET isDisLike=0\n"
                    + "WHERE UserID=? AND CommentID=?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, uuserId);
            st.setInt(2, commentId);
            int rs = st.executeUpdate();
            return rs;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }

    public boolean checkUserReation(int userId, int commentId) {

        try {
            String sql = "Select * from UserReaction where UserID=? and CommentId=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.setInt(2, commentId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return true;
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
        return false;
    }

    public static void main(String[] args) {
        UserReactionDAO d = new UserReactionDAO();
        ArrayList<UserReaction> listCommentId = new ArrayList<UserReaction>();
        //listCommentId = d.selectCommentIdReaction(0, 0);
        int check = d.AddLikeUserReaction(0, 42);
        System.out.println(check);
//        for (UserReaction integer : listCommentId) {
//            System.out.println(integer);
//        }

    }
}

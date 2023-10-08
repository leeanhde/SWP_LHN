/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Comment;
import model.Lesson;
import model.User;
import model.UserReaction;

/**
 *
 * @author ADMIN
 */
public class CommentDAO extends DBContext implements DAO {

    public ArrayList selectCommentByLessonId(int lessonId) {
        ArrayList<Comment> listComment = new ArrayList<Comment>();
        Comment comment = null;
        try {
            String sql = "select * from Comment where LessonID=? ORDER BY CommentDate DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lessonId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                int commentId = rs.getInt("CommentID");
                Lesson lesson = new LessonDAO().selectById(lessonId);
                User user = new UserDAO().selectById(rs.getInt("UserID"));
                String content = rs.getString("Content");
                int like = rs.getInt("Like");
                int dislike = rs.getInt("Dislike");
                boolean isReply = rs.getBoolean("IsReply");
                String image = rs.getString("Image");
                boolean status = rs.getBoolean("Status");
                Timestamp commentDate = rs.getTimestamp("CommentDate");

                comment = new Comment(commentId, lesson, user, content, like, dislike, isReply, image, status, commentDate);

                listComment.add(comment);
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
        return listComment;
    }

    public int insertComment(int lessonId, int userId, String content, Timestamp commentDate) {
        try {
            String sql = "INSERT INTO ELearning.dbo.Comment\n"
                    + "( LessonID, UserID, Content, [Like], Dislike, IsReply, [Image], Status, CommentDate)\n"
                    + "VALUES(?, ?, ?, 0, 0, 0, '', 0, ?);";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lessonId);
            st.setInt(2, userId);
            st.setString(3, content);
            st.setTimestamp(4, commentDate);
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

    public int deleteCommentById(int CommentId) {
        try {
            String sql = "DELETE FROM ELearning.dbo.Comment\n"
                    + "WHERE CommentID=?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, CommentId);

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

    public int addLikeByCommentId(int commentid) {
        try {
            String sql = "UPDATE Comment\n"
                    + "SET [Like] = [Like] + 1\n"
                    + "WHERE CommentID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, commentid);

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

    public int subLikeByCommentId(int commentid) {
        try {
            String sql = "UPDATE Comment\n"
                    + "SET [Like] = [Like] - 1\n"
                    + "WHERE CommentID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, commentid);

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

    public int addDisLikeByCommentId(int commentid) {
        try {
            String sql = "UPDATE Comment\n"
                    + "SET [Dislike] = [Dislike] + 1\n"
                    + "WHERE CommentID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, commentid);

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

    public int subDisLikeByCommentId(int commentid) {
        try {
            String sql = "UPDATE Comment\n"
                    + "SET [Dislike] = [Dislike] - 1\n"
                    + "WHERE CommentID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, commentid);

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

    @Override
    public ArrayList selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Comment selectById(int id) {

        Comment comment = null;
        try {
            String sql = "SELECT * FROM Comment WHERE CommentID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            final ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int commentId = rs.getInt("CommentID");
                int lessonId = rs.getInt("LessonID");
                Lesson lesson = new LessonDAO().selectById(lessonId);
                int userId = rs.getInt("UserID");
                User user = new UserDAO().selectById(userId);
                String content = rs.getString("Content");
                int like = rs.getInt("Like");
                int dislike = rs.getInt("Dislike");
                boolean isReply = rs.getBoolean("IsReply");
                String image = rs.getString("Image");
                boolean status = rs.getBoolean("Status");
                Timestamp commentDate = rs.getTimestamp("CommentDate");

                comment = new Comment(commentId, lesson, user, content, like, dislike, isReply, image, status, commentDate);

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
        return comment;
    }

    public boolean checkIsReply(int lessonId) {
        try {
            String sql = "select * from Comment where LessonID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, lessonId);

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

    public int updateIsReply(int commentId) {
        try {
            String sql = "UPDATE ELearning.dbo.Comment\n"
                    + "SET  IsReply=1 \n"
                    + "WHERE CommentID=?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, commentId);

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

    public static void main(String[] args) {
        CommentDAO d = new CommentDAO();
        System.out.println(d.checkIsReply(20));

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

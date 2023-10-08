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
import model.Reply;
import model.User;

/**
 *
 * @author ADMIN
 */
public class ReplyDAO extends DBContext {

    public ArrayList selectAllReplyByCommentId(int commentId) {
        ArrayList<Reply> listReply = new ArrayList<Reply>();
        Reply reply = null;
        try {
            String sql = "SELECT * FROM Reply where CommentID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, commentId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                int replyId = rs.getInt("ReplyID");
                Comment comment = new CommentDAO().selectById(commentId);
                int userId = rs.getInt("UserID");
                User user = new UserDAO().selectById(userId);
                String content = rs.getString("Content");
                Timestamp dateReply = rs.getTimestamp("DateReply");
                String image = rs.getString("Image");
                Boolean status = rs.getBoolean("Status");
                int like = rs.getInt("Like");
                int disLike = rs.getInt("DisLike");

                reply = new Reply(replyId, comment, user, content, dateReply, image, status, like, disLike);

                listReply.add(reply);
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
        return listReply;
    }

    public int addNewReply(int commentId, int userId, String content, Timestamp commentDate) {
        try {
            String sql = "INSERT INTO ELearning.dbo.Reply\n"
                    + "( CommentID, UserID, Content, DateReply, [Image], Status, [Like], Dislike)\n"
                    + "VALUES( ?, ?, ?, ?,'', 0, 0, 0);";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, commentId);
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

    public static void main(String[] args) {
        ReplyDAO d = new ReplyDAO();
//        ArrayList<Reply> listReply = new ArrayList<Reply>();
//        listReply = d.selectAllReplyByCommentId(1);
//        for (Reply reply : listReply) {
//            System.out.println(reply.toString());
//        }
        long currentTimeMillis = System.currentTimeMillis();

// Convert it to a Timestamp
        Timestamp currentTimestamp = new Timestamp(currentTimeMillis);
        int check = new ReplyDAO().addNewReply(1, 2, "1+1=2", currentTimestamp);
        System.out.println(check);
    }

}

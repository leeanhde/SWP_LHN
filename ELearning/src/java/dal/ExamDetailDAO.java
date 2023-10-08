/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Exam;
import model.ExamDetail;
import model.User;

/**
 *
 * @author ADMIN
 */
public class ExamDetailDAO extends DBContext implements DAO {

    public ArrayList selectExamDetailByUserExamID(int userId, int examId) {
        ArrayList<ExamDetail> listExamDetail = new ArrayList<ExamDetail>();
        ExamDetail examDetail = null;
        try {
            String sql = "SELECT * FROM ExamDetail WHERE UserID=? and ExamID=? ORDER BY TimeEnd DESC";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.setInt(2, examId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int examDetailId = rs.getInt("ExamDetailID");
                User user = new UserDAO().selectById(userId);
                Exam exam = new ExamDAO().selectExamByExamId(examId);

                Timestamp dateStart = rs.getTimestamp("TimeStart");
                Timestamp dateEnd = rs.getTimestamp("TimeEnd");
                boolean Status = rs.getBoolean("Status");
                float score = rs.getFloat("Score");

                examDetail = new ExamDetail(examDetailId, user, exam, dateStart, dateEnd, Status, score);
                listExamDetail.add(examDetail);
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
        return listExamDetail;
    }

    public int insertExamDetail(int userId, int examId, Timestamp timeStart, Timestamp timeEnd, int status, float score) {
        try {
            String sql = "INSERT INTO ELearning.dbo.ExamDetail\n"
                    + "( UserID, ExamID, TimeStart, TimeEnd, Status, Score)\n"
                    + "VALUES(?, ?, ?, ?, ?, ?);";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            st.setInt(2, examId);
            st.setTimestamp(3, timeStart);
            st.setTimestamp(4, timeEnd);
            st.setInt(5, status);
            st.setFloat(6, score);
            int check = st.executeUpdate();
            return check;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(LessonDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }

    @Override
    public ArrayList selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ExamDetail selectById(int id) {

        ExamDetail examDetail = null;
        try {
            String sql = "SELECT * FROM ExamDetail WHERE ExamDetailID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int examDetailId = rs.getInt("ExamDetailID");
                int userId = rs.getInt("UserID");
                User user = new UserDAO().selectById(userId);
                int examId = rs.getInt("ExamID");
                Exam exam = new ExamDAO().selectById(examId);
                Timestamp timeStart = rs.getTimestamp("TimeStart");
                Timestamp timeEnd = rs.getTimestamp("TimeEnd");
                boolean status = rs.getBoolean("Status");
                float score = rs.getFloat("Score");
                examDetail = new ExamDetail(examDetailId, user, exam, timeStart, timeEnd, status, score);

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
        return examDetail;
    }

    public int selectMaxExamDetail() {
        int max = 0;
        try {
            String sql = "SELECT MAX(ExamDetailID) FROM ExamDetail;";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                max = rs.getInt("");
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
        return max;
    }

    public static void main(String[] args) {
//        ExamDetailDAO d = new ExamDetailDAO();
//        ArrayList<ExamDetail> listExamDetail = new ArrayList<ExamDetail>();
//
//        listExamDetail = d.selectExamDetailByUserExamID(0, 1);
//        for (ExamDetail examDetail : listExamDetail) {
//            System.out.println(examDetail.toString());
//        }
        ExamDetail e = new ExamDetail();
        ExamDetailDAO d = new ExamDetailDAO();
        int a = d.selectMaxExamDetail();
        System.out.println(a);
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

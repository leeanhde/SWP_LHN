/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.Mooc;

/**
 *
 * @author ADMIN
 */
public class MoocDAO extends DBContext implements DAO {

    public static ArrayList getMoocByCourseId(int CourseId) {
        ArrayList<Mooc> listMooc = new ArrayList<Mooc>();

        try {
             String sql = "SELECT MoocID, MoocNumber, MoocName FROM Mooc WHERE CourseID=? ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, CourseId);
             ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int moocId = rs.getInt("MoocID");
                int moocNumber = rs.getInt("MoocNumber");
                String moocName = rs.getString("MoocName");
                Mooc mooc = new Mooc(moocId, moocNumber, moocName);
                listMooc.add(mooc);
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
        return listMooc;
    }
    
    

    @Override
    public ArrayList selectAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Mooc selectById(int id) {
        
        Mooc mooc=null;
        try {
             String sql = "SELECT * from Mooc WHERE MoocID=? ";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
             ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int moocId = rs.getInt("MoocID");
                int moocNumber = rs.getInt("MoocNumber");
                String moocName = rs.getString("MoocName");
                Course course = new CourseDAO().selectById(rs.getInt("MoocID"));
                 mooc = new Mooc(moocId, moocNumber, moocName,course);
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
        return mooc;
        
    }
    
    public static void main(String[] args) {
        MoocDAO d = new MoocDAO();
                Mooc mooc=d.selectById(0);
                System.out.println(mooc);

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

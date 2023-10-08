/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

/**
 *
 * @author ADMIN
 */
public class CategoryDAO extends DBContext implements DAO {

    @Override
    public ArrayList selectAll() {
        ArrayList<Category> listCategory = new ArrayList<Category>();

        try {
             String sql = "SELECT * FROM Category";
            PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int roleId = rs.getInt("CategoryID");
                String roleName = rs.getString("CategoryName");
                Category category = new Category(roleId, roleName);
                listCategory.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return listCategory;

    }

    @Override
    public Category selectById(int id) {
        Category category = null;
        try {
             String sql = "SELECT * FROM Category WHERE CategoryID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            final ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int roleId = rs.getInt("CategoryID");
                String roleName = rs.getString("CategoryName");
                category = new Category(roleId, roleName);

            }
          //  DBContext.closeConnection(con);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return category;
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

   public ArrayList<Category> selectAllWithCourseCount() {
        ArrayList<Category> listCategory = new ArrayList<Category>();

        try {
            String sql = "SELECT Category.*, COUNT(Course.CourseID) AS CourseCount "
                    + "FROM Category "
                    + "LEFT JOIN Course ON Category.CategoryID = Course.CategoryID "
                    + "GROUP BY Category.CategoryID, Category.CategoryName";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                int categoryId = rs.getInt("CategoryID");
                String categoryName = rs.getString("CategoryName");
                int courseCount = rs.getInt("CourseCount");
                Category category = new Category(categoryId, categoryName, courseCount);
                listCategory.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listCategory;
    }
    


}

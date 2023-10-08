/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

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
import model.User;

/**
 *
 * @author ADMIN
 */
public class Test  extends DBContext{
    public static boolean selectById2(int id) {
        Course course = new Course();
       
        try {
            String sql = "SELECT * FROM Course WHERE CourseID=?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
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
                Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }
     public static void main(String[] args) {
    ArrayList<String> arrayList = new ArrayList<String>();
    arrayList.add("Element 1");
    arrayList.add("Element 2");
    arrayList.add("Element 3");
    arrayList.add("Element 4");
    arrayList.add("Element 5");
    arrayList.add("Element 6");
    arrayList.add("Element 7");

    for (int i = 0; i < Math.min(arrayList.size(), 6); i++) {
      System.out.println(arrayList.get(i));
    }
  }

//    public static void main(String[] args) {
//        boolean course= false;
//        Test t= new Test();
//        course=t.selectById2(2);
//        System.out.println(course);
//    }
}

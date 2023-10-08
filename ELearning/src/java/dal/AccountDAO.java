/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import java.sql.Connection;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ADMIN
 */
public class AccountDAO extends DBContext {

    public User getAccountById(int aid) {
        String sql = "SELECT *\n"
                + "  FROM [dbo].[User] where UserID = ?";
        User us = new User();

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, aid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                us.setUserId(aid);
                us.setFullName(rs.getString("Fullname"));
                us.setAddress(rs.getString("Address"));
                us.setGender(rs.getBoolean("Gender"));
                us.setEmail(rs.getString("Email"));
                us.setPhone(rs.getString("Phone"));
                us.setPassword(rs.getString("Password"));
                us.setAvatar(rs.getString("Avatar"));

            }

            return us;

        } catch (SQLException e) {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return null;
    }

    public static void main(String[] args) {
        AccountDAO adao = new AccountDAO();
        User us = new User();
        us = adao.getAccountById(0);
        System.out.println(us);
    }

    public int updateProfile(User us, String id) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [FullName] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[Phone] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[Gender] = ?\n"
                + " WHERE UserID =?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, us.getFullName());

            ps.setString(3, us.getPhone());
            ps.setString(2, us.getEmail());
            ps.setString(4, us.getAddress());
            ps.setBoolean(5, us.getGender());
            ps.setString(6, id);
            int checkUpdate = ps.executeUpdate();
            return checkUpdate;

        } catch (SQLException e) {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }

    public int changePassword(String newpass, int aid) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET \n"
                + "      [Password] = ?\n"
                + "      \n"
                + " WHERE UserID =?";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newpass);
            ps.setInt(2, aid);
            int checkUpdate = ps.executeUpdate();
            return checkUpdate;

        } catch (SQLException e) {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return 0;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.ImageDataModel;
import model.ImageModel;
import model.UserModel;

/**
 *
 * @author Vova
 */
public class UserDao extends BaseDao {

  public ImageDataModel getUserAvatar(int id) {
    try {
      ImageDataModel imageData = null;
      String sql = "SELECT \n"
              + "      [avatar]\n"
              + "      ,[contentType]\n"
              + "  FROM [dbo].[User]\n"
              + "  Where id = ? ";

      PreparedStatement ps = connection.prepareStatement(sql);
      ps.setInt(1, id);

      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        imageData = new ImageDataModel();

        byte[] varBinary = rs.getBytes("avatar");
        String contentType = rs.getString("contentType");

        imageData.setId(id);
        imageData.setImageByte(varBinary);
        imageData.setContentType(contentType);

      }

      return imageData;

    } catch (SQLException ex) {
      Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
    }

    return null;

  }

  public UserModel getUserInfo(int id) {
    try {
      UserModel user = new UserModel();
      String sql = "SELECT [id]\n"
              + "      ,[username]\n"
              + "      ,[fullname]\n"
              + "      ,[email]\n"
              + "  FROM [dbo].[User]\n"
              + "  Where id = ? ";

      PreparedStatement ps = connection.prepareStatement(sql);
      ps.setInt(1, id);

      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        user.setId(rs.getInt("id"));
        user.setUsername(rs.getString("username"));
        user.setFullname(rs.getString("fullname"));
        user.setEmail(rs.getString("email"));
      }

      return user;

    } catch (SQLException ex) {
      Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
    }

    return null;

  }

  public int countUserImage(int id) {

    try {
      String sql = "SELECT COUNT(id) AS numberOfImage FROM [Image] WHERE createdBy = ?;";

      PreparedStatement ps = connection.prepareStatement(sql);
      ps.setInt(1, id);

      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        return rs.getInt("numberOfImage");
      }
    } catch (SQLException ex) {
      Logger.getLogger(ImageDao.class.getName()).log(Level.SEVERE, null, ex);
    }
    return -1;

  }

  public void changeAvatar(int id, InputStream is, String contentType) {
    try {
      String sql = "UPDATE [dbo].[User]\n"
              + "   SET [avatar] = ?\n"
              + "      ,[contentType] = ?\n"
              + " WHERE id = ?";
      PreparedStatement ps = connection.prepareCall(sql);
      ps.setInt(3, id);
      ps.setBlob(1, is);
      ps.setString(2, contentType);
      ps.executeUpdate();
    } catch (SQLException ex) {
      Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
    }

  }

  public ArrayList<UserModel> searchUser(String query, int index) {
    try {
      ArrayList<UserModel> users = new ArrayList<>();
      String sql = "Select [id]\n"
              + "      ,[username]\n"
              + "      ,[fullname]\n"
              + "	from (select ROW_NUMBER() over (order by id DESC) as rn , \n"
              + "		 [id]\n"
              + "      ,[username]\n"
              + "      ,[fullname]\n"
              + "  FROM [dbo].[User]\n"
              + "  Where [username] like ? or fullname like ?\n"
              + "		)\n"
              + "		as x\n"
              + "		where rn between 5 * (?) + 1   \n"
              + "			and  5 * ?";

      PreparedStatement ps = connection.prepareStatement(sql);
      ps.setString(1, '%' + query + '%');
      ps.setString(2, '%' + query + '%');
      ps.setInt(3, index - 1);
      ps.setInt(4, index);

      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
        UserModel user = new UserModel();
        user.setId(rs.getInt("id"));
        user.setUsername(rs.getString("username"));
        user.setFullname(rs.getString("fullname"));
        users.add(user);
      }

      return users;

    } catch (SQLException ex) {
      Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
    }

    return null;
  }

  public int countResult(String query) {
    try {
      String sql = "SELECT Count(id) as TotalResult\n"
              + "  FROM [dbo].[User]\n"
              + "  Where [username] like ? or fullname like ?";
      PreparedStatement ps = connection.prepareStatement(sql);
      ps.setString(1, '%' + query + '%');
      ps.setString(2, '%' + query + '%');

      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
        return rs.getInt("TotalResult");
      }
    } catch (SQLException ex) {
      Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
    }
    return -1;
  }

  public String getPassword(String username, String email) {
    try {
      String sql = "SELECT [password]\n"
              + "  FROM [dbo].[User]\n"
              + "  Where username = ?\n"
              + "  And email = ?";
      PreparedStatement ps = connection.prepareStatement(sql);
      ps.setString(1, username);
      ps.setString(2, email);

      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
        return rs.getString("password");
      }
    } catch (SQLException ex) {
      Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
    }
    return "";
  }

  public boolean checkPassword(int id, String password) {

    try {
      String sql = "SELECT [password]\n"
              + "  FROM [dbo].[User]\n"
              + "  Where id = ?\n";
      PreparedStatement ps = connection.prepareStatement(sql);
      ps.setInt(1, id);
      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
        return password.equals(rs.getString("password"));
      }
    } catch (SQLException ex) {
      Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
    }

    return false;
  }

  public boolean editEmail(int id, String password, String email) {

    try {
      String sql = "UPDATE [dbo].[User]\n"
              + "   SET [email] = ?\n"
              + " WHERE id = ? and password = ?";

      PreparedStatement ps = connection.prepareCall(sql);
      ps.setString(1, email);
      ps.setInt(2, id);
      ps.setString(3, password);
      ps.executeUpdate();
      return true;
    } catch (SQLException ex) {
      Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
      return false;
    }
  }
  
   public boolean editPassword(int id, String passwordl) {

    try {
      String sql = "UPDATE [dbo].[User]\n"
              + "   SET [password] = ?\n"
              + " WHERE id = ?";

      PreparedStatement ps = connection.prepareCall(sql);
      ps.setString(1, passwordl);
      ps.setInt(2, id);
      ps.executeUpdate();
      return true;
    } catch (SQLException ex) {
      Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
      return false;
    }
  }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AuthModel;
import model.UserModel;

/**
 *
 * @author Vova
 */
public class AuthDao extends BaseDao {

  public AuthModel login(String username, String password) {

    try {

      AuthModel authModel = null;

      String sql = "SELECT [id]\n"
              + "      ,[username]\n"
              + "  FROM [dbo].[User]\n"
              + "  WHERE username = ? And [password] = ?";

      PreparedStatement ps = connection.prepareStatement(sql);

      ps.setString(1, username);
      ps.setString(2, password);

      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        authModel = new AuthModel();
        authModel.setUsername(rs.getString("username"));
        authModel.setId(rs.getInt("id"));
      }

      return authModel;

    } catch (SQLException ex) {
      Logger.getLogger(AuthDao.class.getName()).log(Level.SEVERE, null, ex);
    }

    return null;
  }

  public boolean signUp(String username, String fullname, String password) {

    try {

      String sql = "INSERT INTO [dbo].[User]\n"
              + "           ([username]\n"
              + "           ,[password]\n"
              + "           ,[fullname])\n"
              + "     VALUES\n"
              + "           (? , ? , ?)";

      PreparedStatement ps = connection.prepareCall(sql);

      ps.setString(1, username);
      ps.setString(2, password);
      ps.setString(3, fullname);

      ps.executeUpdate();

      return true;
    } catch (SQLException ex) {
      Logger.getLogger(AuthDao.class.getName()).log(Level.SEVERE, null, ex);
    }
    return false;
  }

}

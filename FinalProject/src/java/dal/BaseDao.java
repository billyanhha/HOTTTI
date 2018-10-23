/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vova
 */
public abstract class BaseDao {

  protected Connection connection;

  public BaseDao() {
    try {
      String user = "sa";
      String pass = "123456";
      String url = "jdbc:sqlserver://localhost:1433;databaseName=Project";
      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
      connection = DriverManager.getConnection(url, user, pass);
    } catch (ClassNotFoundException | SQLException ex) {
      Logger.getLogger(BaseDao.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

}

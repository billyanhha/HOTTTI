/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AuthModel;
import model.ImageDataModel;
import model.ImageModel;

/**
 *
 * @author Vova
 */
public class ImageDao extends BaseDao {

  public ImageDataModel getImageData(int id) {
    try {
      ImageDataModel imageData = null;
      String sql = "SELECT"
              + "      [data]\n"
              + "      ,[contentType]\n"
              + "  FROM [dbo].[Image]\n"
              + "  Where id = ? ";

      PreparedStatement ps = connection.prepareStatement(sql);
      ps.setInt(1, id);

      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        imageData = new ImageDataModel();

        byte[] varBinary = rs.getBytes("data");
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

  public ArrayList<ImageModel> pagging(int pageIndex, int pageSize) {
    try {
      ArrayList<ImageModel> images = new ArrayList<>();
      String sql = "Select id,createdAt , title, createdBy ,username\n"
              + "	from (select ROW_NUMBER() over (order by [Image].id DESC) as rn , \n"
              + "		[Image].id,createdAt , title, createdBy , [User].username as username\n"
              + "        from [Image] , [User]\n"
              + "		where [User].id = createdBy\n"
              + "		)\n"
              + "		as x\n"
              + "where rn between ? * (?-1) + 1  \n"
              + "and  ? * ? \n";

      PreparedStatement statement = connection.prepareStatement(sql);
      statement.setInt(1, pageSize);
      statement.setInt(2, pageIndex);
      statement.setInt(3, pageSize);
      statement.setInt(4, pageIndex);
      ResultSet rs = statement.executeQuery();
      while (rs.next()) {
        ImageModel image = new ImageModel();
        image.setId(rs.getInt("id"));
        image.setTitle(rs.getString("title"));
        image.setCreatedAt(rs.getDate("createdAt"));
        int createdBy = (rs.getInt("createdBy"));
        String username = rs.getString("username");

        AuthModel auth = new AuthModel();
        auth.setId(createdBy);
        auth.setUsername(username);

        image.setCreatedBy(auth);

        images.add(image);
      }
      return images;
    } catch (SQLException ex) {
      Logger.getLogger(ImageDao.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
  }

  public int countImage() {

    try {
      String sql = "SELECT COUNT(id) AS numberOfImage FROM [Image];";

      PreparedStatement ps = connection.prepareStatement(sql);

      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        return rs.getInt("numberOfImage");
      }
    } catch (SQLException ex) {
      Logger.getLogger(ImageDao.class.getName()).log(Level.SEVERE, null, ex);
    }
    return -1;

  }

}

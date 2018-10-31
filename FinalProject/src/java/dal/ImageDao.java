/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.io.InputStream;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AuthModel;
import model.CommentModel;
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

  public ArrayList<ImageModel> pagging(int pageIndex, int pageSize, int uid) {
    try {
      ArrayList<ImageModel> images = new ArrayList<>();
      String sql = "Select id , title, createdBy ,username\n"
              + "	from (select ROW_NUMBER() over (order by [Image].id DESC) as rn , \n"
              + "		[Image].id , title, createdBy , [User].username as username\n"
              + "        from [Image] , [User]\n"
              + "		where [User].id = createdBy\n";

      // if have uid
      if (uid != -1) {
        sql += "And [User].id = ? \n";
      }

      sql += ")\n"
              + "		as x\n"
              + "where rn between ? * (?-1) + 1  \n"
              + "and  ? * ? \n";

      PreparedStatement statement = connection.prepareStatement(sql);
      if (uid != -1) {
        statement.setInt(1, uid);
        statement.setInt(2, pageSize);
        statement.setInt(3, pageIndex);
        statement.setInt(4, pageSize);
        statement.setInt(5, pageIndex);
      } else {
        statement.setInt(1, pageSize);
        statement.setInt(2, pageIndex);
        statement.setInt(3, pageSize);
        statement.setInt(4, pageIndex);
      }
      ResultSet rs = statement.executeQuery();
      while (rs.next()) {
        ImageModel image = new ImageModel();
        image.setId(rs.getInt("id"));
        image.setTitle(rs.getString("title"));
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

  public int countComment(int id) {

    try {
      String sql = "SELECT COUNT(id) AS commentNumb FROM Comment Where imageId = ?";

      PreparedStatement ps = connection.prepareStatement(sql);
      ps.setInt(1, id);
      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        return rs.getInt("commentNumb");
      }
    } catch (SQLException ex) {
      Logger.getLogger(ImageDao.class.getName()).log(Level.SEVERE, null, ex);
    }
    return -1;

  }

  public ImageModel getImageById(int id) {

    try {
      ImageModel image = null;
      String sql = "SELECT [Image].[id]\n"
              + "      ,[createdAt]\n"
              + "      ,[title]\n"
              + "      ,[createdBy]\n"
              + "	  , [User].username\n"
              + "  FROM [dbo].[Image] , [User]\n"
              + "  Where [Image].id = ? And createdBy = [User].id";

      PreparedStatement ps = connection.prepareStatement(sql);

      ps.setInt(1, id);

      ResultSet rs = ps.executeQuery();

      while (rs.next()) {

        image = new ImageModel();
        image.setId(rs.getInt("id"));
        image.setCreatedAt(rs.getDate("createdAt"));
        image.setTitle(rs.getString("title"));

        int createdBy = (rs.getInt("createdBy"));
        String username = rs.getString("username");

        AuthModel auth = new AuthModel();
        auth.setId(createdBy);
        auth.setUsername(username);

        image.setCreatedBy(auth);

      }

      return image;

    } catch (SQLException ex) {
      Logger.getLogger(ImageDao.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;

  }

  public ArrayList<CommentModel> getComment(int id, int index, int pageSize) {
    try {
      ArrayList<CommentModel> commentModels = new ArrayList<>();
      String sql = "Select id , uid , username , content\n"
              + "	from (select ROW_NUMBER() over (order by Comment.id DESC) as rn , \n"
              + "		Comment.id , Comment.createdBy as uid , username , content\n"
              + "        from Comment , [User] \n"
              + "		where Comment.imageId = ?\n"
              + "		And Comment.createdBy = [User].id\n"
              + "		)\n"
              + "		as x\n"
              + "		where rn between ? * (? - 1) + 1   \n"
              + "			and  ? * (? )";

      PreparedStatement ps = connection.prepareStatement(sql);

      ps.setInt(1, id);
      ps.setInt(2, pageSize);
      ps.setInt(3, index);
      ps.setInt(4, pageSize);
      ps.setInt(5, index);

      ResultSet rs = ps.executeQuery();
      while (rs.next()) {
        CommentModel cmd = new CommentModel();
        AuthModel au = new AuthModel();
        au.setId(rs.getInt("uid"));
        au.setUsername(rs.getString("username"));
        cmd.setId(rs.getInt("id"));
        cmd.setCreatedBy(au);
        cmd.setContent(rs.getString("content"));

        commentModels.add(cmd);
      }

      return commentModels;

    } catch (SQLException ex) {
      Logger.getLogger(ImageDao.class.getName()).log(Level.SEVERE, null, ex);
    }

    return null;

  }

  public int addImage(String title, Date createdAt, int createdBy, InputStream is, String contentType) {
    try {
      String sql = "INSERT INTO [dbo].[Image]\n"
              + "           ([data]\n"
              + "           ,[contentType]\n"
              + "           ,[createdAt]\n"
              + "           ,[title]\n"
              + "           ,[createdBy])\n"
              + "	 OUTPUT Inserted.ID\n"
              + "     VALUES\n"
              + "           (? , ? , ? , ? , ?)";

      PreparedStatement ps = connection.prepareCall(sql);

      ps.setBlob(1, is);
      ps.setString(2, contentType);
      ps.setDate(3, createdAt);
      ps.setString(4, title);
      ps.setInt(5, createdBy);

      ResultSet rs = ps.executeQuery();

      while (rs.next()) {
        return rs.getInt("ID");
      }

    } catch (SQLException ex) {
      Logger.getLogger(ImageDao.class.getName()).log(Level.SEVERE, null, ex);
    }
    return -1;
  }

  public void postComment(int imageId, int uid, String content) {
    try {
      String sql = "INSERT INTO [dbo].[Comment]\n"
              + "           ([imageId]\n"
              + "           ,[createdBy]\n"
              + "           ,[content])\n"
              + "     VALUES\n"
              + "           (? , ? ,?)";
      PreparedStatement ps = connection.prepareCall(sql);
      ps.setInt(1, imageId);
      ps.setInt(2, uid);
      ps.setString(3, content);
      ps.executeUpdate();
    } catch (SQLException ex) {
      Logger.getLogger(ImageDao.class.getName()).log(Level.SEVERE, null, ex);
    }

  }

  public void deleteImage(int id) {
    try {
      String sql1 = "DELETE FROM [dbo].[Comment]\n"
              + "Where imageId = ? ";
      PreparedStatement ps1 = connection.prepareStatement(sql1);
      ps1.setInt(1, id);
      ps1.executeUpdate();

      String sql = "DELETE FROM [dbo].[Image]\n"
              + "Where id = ? ";

      PreparedStatement ps = connection.prepareStatement(sql);
      ps.setInt(1, id);
      ps.executeUpdate();

    } catch (SQLException ex) {
      Logger.getLogger(ImageDao.class.getName()).log(Level.SEVERE, null, ex);
    }

  }

  public void editPost(int id, String title, InputStream is, String contentType) {

    try {
      HashMap<Integer, Object[]> hashMap = new HashMap<>();
      String sql = "UPDATE [dbo].[Image]\n";
      int index = 1;
      if (!title.equals("-1")) {
        sql += "Set title = ?\n";
        Object[] value = {"title", title};
        hashMap.put(index++, value);
      }

      if (is != null) {
        if (index == 1) {
          sql += "Set data = ?\n";
        } else {
          sql += ", data = ?\n";
        }
        Object[] value = {"is", is};
        hashMap.put(index++, value);
        Object[] value2 = {"contentType", contentType};
        hashMap.put(index++, value2);
        sql += ", contentType = ?\n";
      }

      sql += "Where id = ?";
      System.out.println(sql);
      PreparedStatement ps = connection.prepareCall(sql);
      int psDex = 1;
      for (Map.Entry<Integer, Object[]> entry : hashMap.entrySet()) {
        Integer key = entry.getKey();
        Object[] value = entry.getValue();

        if (value[0].equals("title")) {
          ps.setString(key, title);
        }

        if (value[0].equals("is")) {
          ps.setBlob(key, is);
        }

        if (value[0].equals("contentType")) {
          ps.setString(key, contentType);
        }
        psDex++;
      }
      ps.setInt(psDex, id);

      ps.executeUpdate();

    } catch (SQLException ex) {
      Logger.getLogger(ImageDao.class.getName()).log(Level.SEVERE, null, ex);
    }

  }

  public void deleteComment(int id) {
    try {
      String sql = "DELETE FROM [dbo].[Comment]\n"
              + "      WHERE id = ?";
      PreparedStatement ps = connection.prepareCall(sql);
      ps.setInt(1, id);
      ps.executeUpdate();
    } catch (SQLException ex) {
      Logger.getLogger(ImageDao.class.getName()).log(Level.SEVERE, null, ex);
    }
  }

}

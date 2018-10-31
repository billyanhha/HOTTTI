/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.component;

import controller.BaseController;
import dal.UserDao;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.ImageDataModel;

/**
 *
 * @author Vova
 */
@MultipartConfig
public class AvatarImage extends BaseController {


  @Override
  protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String fix = req.getParameter("id");
    int uid = Integer.parseInt(fix);
    UserDao ud = new UserDao();
    ImageDataModel imageData = new ImageDataModel();
    imageData = ud.getUserAvatar(uid);
    resp.setContentType(imageData.getContentType());
    ServletOutputStream out = resp.getOutputStream();
    out.write(imageData.getImageByte());
    out.flush();
    out.close();
  }

  @Override
  protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String fix = req.getParameter("id");
    int uid = Integer.parseInt(fix);
    UserDao ud = new UserDao();
    Part filePart = req.getPart("avatar");
    if (filePart.getSize() == 0) {
      resp.sendRedirect("home");
    } else {
      InputStream fileContent = filePart.getInputStream();
      ud.changeAvatar(uid, fileContent, filePart.getContentType());
      resp.sendRedirect("profile?id=" + uid);
    }
  }

}

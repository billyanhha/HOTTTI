/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.image;

import controller.BaseController;
import dal.UserDao;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ImageDataModel;

/**
 *
 * @author Vova
 */
public class AvatarImage extends BaseController {

  @Override
  protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    String sid = req.getParameter("id");

    UserDao ud = new UserDao();

    ImageDataModel imageData = new ImageDataModel();

    imageData = ud.getUserAvatar(Integer.parseInt(sid));

    resp.setContentType(imageData.getContentType());
    
    ServletOutputStream out = resp.getOutputStream();

    out.write(imageData.getImageByte());

    out.flush();
    out.close();

  }

  @Override
  protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  }

}

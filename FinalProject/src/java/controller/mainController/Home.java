/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.mainController;

import controller.BaseController;
import dal.ImageDao;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.AuthModel;
import model.ImageDataModel;
import model.ImageModel;

/**
 *
 * @author Vova
 */
@MultipartConfig
public class Home extends BaseController {

  AuthModel user = null;

  @Override
  protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    user = (AuthModel) req.getSession().getAttribute("user");
    req.setAttribute("user", user);

    ImageDao id = new ImageDao();
    int numberOfImage = id.countImage();
    req.setAttribute("numberOfImage", numberOfImage);

    req.getRequestDispatcher("screens/home.jsp").forward(req, resp);

  }

  @Override
  protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    Part filePart = req.getPart("file"); // Retrieves <input type="file" name="file">
    if (filePart.getSize() == 0) {
      resp.sendRedirect("home");
    } else {
      ImageDao imd = new ImageDao();

      int createdBy = user.getId();
      java.sql.Date createdAt = new java.sql.Date(new java.util.Date().getTime());
      String title = req.getParameter("title");
      ImageDataModel idm = new ImageDataModel();

      InputStream fileContent = filePart.getInputStream();

      int id = imd.addImage(title, createdAt, createdBy, fileContent, filePart.getContentType());

      resp.sendRedirect("imageDetail?id=" + id);
    }
  }

}

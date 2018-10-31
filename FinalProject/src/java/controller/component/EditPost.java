/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.component;

import controller.BaseController;
import dal.ImageDao;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
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
public class EditPost extends BaseController {

  @Override
  protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  }

  @Override
  protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    Part filePart = req.getPart("file"); // Retrieves <input type="file" name="file">

    ImageDao imd = new ImageDao();

    int id = Integer.parseInt(req.getParameter("id"));
    String title = req.getParameter("title");

    ImageDataModel idm = new ImageDataModel();

    InputStream fileContent = filePart.getSize() == 0 ? null : filePart.getInputStream();
    
    String contentType = filePart.getContentType();

    imd.editPost(id, title, fileContent, contentType);

    resp.sendRedirect("imageDetail?id=" + id);
  }

}

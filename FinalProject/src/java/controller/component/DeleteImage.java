/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.component;

import controller.BaseController;
import dal.ImageDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vova
 */
public class DeleteImage extends BaseController{

  @Override
  protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  }

  @Override
  protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    
    ImageDao imd = new ImageDao();
    imd.deleteImage(Integer.parseInt(req.getParameter(("id"))));
    resp.sendRedirect("home");
    
  }

  
  
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.mainController;

import controller.BaseController;
import dal.ImageDao;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AuthModel;
import model.CommentModel;
import model.ImageModel;

/**
 *
 * @author Vova
 */
public class ImageDetail extends BaseController {

  int id = 0;

  @Override
  protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    int index = 1;
    ImageDao imageDao = new ImageDao();
    id = Integer.parseInt(req.getParameter("id"));
    ImageModel image = imageDao.getImageById(id);
    req.setAttribute("image", image);
    int commentNum = imageDao.countComment(id);
    req.setAttribute("commentNum", commentNum);
    req.getRequestDispatcher("screens/imageDetail.jsp").forward(req, resp);
  }

  @Override
  protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  }

}

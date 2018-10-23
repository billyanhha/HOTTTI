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
import model.ImageModel;

/**
 *
 * @author Vova
 */
public class PagingImage extends BaseController {


  @Override
  protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    int pageIndex = Integer.parseInt(req.getParameter("pageIndex"));
    int pageSize = Integer.parseInt(req.getParameter("pageSize"));
    ImageDao imageDao = new ImageDao();

    ArrayList<ImageModel> imageModels = imageDao.pagging(pageIndex, pageSize);
    if (imageModels.size() < pageSize) {
      req.setAttribute("error", "Out of image");
    }

    req.setAttribute("imageModels", imageModels);

    req.getRequestDispatcher("components/bodyImage.jsp").forward(req, resp);
  }

  @Override
  protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  }

}

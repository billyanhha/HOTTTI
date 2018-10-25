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
import model.CommentModel;

/**
 *
 * @author Vova
 */
public class CommentController extends BaseController {

  private final int pageSize = 3;

  @Override
  protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    ImageDao imageDao = new ImageDao();
    int id = Integer.parseInt(req.getParameter("id"));
    int index = Integer.parseInt(req.getParameter("index"));
    ArrayList<CommentModel> comments = imageDao.getComment(id, index, pageSize);
    if (comments.size() < pageSize) {
      req.setAttribute("error", "No comment left");
    }
    req.setAttribute("comments", comments);
    req.getRequestDispatcher("components/comment.jsp").forward(req, resp);
  }

  @Override
  protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  }

}

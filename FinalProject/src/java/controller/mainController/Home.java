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
import model.ImageModel;

/**
 *
 * @author Vova
 */
public class Home extends BaseController {

  @Override
  protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    AuthModel user = (AuthModel) req.getSession().getAttribute("user");
    req.setAttribute("user", user);

    ImageDao id = new ImageDao();
    int numberOfImage = id.countImage();
    req.setAttribute("numberOfImage", numberOfImage);

    req.getRequestDispatcher("screens/home.jsp").forward(req, resp);

  }

  @Override
  protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

  }

}

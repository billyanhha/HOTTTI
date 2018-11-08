/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.mainController;

import controller.BaseController;
import dal.UserDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vova
 */
public class ChangeEmail extends BaseController {

  @Override
  protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.getRequestDispatcher("screens/changeEmail.jsp").forward(req, resp);
  }

  @Override
  protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    UserDao userDao = new UserDao();
    int id = Integer.parseInt(req.getParameter("uid"));
    String email = req.getParameter("email");
    String password = req.getParameter("password");

    if (!userDao.checkPassword(id, password)) {
      resp.sendError(403, "Wrong password");
    } else {
      Boolean editable = userDao.editEmail(id, password, email);
      if (!editable) {
        resp.sendError(403, "Can't change to this email");
      }
    }

  }

}

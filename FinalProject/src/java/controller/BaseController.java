/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import controller.mainController.ImageDetail;
import controller.mainController.Profile;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AuthModel;

/**
 *
 * @author Vova
 */
public abstract class BaseController extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    if (!isAuthenticate(req)) {
      resp.sendRedirect("login");
    } else {
      processPost(req, resp);
    }
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    if (!isAuthenticate(req)) {
      resp.sendRedirect("login");
    } else {
      processGet(req, resp);
    }
  }

  boolean isAuthenticate(HttpServletRequest req) {
    Cookie[] cookies = null;
    cookies = req.getCookies();
    AuthModel user = (AuthModel) req.getSession().getAttribute("user");

    if (cookies == null && user == null) {
      
      return false;
      
    } else if (cookies != null && user == null) {
      
      for (Cookie cooky : cookies) {

        if (cooky.getName().equals("user")) {
          String[] userArr = cooky.getValue().split(" ");
          user = new AuthModel();
          user.setId(Integer.parseInt(userArr[0]));
          user.setUsername(userArr[1]);
          req.getSession().setAttribute("user", user);

          return true;
        }
      }
      return false;
    } 
 
    return true;
  }

  protected abstract void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

  protected abstract void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

}

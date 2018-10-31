/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.authController;

import dal.AuthDao;
import java.io.IOException;
import java.io.PrintWriter;
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
public class Authentication extends HttpServlet {

  private final int maxAge = 60 * 60 * 24 * 30;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    request.getRequestDispatcher("screens/login.jsp").forward(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    Boolean rmb = Boolean.parseBoolean(request.getParameter("remember"));

    AuthDao ad = new AuthDao();

    AuthModel am = ad.login(username, password);

    if (am == null) {
      response.sendError(404, "Wrong username or password");
      return;
    }

    request.getSession().setAttribute("user", am);
    request.getSession().setMaxInactiveInterval(1000*60*60*12);

    
    if (rmb == true) {
      Cookie cookie = new Cookie("user", am.getId() + " " + username);
      cookie.setMaxAge(maxAge);
      response.addCookie(cookie);
    }
    
  }

  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.mainController;

import controller.BaseController;
import dal.UserDao;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UserModel;

/**
 *
 * @author Vova
 */
public class Search extends BaseController {

  @Override
  protected void processGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    if (req.getParameter("query") == null || req.getParameter("query").isEmpty()) {
      return;
    } else {
      String query = req.getParameter("query");
      UserDao ud = new UserDao();
      String page_raw = req.getParameter("page");
      page_raw = (page_raw == null) ? "1" : page_raw;
      int pageIndex = Integer.parseInt(page_raw);
      int pageSize = 5;
      int rowCount = ud.countResult(query);
      int maxPage = rowCount / pageSize + (rowCount % pageSize != 0 ? 1 : 0);
      ArrayList<UserModel> resultSearch = ud.searchUser(query, pageIndex);
      System.out.println(resultSearch.size());
      req.setAttribute("resultSearch", resultSearch);
      req.setAttribute("pageIndex", pageIndex);
      req.setAttribute("maxPage", maxPage);
      req.setAttribute("rowCount", rowCount);
      req.getRequestDispatcher("screens/search.jsp").forward(req, resp);
    }
  }

  @Override
  protected void processPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
  }

}

package kr.ac.jbnu.se.advweb.product.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.jbnu.se.advweb.product.model.MyPost;
import kr.ac.jbnu.se.advweb.product.model.Post;
import kr.ac.jbnu.se.advweb.product.model.UserAccount;
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

/**
 * Servlet implementation class PostTextServlet
 */
/**
 * @author tinyg
 *
 */
@WebServlet(urlPatterns = { "/postmytable" })
public class PostMyTable extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostMyTable() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
      
      Connection conn = MyUtils.getStoredConnection(request);
      
      String errorString = null;
        List<MyPost> list = null;
        
        try {
           // 여기 queryPost를 변경.
            list = DBUtils.queryScrapPost(conn);
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
      
        request.setAttribute("errorString", errorString);
        request.setAttribute("postList", list);
      
      RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/postMyTableView.jsp");
      dispatcher.forward(request, response);
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
      // TODO Auto-generated method stub
            Connection conn = (Connection) MyUtils.getStoredConnection(request);
            // checkbox value 받아져야 함!!!!!!.
            
            String ErrorString = null;
            boolean hasError = false;
            List<MyPost> list = null;
            
            try {
                  list = DBUtils.queryScrapPost(conn);
              } catch (SQLException e) {
                  e.printStackTrace();
                  ErrorString = e.getMessage();
              }

            String postNumStr = (String) request.getParameter("postNum");
            System.out.println(postNumStr);
            //int 형변환
            int postNum = Integer.parseInt(postNumStr);
            
            HttpSession session = request.getSession(true);
            UserAccount useraccount = MyUtils.getLoginedUser(session);
            String username = useraccount.getUserName();
            
            //=================================
            MyPost mypost;
            try {
               mypost = DBUtils.getMyPost(conn, postNum);
               mypost.setpostScrapperId(username);
               DBUtils.insertScrapPost(conn, mypost);
            } catch (SQLException e) {
               // TODO Auto-generated catch block
               e.printStackTrace();
               hasError = true;
            }
            
            
            if(hasError) {
               
               request.setAttribute("postList", list);
               
               request.setAttribute("errorString", ErrorString);
//               response.sendRedirect(request.getContextPath() + "/postmain");
               
               RequestDispatcher dispatcher //
                  = this.getServletContext().getRequestDispatcher("/WEB-INF/views/postMyTableView.jsp");

               dispatcher.forward(request, response);
            }else {
               
               request.setAttribute("postList", list);

               RequestDispatcher dispatcher //
                  = this.getServletContext().getRequestDispatcher("/WEB-INF/views/postMyTableView.jsp");

               dispatcher.forward(request, response);
            }
            
         }
            
   }
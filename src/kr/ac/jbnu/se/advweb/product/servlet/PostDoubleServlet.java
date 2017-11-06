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

import kr.ac.jbnu.se.advweb.product.model.MyPost;
import kr.ac.jbnu.se.advweb.product.model.Post;
import kr.ac.jbnu.se.advweb.product.model.Product;
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

/**
 * Servlet implementation class PostTextServlet
 */
/**
 * @author tinyg
 *
 */
@WebServlet(urlPatterns = { "/postDouble" })
public class PostDoubleServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostDoubleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
      
      Connection conn = MyUtils.getStoredConnection(request);
      String postNumStr = (String) request.getParameter("postNum");
      //int 형변환
      int postNum = Integer.parseInt(postNumStr);
        MyPost postboard = null;
        String errorString = null;
        
        try {
           //findpost변경
            postboard = DBUtils.findMyPost(conn, postNum);
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
        
        //에러 뿜뿜
        if (errorString != null && postboard == null) {
            response.sendRedirect(request.getServletPath() + "/postmytable");
            return;
        }
        
        request.setAttribute("errorString", errorString);
        request.setAttribute("postboard", postboard);
        
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/postDoubleView.jsp");
        dispatcher.forward(request, response);
        
        
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
            
   }

}
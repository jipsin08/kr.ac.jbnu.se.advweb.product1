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
@WebServlet(urlPatterns = { "/editPost" })
public class EditPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPostServlet() {
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
        Post postboard = null;
        String errorString = null;
        
        try {
            postboard = DBUtils.findPost(conn, postNum);
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
        
        //에러 뿜뿜
        if (errorString != null && postboard == null) {
            response.sendRedirect(request.getServletPath() + "/postMain");
            return;
        }
        
        request.setAttribute("errorString", errorString);
        request.setAttribute("postboard", postboard);

        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/WEB-INF/views/editPostView.jsp");
        dispatcher.forward(request, response);
        
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		Connection conn = MyUtils.getStoredConnection(request);
		
		String postNumStr = (String) request.getParameter("postNum");
		//int 형변환
		int postNum = Integer.parseInt(postNumStr);
		
		String postSubject = (String) request.getParameter("postSubject");
		String postContent = (String) request.getParameter("postContent");
		
		Post postboard = new Post(postNum, postSubject, postContent);
		
		String errorString = null;
		
		try {
			DBUtils.updatePost(conn, postboard);
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}
		
		request.setAttribute("errorString", errorString);
		request.setAttribute("postboard", postboard);
		
		//값 잘 들어 왔나?
		//System.out.println("getPostSubject() : "+postboard.getPostSubject());
		//System.out.println("getPostContent() : "+postboard.getPostContent());
		
		response.sendRedirect(request.getContextPath() + "/postSingle?postNum="+postNum);
				
	}

}

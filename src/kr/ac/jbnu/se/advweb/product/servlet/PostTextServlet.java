package kr.ac.jbnu.se.advweb.product.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.jbnu.se.advweb.product.model.Post;
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

/**
 * Servlet implementation class PostTextServlet
 */
/**
 * @author tinyg
 *
 */
@WebServlet(urlPatterns = { "/postText" })
public class PostTextServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostTextServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/postTextView.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		Connection conn = MyUtils.getStoredConnection(request);
		
		// Test_value insert
//		String subject = (String) request.getParameter("postSub");
//		String content = (String) request.getParameter("postCont");
		
		// test code?
		
		Post post = new Post();
		post.setPostContent("test_content");
		post.setPostId("test_id");
		post.setPostNickname("test_nickname");
		post.setPostSubject("post_subject");
		
		//�븘吏� �뿉�윭泥섎━ 鍮쇨퀬
		String errorString = null;
		
		try {
			DBUtils.insertPost(conn, post);
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}
		
		request.setAttribute("errorString", errorString);
		request.setAttribute("post", post);
		
		//�젙�긽
		System.out.println("getPostSubject() : "+post.getPostSubject());
		//鍮꾩젙�긽
		System.out.println("getPostContent() : "+post.getPostContent());
		
		response.sendRedirect(request.getContextPath() + "/postmain");
	}

}

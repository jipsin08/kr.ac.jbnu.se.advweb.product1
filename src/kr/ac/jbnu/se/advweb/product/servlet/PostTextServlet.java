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

import kr.ac.jbnu.se.advweb.product.model.PostBoard;
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
		
		// 우선은 제목과 내용만
		String postSub = (String) request.getParameter("postSub");
		String postCont = (String) request.getParameter("postCont");
		
		PostBoard postboard = new PostBoard(postSub, postCont);
		
		//아직 에러처리 빼고
		String errorString = null;
		
		try {
			DBUtils.insertPost(conn, postboard);
		} catch (SQLException e) {
			e.printStackTrace();
			errorString = e.getMessage();
		}
		
		request.setAttribute("errorString", errorString);
		request.setAttribute("postboard", postboard);
		//정상
		System.out.println("getPostSubject() : "+postboard.getPostSubject());
		//비정상
		System.out.println("getPostContent() : "+postboard.getPostContent());
		
		response.sendRedirect(request.getContextPath() + "/postmain");
	}

}

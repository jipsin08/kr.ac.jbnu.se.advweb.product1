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
import javax.servlet.http.HttpSession;

import kr.ac.jbnu.se.advweb.product.model.Comments;
import kr.ac.jbnu.se.advweb.product.model.UserAccount;
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

/**
 * Servlet implementation class CreateCommentServlet
 */
@WebServlet(urlPatterns = { "/CreateCommentServlet" })
public class CreateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher //
		= this.getServletContext().getRequestDispatcher("/WEB-INF/views/postSingleView.jsp");

		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		Connection conn = (Connection) MyUtils.getStoredConnection(request);
		String comment = request.getParameter("comment");
		
		String stringNum = request.getParameter("postnum");
		int postnum = Integer.parseInt(stringNum);
		
		System.out.println("asdfasdfasdf");
		HttpSession session = request.getSession(true);
		UserAccount useraccount = MyUtils.getLoginedUser(session);
		String username = useraccount.getUserName();
		
		System.out.println(comment);
		System.out.println(postnum);
		System.out.println(username);
		

		Comments _comment = new Comments(comment, username, postnum);
						
		try {
			DBUtils.CreateComment(conn, _comment);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
									
		request.setAttribute("Comment", _comment);
				
		response.sendRedirect(request.getContextPath() + "/postSingleView");
		

	}
}

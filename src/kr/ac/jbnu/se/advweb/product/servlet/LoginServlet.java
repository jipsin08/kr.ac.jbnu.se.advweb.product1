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

import kr.ac.jbnu.se.advweb.product.model.UserAccount;
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

@WebServlet(urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	// Show Login page.
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Forward to /WEB-INF/views/loginView.jsp
		// (Users can not access directly into JSP pages placed in WEB-INF)
		RequestDispatcher dispatcher //
				= this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");

		dispatcher.forward(request, response);

	}

	// When the user enters userName & password, and click Submit.
	// This method will be executed.
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		String rememberMeStr = request.getParameter("rememberMe");
		boolean remember = "Y".equals(rememberMeStr);

		UserAccount user = null;
		boolean hasError = false;
		String errorString = null;
		
		if (password.contains("!")==false & password.contains("~") == false & password.contains("@") == false & password.contains("#") == false & //
				password.contains("$") == false & password.contains("%") == false & password.contains("^") == false & password.contains("&") == false & //
				password.contains("*") == false & password.contains("-") == false & password.contains("=") == false & password.contains(".") == false & //
				password.contains("'") == false & password.contains(";") == false) {
			System.out.println("특수문자 포함하시오.");
			hasError = true;
			errorString = "Typing valid value on username, also password as well.";
		}
		
//		if (password.contains("A")==false & password.contains("B") == false & password.contains("C") == false & password.contains("D") == false & //
//				password.contains("E") == false & password.contains("F") == false & password.contains("G") == false & password.contains("H") == false & //
//				password.contains("I") == false & password.contains("J") == false & password.contains("K") == false & password.contains("L") == false & //
//				password.contains("M") == false & password.contains("N") == false & password.contains("O") == false & password.contains("P") == false & //
//				password.contains("Q") == false & password.contains("R") == false & password.contains("S") == false & password.contains("T") == false & //
//				password.contains("U") == false & password.contains("V") == false & password.contains("W") == false & password.contains("X") == false & //
//				password.contains("Y") == false & password.contains("Z") == false){
//			hasError = true;
//			errorString = "Typing valid value on username, also password as well.";
//		}
		
		if(password.matches(".*[A-Z].*")==false) {
			System.out.println("대문자 포함하시오.");
			hasError = true;
			errorString = "Typing valid value on username, also password as well.";
		}
		
		if(password.matches(".*[0-9].*")==false) {
			System.out.println("숫자 포함하시오.");
			hasError = true;
			errorString = "Typing valid value on username, also password as well.";
		}
		
		

		if (userName == null || password == null || userName.length() == 0 || password.length() == 0 || password.length() < 8) {
			hasError = true;
			errorString = "Typing valid value on username, also password as well.";
		} else {
			Connection conn = MyUtils.getStoredConnection(request);
			try {
				// Find the user in the DB.
				user = DBUtils.findUser(conn, userName, password);

				if (user == null) {
					hasError = true;
					errorString = "User Name or password invalid";
				}
			} catch (SQLException e) {
				e.printStackTrace();
				hasError = true;
				errorString = e.getMessage();
			}
		}
		// If error, forward to /WEB-INF/views/login.jsp
		if (hasError) {
			user = new UserAccount();
			user.setUserName(userName);
			user.setPassword(password);

			// Store information in request attribute, before forward.
			request.setAttribute("errorString", errorString);
			request.setAttribute("user", user);

			// Forward to /WEB-INF/views/login.jsp
			RequestDispatcher dispatcher //
					= this.getServletContext().getRequestDispatcher("/WEB-INF/views/loginView.jsp");

			dispatcher.forward(request, response);
		}
		// If no error
		// Store user information in Session
		// And redirect to userInfo page.
		else {
			HttpSession session = request.getSession();
			MyUtils.storeLoginedUser(session, user);

			// If user checked "Remember me".
			if (remember) {
				MyUtils.storeUserCookie(response, user);
			}
			// Else delete cookie.
			else {
				MyUtils.deleteUserCookie(response);
			}

			// Redirect to loginedHome page.
			response.sendRedirect(request.getContextPath() + "/LoginedHome");
		}
	}

}
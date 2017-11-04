package kr.ac.jbnu.se.advweb.product.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

import kr.ac.jbnu.se.advweb.product.model.UserAccount;
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet(urlPatterns = { "/createUserAccount" })
public class CreateUserAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateUserAccountServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/registrationView.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Connection conn = (Connection) MyUtils.getStoredConnection(request);
		
		String userName = (String) request.getParameter("userName");
		String password = (String) request.getParameter("password");
		String nickName = (String) request.getParameter("nickName");
		String gender = (String) request.getParameter("gender");
		String emailAddress = (String) request.getParameter("emailAddress");
		String answer = (String) request.getParameter("answer");
		
		String errorString = null;
		
		//password Constraint [특수문자 포함]
		if (password.contains("!")==false & password.contains("~") == false & password.contains("@") == false & password.contains("#") == false & //
			password.contains("$") == false & password.contains("%") == false & password.contains("^") == false & password.contains("&") == false & //
			password.contains("*") == false & password.contains("-") == false & password.contains("=") == false & password.contains(".") == false & //
			password.contains("'") == false & password.contains(";") == false) {
			System.out.println("특수문자 포함하시오.");
			errorString = "Error!! Follow the Constraint";
			request.setAttribute("errorString", errorString);
		}
		//password Constraint [대문자 포함]
		if (password.matches(".*[A-Z].*")==false) {
			System.out.println("대문자 포함하시오.");
			errorString = "Error!! Follow the Constraint";
			request.setAttribute("errorString", errorString);
		}
		//password Constraint [숫자 포함]
		if (password.matches(".*[0-9].*")==false) {
			System.out.println("숫자 포함하시오.");
			errorString = "Error!! Follow the Constraint";
			request.setAttribute("errorString", errorString);
		}
		
		// in case user doesn't insert any of such information on registration.
		if (userName == "" || password == "" || emailAddress == "" || nickName == "" || gender == "" || answer == "") {
			errorString = "UserAccount information invalid!";
			request.setAttribute("errorString", errorString);
		} 
		else {
			UserAccount useraccount = new UserAccount(userName, emailAddress, nickName, gender, password, answer);
		
		// try to figure out does that user account already exist in DB. so that prevent DB Error.
		try {
			UserAccount isExist = DBUtils.checkAccount(conn, useraccount);
			
			if (isExist == null) {
				
				System.out.println("DB에 존재 안한답니다.");
				try {
					DBUtils.insertUser(conn, useraccount);
				} catch (SQLException e) {
					e.printStackTrace();
					errorString = e.getMessage();
				}
			}
			else{
				// duplicate user name is exist in DB already.
				System.out.println("DB에 존재 한답니다.");
				errorString = "Same User_Name is already exists in Database!!";
				request.setAttribute("errorString", errorString);
			}
			
			// Store information to request attribute, before forward to views.
//				request.setAttribute("errorString", errorString);
				request.setAttribute("useraccount", useraccount);
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}
		// If error, forward to Edit page.
		if (errorString != null) {
			RequestDispatcher dispatcher = request.getServletContext()
					.getRequestDispatcher("/WEB-INF/views/registrationView.jsp");
			dispatcher.forward(request, response);
		}
		// If everything nice.
		// Redirect to the product listing page.
		else {
			response.sendRedirect(request.getContextPath() + "/login");
		}
	}

}
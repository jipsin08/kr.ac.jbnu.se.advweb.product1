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

/**
 * Servlet implementation class RecoveringPWServlet
 */
@WebServlet(urlPatterns = "/recoveringPW")
public class RecoveringPWServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecoveringPWServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher //
			= this.getServletContext().getRequestDispatcher("/WEB-INF/views/recoveringPWView.jsp");

		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				String username = request.getParameter("userName");
				String gender = request.getParameter("gender");
				
				UserAccount user = null;
				boolean hasError = false;
				String errorString = null;

				if (gender == null || username == null || gender.length() == 0 || username.length() == 0) {
					hasError = true;
					errorString = "Required username and password!";
				} else {
					Connection conn = MyUtils.getStoredConnection(request);
					try {
						// Find the user in the DB.
						user = DBUtils.recoveringPW(conn, gender, username);

						if (user == null) {
							hasError = true;
							errorString = "password is invalid";
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
					user.setGender(gender);
					user.setUserName(username);

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
					// Redirect to Login page.
//					response.sendRedirect(request.getContextPath() + "/somewhere");
					
					String rcvd_name = user.getUserName();
					String rcvd_password = user.getPassword();
					String rcvd_gender = user.getGender();
					
					System.out.println(rcvd_name);
					System.out.println(rcvd_password);
					System.out.println(rcvd_gender);
					
					HttpSession session = request.getSession();
					MyUtils.storeLoginedUser(session, user);
					
					// Redirect to ~~
					response.sendRedirect(request.getContextPath() + "/recoveringPW");
				}
			}

	}

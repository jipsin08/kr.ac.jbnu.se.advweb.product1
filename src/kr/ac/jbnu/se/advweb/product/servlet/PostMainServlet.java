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
import kr.ac.jbnu.se.advweb.product.utils.DBUtils;
import kr.ac.jbnu.se.advweb.product.utils.MyUtils;

/**
 * Servlet implementation class PostTextServlet
 */
/**
 * @author tinyg
 *
 */
@WebServlet(urlPatterns = { "/postmain" })
public class PostMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostMainServlet() {
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
        List<Post> list = null;
        
        try {
            list = DBUtils.queryPost(conn);
        } catch (SQLException e) {
            e.printStackTrace();
            errorString = e.getMessage();
        }
		
        request.setAttribute("errorString", errorString);
        request.setAttribute("postList", list);
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/postMainView.jsp");
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// TODO Auto-generated method stub
				Connection conn = (Connection) MyUtils.getStoredConnection(request);
				String check_id = (String) request.getParameter("checked_id");
				String search_option = (String) request.getParameter("option");
				
				//what if it's null?
				String input_value = (String) request.getParameter("search");
				String ErrorString = null;
				boolean hasError = false;
				List<Post> list = null;
				
				System.out.println("============");
				System.out.println(check_id);
			
				try {
					if (input_value.equals("")) {
					
					if(check_id.equals("")) {
						ErrorString = "Fail to connect.";
						}
					else {
						hasError = true;
					}
				}else {
					
					if(search_option.equals("username")) {
						try {
							List<Post> posts = DBUtils.searchByUsername(conn, input_value);
							
							if(posts == null) {
								System.out.println("username_null");
								ErrorString = "There's no such Item.";
							}else {
								System.out.println("username_notnull");
								request.setAttribute("postList", posts);
							}
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}else 
						if(search_option.equals("subject")) {
							try {
								List<Post> posts = DBUtils.searchBySubject(conn, input_value);
							
								if(posts == null) {
									System.out.println("subject_null");
									ErrorString = "There's no such Item.";
								}else {
									System.out.println("subject_notnull");
									request.setAttribute("postList", posts);
								}
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
					}else 
						if(search_option.equals("content")) {
							try {
								List<Post> posts = DBUtils.searchByContent(conn, input_value);
							
								if(posts.isEmpty()) {
									System.out.println("content_null");
									ErrorString = "There's no such Item.";
								}else {
									System.out.println(posts);
									request.setAttribute("postList", posts);
								}
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
					}
				}
					catch(NullPointerException e) {
						//e.printStackTrace();	
				}
				
				if(hasError) {
					
					request.setAttribute("postList", list);
					
					request.setAttribute("errorString", ErrorString);
//					response.sendRedirect(request.getContextPath() + "/postmain");
					
					RequestDispatcher dispatcher //
						= this.getServletContext().getRequestDispatcher("/WEB-INF/views/postMainView.jsp");

					dispatcher.forward(request, response);
				}else {

					RequestDispatcher dispatcher //
						= this.getServletContext().getRequestDispatcher("/WEB-INF/views/postMainView.jsp");

					dispatcher.forward(request, response);
				}
				
			}
				
	}

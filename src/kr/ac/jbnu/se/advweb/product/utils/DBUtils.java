package kr.ac.jbnu.se.advweb.product.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.ac.jbnu.se.advweb.product.model.Post;
import kr.ac.jbnu.se.advweb.product.model.Product;
import kr.ac.jbnu.se.advweb.product.model.UserAccount;

public class DBUtils {

	public static UserAccount findUser(Connection conn, //
			String userName, String password) throws SQLException {

		String sql = "Select a.User_Name, a.Password, a.Gender, a.NickName, a.Answer, a.Email_Address from User_Account a " //
				+ " where a.User_Name = ? and a.password= ?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, userName);
		pstm.setString(2, password);
		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {
			String gender = rs.getString("Gender");
			String nickname = rs.getString("NickName");
			String answer = rs.getString("Answer");
			String emailAddress = rs.getString("Email_Address");
			UserAccount user = new UserAccount();
			user.setUserName(userName);
			user.setPassword(password);
			user.setGender(gender);
			user.setNickName(nickname);
			user.setAnswer(answer);
			user.setEmailAddress(emailAddress);
			return user;
		}
		return null;
	}
	
	public static UserAccount recoveringID(Connection conn, //
			String gender, String password, String emailAddress, String answer) throws SQLException {
		
		String sql = "Select a.User_Name from User_Account a " //
				+ " where a.Gender = ? and a.password= ? and a.Email_Address = ? and a.answer = ?";
		
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, gender);
		pstm.setString(2, password);
		pstm.setString(3, emailAddress);
		pstm.setString(4, answer);
		ResultSet rs = pstm.executeQuery();
		
		if (rs.next()) {
			String userName = rs.getString("User_Name");
			UserAccount user = new UserAccount();
			user.setUserName(userName);
			user.setPassword(password);
			user.setGender(gender);
			user.setEmailAddress(emailAddress);
			user.setAnswer(answer);
			return user;
		}
		return null;
	}
	
	public static UserAccount recoveringPW(Connection conn, //
			String gender, String username, String emailAddress, String answer) throws SQLException {
		
		String sql = "Select a.Password from User_Account a " //
				+ " where a.Gender = ? and a.User_Name= ? and a.Email_Address= ? and a.Answer= ?";
		
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, gender);
		pstm.setString(2, username);
		pstm.setString(3, emailAddress);
		pstm.setString(4, answer);
		ResultSet rs = pstm.executeQuery();
		
		if (rs.next()) {
			String password = rs.getString("password");
			UserAccount user = new UserAccount();
			user.setUserName(username);
			user.setPassword(password);
			user.setGender(gender);
			user.setEmailAddress(emailAddress);
			user.setAnswer(answer);
			return user;
		}
		return null;
	}	
	
//	public static boolean IsExist(Connection conn, String username, String emailAddress //
//			, String nickname, String gender, String password, String answer) throws SQLException {
//		
//		String sql = "Select * from User_Account a" //
//				+ "where a.User_Name = ? and a.Email_Address =? and a.NickName =? and a.Gender =?" //
//				+ "and a.Password =? and a.Answer =?";
//		
//		PreparedStatement pstm = conn.prepareStatement(sql);
//		
//		pstm.setString(1, username);
//		pstm.setString(2, emailAddress);
//		pstm.setString(3, nickname);
//		pstm.setString(4, gender);
//		pstm.setString(5, password);
//		pstm.setString(6, answer);
//		ResultSet rs = pstm.executeQuery();
//		
//		if (rs.next()) {
//			return true;
//		}
//		return false;
//	}

	public static UserAccount findUser(Connection conn, String userName) throws SQLException {

		String sql = "Select a.User_Name, a.Password, a.Gender from User_Account a "//
				+ " where a.User_Name = ? ";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, userName);

		ResultSet rs = pstm.executeQuery();

		if (rs.next()) {
			String password = rs.getString("Password");
			String gender = rs.getString("Gender");
			UserAccount user = new UserAccount();
			user.setUserName(userName);
			user.setPassword(password);
			user.setGender(gender);
			return user;
		}
		return null;
	}

	public static List<Product> queryProduct(Connection conn) throws SQLException {
		String sql = "Select a.Code, a.Name, a.Price from Product a ";

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();
		List<Product> list = new ArrayList<Product>();
		while (rs.next()) {
			String code = rs.getString("Code");
			String name = rs.getString("Name");
			float price = rs.getFloat("Price");
			Product product = new Product();
			product.setCode(code);
			product.setName(name);
			product.setPrice(price);
			list.add(product);
			
			//정상
			//System.out.println(product.getName());
		}
		//System.out.println("id : "+ list.get(0) + "id : " +list.get(1));
		return list;
	}
	


	public static Product findProduct(Connection conn, String code) throws SQLException {
		String sql = "Select a.Code, a.Name, a.Price from Product a where a.Code=?";

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, code);

		ResultSet rs = pstm.executeQuery();

		while (rs.next()) {
			String name = rs.getString("Name");
			float price = rs.getFloat("Price");
			Product product = new Product(code, name, price);
			return product;
		}
		return null;
	}

	public static void updateProduct(Connection conn, Product product) throws SQLException {
		String sql = "Update Product set Name =?, Price=? where Code=? ";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, product.getName());
		pstm.setFloat(2, product.getPrice());
		pstm.setString(3, product.getCode());
		pstm.executeUpdate();
	}

	public static void insertProduct(Connection conn, Product product) throws SQLException {
		String sql = "Insert into Product(Code, Name,Price) values (?,?,?)";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, product.getCode());
		pstm.setString(2, product.getName());
		pstm.setFloat(3, product.getPrice());

		pstm.executeUpdate();
	}
	
	public static void insertUser(Connection conn, UserAccount useraccount) throws SQLException {
		String sql = "Insert into USER_ACCOUNT(USER_NAME, EMAIL_ADDRESS, NICKNAME, GENDER, PASSWORD, ANSWER) values (?,?,?,?,?,?)";

		PreparedStatement pstm = conn.prepareStatement(sql);
		
		pstm.setString(1, useraccount.getUserName());
		pstm.setString(2, useraccount.getEmailAddress());
		pstm.setString(3, useraccount.getNickName());
		pstm.setString(4, useraccount.getGender());
		pstm.setString(5, useraccount.getPassword());
		pstm.setString(6, useraccount.getAnswer());

		pstm.executeUpdate();
	}

	public static void deleteProduct(Connection conn, String code) throws SQLException {
		String sql = "Delete From Product where Code= ?";

		PreparedStatement pstm = conn.prepareStatement(sql);

		pstm.setString(1, code);

		pstm.executeUpdate();
	}
	
	// Comparing already existed account's user_name with Inserted user name value from registrationView.
	public static UserAccount checkAccount(Connection conn, UserAccount useraccount) throws SQLException {
		
		String sql = "Select a.User_Name, a.Email_Address, a.NickName, a.Gender, a.Password, a.Answer from User_Account a "//
				+ " where a.User_Name = ?";
		
		String username = useraccount.getUserName();

		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, username);
		
		ResultSet rs = pstm.executeQuery();
		
		if (rs.next()) {
			
			String rs_username = rs.getString("User_Name");
			String rs_emailAddress = rs.getString("Email_Address");
			String rs_nickname = rs.getString("NickName");
			String rs_gender = rs.getString("Gender");
			String rs_password = rs.getString("password");
			String rs_answer = rs.getString("Answer");
			
			UserAccount user = new UserAccount();
			
			user.setUserName(rs_username);
			user.setPassword(rs_password);
			user.setGender(rs_gender);
			user.setNickName(rs_nickname);
			user.setEmailAddress(rs_emailAddress);
			user.setAnswer(rs_answer);
			// Confirming.
			return user;
		}
		return null;
	}
	
	public static List<Post> searchByUsername(Connection conn, String username) throws SQLException {
		
		// 여기서 post_id는 작성자를 나타내므로 user name(작성자 ID)을 값으로 받아 사용할 것.
		String sql = "Select a.post_num, a.post_id, a.post_nickname, a.post_subject, a.post_content, a.post_date, a.post_visible"
				+ " from post_board a where a.post_id = ?";
		
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, username);
		
		ResultSet rs = pstm.executeQuery();
		List<Post> posts = new ArrayList<Post>();
		
		while (rs.next()) {
			
			String rs_username = rs.getString("Post_Id");
			String rs_nickname = rs.getString("Post_Nickname");
			String rs_subject = rs.getString("Post_Subject");
			String rs_content = rs.getString("Post_Content");
			String rs_date = rs.getString("Post_Date");
			int rs_visible = rs.getInt("Post_Visible");
			
			Post postObject = new Post();
			
			postObject.setPostId(rs_username);
			postObject.setPostNickname(rs_nickname);
			postObject.setPostSubject(rs_subject);
			postObject.setPostContent(rs_content);
			postObject.setPostVisible(rs_visible);
			postObject.setPostDate(rs_date);
			posts.add(postObject);
			// Confirming.
		}
		return posts;
	}
	
	public static List<Post> searchBySubject(Connection conn, String input_value) throws SQLException {
		
		// 여기서 post_id는 작성자를 나타내므로 user name(작성자 ID)을 값으로 받아 사용할 것.
		String sql = "Select a.post_num, a.post_id, a.post_nickname, a.post_subject, a.post_content, a.post_date, a.post_visible"
				+ " from post_board a where a.post_subject like ? and a.post_visible = 1";
		
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, "%"+input_value+"%");
		
		ResultSet rs = pstm.executeQuery();
		List<Post> posts = new ArrayList<Post>();
		
		while (rs.next()) {
			
			String rs_username = rs.getString("Post_Id");
			String rs_nickname = rs.getString("Post_Nickname");
			String rs_subject = rs.getString("Post_Subject");
			String rs_content = rs.getString("Post_Content");
			String rs_date = rs.getString("Post_Date");
			int rs_visible = rs.getInt("Post_Visible");
			
			Post postObject = new Post();
			
			postObject.setPostId(rs_username);
			postObject.setPostNickname(rs_nickname);
			postObject.setPostSubject(rs_subject);
			postObject.setPostContent(rs_content);
			postObject.setPostVisible(rs_visible);
			postObject.setPostDate(rs_date);
			posts.add(postObject);
			// Confirming.
		}
		return posts;
	}
	
public static List<Post> searchByContent(Connection conn, String input_value) throws SQLException {
		
		// 여기서 post_id는 작성자를 나타내므로 user name(작성자 ID)을 값으로 받아 사용할 것.
		String sql = "Select a.post_num, a.post_id, a.post_nickname, a.post_subject, a.post_content, a.post_date, a.post_visible"
				+ " from post_board a where a.post_content like ? and a.post_visible = 1";
		
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, "%"+input_value+"%");
		
		ResultSet rs = pstm.executeQuery();
		List<Post> posts = new ArrayList<Post>();
		
		while (rs.next()) {
			
			String rs_username = rs.getString("Post_Id");
			String rs_nickname = rs.getString("Post_Nickname");
			String rs_subject = rs.getString("Post_Subject");
			String rs_content = rs.getString("Post_Content");
			String rs_date = rs.getString("Post_Date");
			int rs_visible = rs.getInt("Post_Visible");
			
			Post postObject = new Post();
			
			postObject.setPostId(rs_username);
			postObject.setPostNickname(rs_nickname);
			postObject.setPostSubject(rs_subject);
			postObject.setPostContent(rs_content);
			postObject.setPostVisible(rs_visible);
			postObject.setPostDate(rs_date);
			posts.add(postObject);
			// Confirming.
		}
		return posts;
	}
	
	//
	//PostBoard
	//
	
	//DB에서 뽑아오기
	public static List<Post> queryPost(Connection conn) throws SQLException {
		String sql = "Select a.post_num, a.post_id, a.post_nickname, a.post_subject, a.post_content, a.post_date, a.post_visible"
				+ " from post_board a where a.post_visible = 1";

		PreparedStatement pstm = conn.prepareStatement(sql);

		ResultSet rs = pstm.executeQuery();
		List<Post> posts = new ArrayList<Post>();
		while (rs.next()) {
			
			String postId = rs.getString("post_id");
			String postNickname = rs.getString("post_nickname");
			String postSubject = rs.getString("post_subject");
			String postContent = rs.getString("post_content");
			String postDate = rs.getString("post_date");
			int postNum = rs.getInt("post_num");
			int postVisible = rs.getInt("post_visible");
		
			Post post = new Post();
			
			post.setPostId(postId);		
			post.setPostNickname(postNickname);
			post.setPostSubject(postSubject);
			post.setPostContent(postContent);
			post.setPostVisible(postVisible);
			post.setPostDate(postDate);
			post.setPostNum(postNum);
			posts.add(post);

			//Null NUll 한 값 해결
			//System.out.println(postboard.getPostDate() + postboard.getPostNickname());	
		}
		//System.out.println("id : "+ list.get(0) + "id : " +list.get(2));
		return posts;
	}

	// DB에 구겨 넣기
	/*
	 * 
	public static void insertPost(Connection conn, PostBoard postboard) throws SQLException {
		String sql = "Insert into Product(post_num, post_id, post_nickname, post_subject, post_content, post_date) "
				+ "values (?,?,?,?,?,sysdate(),?)";
	
	*/
		
		public static void insertPost(Connection conn, Post post) throws SQLException {
			String sql = "Insert into post_board(post_id, post_nickname, post_subject, post_content, post_date, post_visible) "
					+ "values ('test','test',?,?,sysdate(),1)";

		PreparedStatement pstm = conn.prepareStatement(sql);
			
		//그냥 써도 null 값 들어가서 오류 안날거 같긴한데
/*		pstm.setString(1, postboard.getPostNum());
		pstm.setString(2, postboard.getPostId());
		pstm.setString(3, postboard.getPostNickname());
		pstm.setString(4, postboard.getPostSubject());
		pstm.setString(5, postboard.getPostContent());
*/
		//제목 내용만 테스트
		pstm.setString(1, post.getPostSubject());
		pstm.setString(2, post.getPostContent());

		pstm.executeUpdate();
	}
	

}
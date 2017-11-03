package kr.ac.jbnu.se.advweb.product.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
		}
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
		
		// 회원가입할 때 어떤 값을 입력 받을 지에 따라 추가하여 사용할 수 잇다.
		String username = useraccount.getUserName();
//		String emailAddress = useraccount.getEmailAddress();
//		String nickname = useraccount.getNickName();
//		String gender = useraccount.getGender();
//		String password = useraccount.getPassword();
//		String answer = useraccount.getAnswer();
		
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setString(1, username);
//		pstm.setString(2, emailAddress);
//		pstm.setString(3, nickname);
//		pstm.setString(4, gender);
//		pstm.setString(5, password);
//		pstm.setString(6, answer);
		
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

}
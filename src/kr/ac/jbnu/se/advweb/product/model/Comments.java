package kr.ac.jbnu.se.advweb.product.model;

public class Comments {
	
private String comment;
private String userName;
private int postNum;

	public Comments() {
		
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	//ȸ������ �� �̿��� ������
	public Comments(String comment, String username, int postNum) {
		this.comment = comment;
		this.userName = username;
		this.postNum = postNum;
	}
	
	
	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	

	public int getpostNum() {
		return postNum;
	}

	public void setpostNum(int postNum) {
		this.postNum = postNum;
	}
}

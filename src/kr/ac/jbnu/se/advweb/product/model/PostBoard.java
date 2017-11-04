package kr.ac.jbnu.se.advweb.product.model;

import java.sql.Date; //sysdate() 사용

/**
 * @author tinyg
 *
 */
public class PostBoard {
	
	private String postNum;
	private String postId;
	private String postNickname;
	private String postSubject;
	private String postContent;
	private String postDate;
	
	
	
	public PostBoard() {
	}

	public PostBoard(String postNum, String postId, String postNickname, String postSubject, String postContent,
			String postDate) {
		super();
		this.postNum = postNum;
		this.postId = postId;
		this.postNickname = postNickname;
		this.postSubject = postSubject;
		this.postContent = postContent;
		this.postDate = postDate;
	}
	
	
	// TEST 제목 내용만
	public PostBoard(String postSubject, String postContent) {
		super();
		this.postSubject = postSubject;
		this.postContent = postContent;
	}

	public String getPostNum() {
		return postNum;
	}
	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}
	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
	}
	public String getPostNickname() {
		return postNickname;
	}
	public void setPostNickname(String postNickname) {
		this.postNickname = postNickname;
	}
	public String getPostSubject() {
		return postSubject;
	}
	public void setPostSubject(String postSubject) {
		this.postSubject = postSubject;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	
	
}

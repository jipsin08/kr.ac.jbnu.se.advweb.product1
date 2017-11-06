package kr.ac.jbnu.se.advweb.product.model;

// �엯�젰諛쏆븘�빞 �븷 媛믩뱾 �굹�뿴 --> ck_Editor�뿉�꽌 Insert�슂泥� 諛쏆쓣 �븣 �씠�윭�븳 媛믩뱾�쓣 諛쏆븘�빞 �븿.
public class Post {
	public String postId; // 작성자ID
	public String postNickname; // 작성자닉네임
	public String postSubject;
	public String postContent;
	public String postDate;
	public int postNum;
	public int postVisible;
	public Post() {
	}

	public Post(String post_id, String post_nickname, String post_subject, String post_content,//
		 int post_visible) {
		this.postId = post_id;
		this.postNickname = post_nickname;
		this.postSubject = post_subject;
		this.postContent = post_content;
		this.postVisible = post_visible;
	}
	
	//start
	// Merge 한거
	public Post(int postNum, String postId, String postNickname, String postSubject, String postContent,
			String postDate, int postVisible) {
		super();
		this.postNum = postNum;
		this.postId = postId;
		this.postNickname = postNickname;
		this.postSubject = postSubject;
		this.postContent = postContent;
		this.postDate = postDate;
		this.postVisible = postVisible;
	}
	
	
	public Post(String postSubject, String postContent) {
		super();
		this.postSubject = postSubject;
		this.postContent = postContent;
	}
	
	public Post(int postNum, String postSubject, String postContent) {
		super();
		this.postNum = postNum;
		this.postSubject = postSubject;
		this.postContent = postContent;
	}
	
	// Merge 한거
	//ene

	public String getPostId() {
		return postId;
	}

	public void setPostId(String post_id) {
		this.postId = post_id;
	}

	public String getPostNickname() {
		return postNickname;
	}

	public void setPostNickname(String post_nickname) {
		this.postNickname = post_nickname;
	}

	public String getPostSubject() {
		return postSubject;
	}

	public void setPostSubject(String post_subject) {
		this.postSubject = post_subject;
	}
	
	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String post_content) {
		this.postContent = post_content;
	}
	
	public int getPostVisible() {
		return postVisible;
	}

	public void setPostVisible(int post_visible) {
		this.postVisible = post_visible;
	}
	
	public String getPostDate() {
		return postDate;
	}
	
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
}
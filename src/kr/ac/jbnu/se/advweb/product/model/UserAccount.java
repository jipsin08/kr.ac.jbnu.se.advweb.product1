package kr.ac.jbnu.se.advweb.product.model;

public class UserAccount {

	public static final String GENDER_MALE = "M";
	public static final String GENDER_FEMALE = "F";

	private String userName;
	private String emailAddress;
	private String nickName;
	private String gender;
	private String password;
	private String answer;
//	private String interest;
	
	public UserAccount(){
		
	}

	//ȸ������ �� �̿��� ������
	public UserAccount(String userName, String emailAddress, String nickName, String gender, String password, String answer) {
		this.userName = userName;
		this.emailAddress = emailAddress;
		this.nickName = nickName;
		this.gender = gender;
		this.password = password;
		this.answer = answer;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	// just in case for adopting as a flag of user's interests, like Hash Tag #
//	public String getInterest() {
//		return interest;
//	}
//
//	public void setInterest(String interest) {
//		this.interest = interest;
//	}

}
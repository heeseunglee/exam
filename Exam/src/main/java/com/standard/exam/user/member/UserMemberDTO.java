package com.standard.exam.user.member;

public class UserMemberDTO {
	
	//member table - 회원
	private String seq;
	private String name;
	private String userID;
	private String userPW;
	private String gender;
	private String tel1;
	private String tel2;
	private String tel3;
	private String birth;
	private String address;
	private String email;
	private String userImage;
	private String userProduce;
	private String enterDate;
	private String mileagePoint;
	private String reception;
	private String memberState;
	private String active;
	
	
	//memberState table - 멤버상태
	private String memberStateDIV;
	
	
	//membership table - 유료회원관리 
	private String memberShip;
	private String memberPeriodStart;
	private String memberPeriodEnd;
	

	//reception table - 수신동의테이블
	private String smsCheck;
	private String emailCheck;
	private String messageCheck;
	private String member;
	
	

	//member table - 회원
	public String getReception() {
		return reception;
	}

	public void setReception(String reception) {
		this.reception = reception;
	}
	
	public String getSeq() {
		return seq;
	}
	
	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}
	public String getUserProduce() {
		return userProduce;
	}
	public void setUserProduce(String userProduce) {
		this.userProduce = userProduce;
	}
	public String getEnterDate() {
		return enterDate;
	}
	public void setEnterDate(String enterDate) {
		this.enterDate = enterDate;
	}
	
	public String getMemberState() {
		return memberState;
	}
	public void setMemberState(String memberState) {
		this.memberState = memberState;
	}

	public String getMileagePoint() {
		return mileagePoint;
	}

	public void setMileagePoint(String mileagePoint) {
		this.mileagePoint = mileagePoint;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}
	
	
	//membership table - 유료회원관리 	
	public String getMemberShip() {
		return memberShip;
	}

	public void setMemberShip(String memberShip) {
		this.memberShip = memberShip;
	}

	public String getMemberPeriodStart() {
		return memberPeriodStart;
	}

	public void setMemberPeriodStart(String memberPeriodStart) {
		this.memberPeriodStart = memberPeriodStart;
	}

	public String getMemberPeriodEnd() {
		return memberPeriodEnd;
	}

	public void setMemberPeriodEnd(String memberPeriodEnd) {
		this.memberPeriodEnd = memberPeriodEnd;
	}
	
	
	
	
	
	//reception table - 수신동의테이블
	public String getSmsCheck() {
		return smsCheck;
	}

	public void setSmsCheck(String smsCheck) {
		this.smsCheck = smsCheck;
	}

	public String getEmailCheck() {
		return emailCheck;
	}

	public void setEmailCheck(String emailCheck) {
		this.emailCheck = emailCheck;
	}

	public String getMessageCheck() {
		return messageCheck;
	}

	public void setMessageCheck(String messageCheck) {
		this.messageCheck = messageCheck;
	}

	public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
	}

	//memberState table - 멤버상태
	public String getMemberStateDIV() {
		return memberStateDIV;
	}

	public void setMemberStateDIV(String memberStateDIV) {
		this.memberStateDIV = memberStateDIV;
	}






	
	
	
	
}

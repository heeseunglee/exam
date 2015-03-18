package com.standard.exam.auth;

public class LoginDTO {
	private String seq;
	private String name;
	private String userId;
	private String userImage;
	private String mileagePoint;
	private String memberState;
	
	
	public String getSeq() {
		return seq;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserImage() {
		return userImage;
	}
	public void setUserImage(String userImage) {
		this.userImage = userImage;
	}
	public String getMileagePoint() {
		return mileagePoint;
	}
	public void setMileagePoint(String mileagePoint) {
		this.mileagePoint = mileagePoint;
	}
	public String getMemberState() {
		return memberState;
	}
	public void setMemberState(String memberState) {
		this.memberState = memberState;
	}
	
}

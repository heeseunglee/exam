package com.standard.exam.admin.message;

public class MessageDTO {

	 private String seq;  //쪽지 번호
	 private String subject; //쪽지 제목
	 private String content; //쪽지 내용
	 private String regDate; //작성 시간
	 private String toSeq;    // 받는사람 seq
	 private String fromSeq; //보낸 사람 seq
	 private String fromID;    //보낸사람 아이디 
	 private String read;
	 
	 
	 private String memSeq;
	 private String name;
	 private String userId;
	 private String rnum;
	 private String memberId;
	
	 public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getRead() {
		return read;
	}
	public void setRead(String read) {
		this.read = read;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMemSeq() {
		return memSeq;
	}
	public void setMemSeq(String memSeq) {
		this.memSeq = memSeq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getToSeq() {
		return toSeq;
	}
	public void setToSeq(String toSeq) {
		this.toSeq = toSeq;
	}
	public String getFromSeq() {
		return fromSeq;
	}
	public void setFromSeq(String fromSeq) {
		this.fromSeq = fromSeq;
	}
	public String getFromID() {
		return fromID;
	}
	public void setFromID(String fromID) {
		this.fromID = fromID;
	}
	 
	 
	 
}

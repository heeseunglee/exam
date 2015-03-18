package com.standard.exam.user.member;

public class UserTestResultDTO {
	private String userSeq;
	
	// 답안지 컬럼
	private String answerSeq;
	private String userAnswer;
	private String testNumber;
	private String questionManage;	
	private String oxCheck;
	private String answer;
	private String tnSeq;
	private String testPaperManage;
	private String tpmSubject;
	private String userTestDate;
	private int answerCnt;
	
	
	
	public int getAnswerCnt() {
		return answerCnt;
	}

	public void setAnswerCnt(int answerCnt) {
		this.answerCnt = answerCnt;
	}

	public String getUserTestDate() {
		return userTestDate;
	}

	public void setUserTestDate(String userTestDate) {
		this.userTestDate = userTestDate;
	}

	public String getTpmSubject() {
		return tpmSubject;
	}

	public void setTpmSubject(String tpmSubject) {
		this.tpmSubject = tpmSubject;
	}

	public String getTestPaperManage() {
		return testPaperManage;
	}

	public void setTestPaperManage(String testPaperManage) {
		this.testPaperManage = testPaperManage;
	}

	public String getTnSeq() {
		return tnSeq;
	}

	public void setTnSeq(String tnSeq) {
		this.tnSeq = tnSeq;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getOxCheck() {
		return oxCheck;
	}

	public void setOxCheck(String oxCheck) {
		this.oxCheck = oxCheck;
	}

	public String getAnswerSeq() {
		return answerSeq;
	}

	public void setAnswerSeq(String answerSeq) {
		this.answerSeq = answerSeq;
	}

	public String getUserAnswer() {
		return userAnswer;
	}

	public void setUserAnswer(String userAnswer) {
		this.userAnswer = userAnswer;
	}

	public String getTestNumber() {
		return testNumber;
	}

	public void setTestNumber(String testNumber) {
		this.testNumber = testNumber;
	}

	public String getQuestionManage() {
		return questionManage;
	}

	public void setQuestionManage(String questionManage) {
		this.questionManage = questionManage;
	}

	public String getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(String userSeq) {
		this.userSeq = userSeq;
	}
	
}

package com.standard.exam.admin.exam;


public class QuestionDTO {
	
	//DB
	private String seq;
	private String question;
	private String answer;
	private String explanation;
	private String question1;
	private String question2;
	private String question3;
	private String question4;
	private String score;
	private String questionCNT;
	private String answerCNT;
	private String description;
	private String questionCode;
	
	//추가
	private String rnum;
	private String newImg;
	private String testpaperseq;
	
	public String getTestpaperseq() {
		return testpaperseq;
	}
	public void setTestpaperseq(String testpaperseq) {
		this.testpaperseq = testpaperseq;
	}
	public String getNewImg() {
		return newImg;
	}
	public void setNewImg(String newImg) {
		this.newImg = newImg;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public String getQuestion1() {
		return question1;
	}
	public void setQuestion1(String question1) {
		this.question1 = question1;
	}
	public String getQuestion2() {
		return question2;
	}
	public void setQuestion2(String question2) {
		this.question2 = question2;
	}
	public String getQuestion3() {
		return question3;
	}
	public void setQuestion3(String question3) {
		this.question3 = question3;
	}
	public String getQuestion4() {
		return question4;
	}
	public void setQuestion4(String question4) {
		this.question4 = question4;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getQuestionCNT() {
		return questionCNT;
	}
	public void setQuestionCNT(String questionCNT) {
		this.questionCNT = questionCNT;
	}
	public String getAnswerCNT() {
		return answerCNT;
	}
	public void setAnswerCNT(String answerCNT) {
		this.answerCNT = answerCNT;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getQuestionCode() {
		return questionCode;
	}
	public void setQuestionCode(String questionCode) {
		this.questionCode = questionCode;
	}
	
	
}

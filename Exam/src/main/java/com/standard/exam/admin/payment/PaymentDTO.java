package com.standard.exam.admin.payment;

public class PaymentDTO {
	private String seq;
	private String paymentList;
	private String payment;
	private String paymentDate;
	private String member;
	private String paymentAuth;
	
	private String bankName;
	private String bankNumber;
	private String bankRep;
	private String rnum;
	private String userId;
	private String name;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBankNumber() {
		return bankNumber;
	}
	public void setBankNumber(String bankNumber) {
		this.bankNumber = bankNumber;
	}
	public String getBankRep() {
		return bankRep;
	}
	public void setBankRep(String bankRep) {
		this.bankRep = bankRep;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getPaymentList() {
		return paymentList;
	}
	public void setPaymentList(String paymentList) {
		this.paymentList = paymentList;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getMember() {
		return member;
	}
	public void setMember(String member) {
		this.member = member;
	}
	public String getPaymentAuth() {
		return paymentAuth;
	}
	public void setPaymentAuth(String paymentAuth) {
		this.paymentAuth = paymentAuth;
	}
	
	
}

package com.standard.exam.admin.exam;

import java.util.List;

public class TestPaperDTO {
	
	private String tpbdiv;
	private String tpmdiv;
	private String tpbdivadd;
	private String tpmdivadd;
	private String tpsdivadd;
	private String tpmdivcheck;
	private String questionadd;
	private String alltestcnt;
	private String receiptcnt;
	private String questioncnt;
	private String tpmseq;
	private int start;
	private int end;
	
	
	
	

		public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

		// 추가
	// 검색어 
		private String subject;
		private String content;
		
		//시험지관리
		private String seq;
		private String tpmSubject;
		private String tpmPrice;
		private String tpmTime;
		private String tpsDiv;
			
		//대분류
		private String tpbdivSeq;
		//중분류
		private String tpmdivSeq;
		//소분류
		private String tpsdivSeq;
	
	
	private String alltestseq;
	
	
	public String getAlltestseq() {
		return alltestseq;
	}

	public void setAlltestseq(String alltestseq) {
		this.alltestseq = alltestseq;
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

	public String getAlltestcnt() {
		return alltestcnt;
	}

	public void setAlltestcnt(String alltestcnt) {
		this.alltestcnt = alltestcnt;
	}

	public String getReceiptcnt() {
		return receiptcnt;
	}

	public void setReceiptcnt(String receiptcnt) {
		this.receiptcnt = receiptcnt;
	}

	public String getQuestioncnt() {
		return questioncnt;
	}

	public void setQuestioncnt(String questioncnt) {
		this.questioncnt = questioncnt;
	}

	public String getTpmseq() {
		return tpmseq;
	}

	public void setTpmseq(String tpmseq) {
		this.tpmseq = tpmseq;
	}

	public String getQuestionadd() {
		return questionadd;
	}

	public void setQuestionadd(String questionadd) {
		this.questionadd = questionadd;
	}

	public String getTpmdivcheck() {
		return tpmdivcheck;
	}

	public void setTpmdivcheck(String tpmdivcheck) {
		this.tpmdivcheck = tpmdivcheck;
	}

	public String getTpbdiv() {
		return tpbdiv;
	}

	public void setTpbdiv(String tpbdiv) {
		this.tpbdiv = tpbdiv;
	}

	public String getTpmdiv() {
		return tpmdiv;
	}

	public void setTpmdiv(String tpmdiv) {
		this.tpmdiv = tpmdiv;
	}


	public String getTpbdivadd() {
		return tpbdivadd;
	}

	public void setTpbdivadd(String tpbdivadd) {
		this.tpbdivadd = tpbdivadd;
	}

	public String getTpmdivadd() {
		return tpmdivadd;
	}

	public void setTpmdivadd(String tpmdivadd) {
		this.tpmdivadd = tpmdivadd;
	}

	public String getTpsdivadd() {
		return tpsdivadd;
	}

	public void setTpsdivadd(String tpsdivadd) {
		this.tpsdivadd = tpsdivadd;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getTpmSubject() {
		return tpmSubject;
	}

	public void setTpmSubject(String tpmSubject) {
		this.tpmSubject = tpmSubject;
	}

	public String getTpmPrice() {
		return tpmPrice;
	}

	public void setTpmPrice(String tpmPrice) {
		this.tpmPrice = tpmPrice;
	}

	public String getTpmTime() {
		return tpmTime;
	}

	public void setTpmTime(String tpmTime) {
		this.tpmTime = tpmTime;
	}

	public String getTpsDiv() {
		return tpsDiv;
	}

	public void setTpsDiv(String tpsDiv) {
		this.tpsDiv = tpsDiv;
	}

	public String getTpbdivSeq() {
		return tpbdivSeq;
	}

	public void setTpbdivSeq(String tpbdivSeq) {
		this.tpbdivSeq = tpbdivSeq;
	}

	public String getTpmdivSeq() {
		return tpmdivSeq;
	}

	public void setTpmdivSeq(String tpmdivSeq) {
		this.tpmdivSeq = tpmdivSeq;
	}

	public String getTpsdivSeq() {
		return tpsdivSeq;
	}

	public void setTpsdivSeq(String tpsdivSeq) {
		this.tpsdivSeq = tpsdivSeq;
	}
	
}

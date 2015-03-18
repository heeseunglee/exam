package com.standard.exam.user.board;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class Paging {
	
	private int totalCount = 0;
	private int totalPage = 0;
	private int pageSize = 10;
	private int no = 0;
	private int loop = 0;
	private int nowPage = 0;
	private int blockSize = 5;
	
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getLoop() {
		return loop;
	}
	public void setLoop(int loop) {
		this.loop = loop;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	
	
	
	@Autowired
	public BoardQNADAO dao;
	
	

	/**
	 * 페이지에 속하는 게시물 시작번호와 끝번호 반환
	 * 
	 * @param page
	 * @return map : [ {"start" : seq}, {"end" : seq} ]
	 */
	public HashMap<String, Integer> getPageIndex(String page) {
		
		if ( page == null || page == "null" ) {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		
		int start = ( (nowPage - 1) * 10) + 1;
		int end = start + 10 - 1;
		
		
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return map;
	}
	
	
	/**
	 * 페이지바 태그 문자열 반환
	 * 
	 * @return String tag
	 */
	public String getPageBar(String page, int totalCount) {

		//System.out.println("nowPage : " + nowPage + ", blockSize : " + blockSize + ", loop : " + loop + ", no : " + no  );
		
		loop = 1;
		no = ( (nowPage - 1) / blockSize ) * blockSize + 1;
		totalPage = (int)Math.ceil(totalCount / (double)pageSize);
		
		String pageBar = "";
		pageBar +=  "<ul class='pagination pagination-sm'>";
		
		// 이전 5 페이지
		if (no != 1){
			pageBar += String.format("<li><a href='/exam/community/qna/list.action?page=%d'>«</a></li>"
									, no-1);
		} else {
			pageBar += String.format("<li class='disabled'><a href='#'>«</a></li>");
		}
		
		// 페이지 번호 링크
		while (!(loop > blockSize || no > totalPage)) {
			
			if(no == nowPage){
				pageBar += String.format("<li class='active'><a href='/exam/community/qna/list.action?page=%d'>%d</a></li>", no, no);
			
			} else {
				pageBar += String.format("<li><a href='/exam/community/qna/list.action?page=%d'>%d</a></li>", no, no);
			}
			
			loop++;
			no++;
		}
		
		// 다음 5 페이지
		if (no <= totalPage){
			pageBar += String.format("<li><a href='/exam/community/qna/list.action?page=%d'>»</a></li>"
									, no);
		} else {
			pageBar += String.format("<li class='disabled'><a href='#'>»</a></li>");
		}
		
		pageBar += "</ul>";
		
		return pageBar;
	}
	
	
	
	/**
	 * 시험보기 - 페이지별 시험지 인덱스 리턴
	 * @param page
	 * @return
	 */
	public HashMap<String, Integer> getExamPageIndex(String page) {

		if ( page == null || page == "null" ) {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		int ExamPageSize = 5;
		
		int start = ( (nowPage - 1) * ExamPageSize) + 1;
		int end = start + ExamPageSize - 1;
		
		
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("start", start);
		map.put("end", end);
		
		return map;
	}
	
	
	
	/**
	 * 시험보기 = 페이지바 태그 문자열 반환
	 * 
	 * @return String tag
	 */
	public String getExamPageBar(String page, int totalCount) {

		if ( page == null || page == "null" ) {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		int ExamPageSize = 5;
		//System.out.println("nowPage : " + nowPage + ", blockSize : " + blockSize + ", loop : " + loop + ", no : " + no  );
		
		loop = 1;
		no = ( (nowPage - 1) / blockSize ) * blockSize + 1;
		totalPage = (int)Math.ceil(totalCount / (double)ExamPageSize);
		
		String pageBar = "";
		pageBar +=  "<ul class='pagination pagination-sm'>";
		
		// 이전 5 페이지
		if (no != 1){
			pageBar += String.format("<li><a href='/exam/user/exam/list.action?page=%d'>«</a></li>"
									, no-1);
		} else {
			pageBar += String.format("<li class='disabled'><a href='#'>«</a></li>");
		}
		
		// 페이지 번호 링크
		while (!(loop > blockSize || no > totalPage)) {
			
			if(no == nowPage){
				pageBar += String.format("<li class='active'><a href='/exam/user/exam/list.action?page=%d'>%d</a></li>", no, no);
			
			} else {
				pageBar += String.format("<li><a href='/exam/user/exam/list.action?page=%d'>%d</a></li>", no, no);
			}
			
			loop++;
			no++;
		}
		
		// 다음 5 페이지
		if (no <= totalPage){
			pageBar += String.format("<li><a href='/exam/user/exam/list.action?page=%d'>»</a></li>"
					, no);
		} else {
			pageBar += String.format("<li class='disabled'><a href='#'>»</a></li>");
		}
		
		pageBar += "</ul>";
		
		return pageBar;
	}
	
	
	
	/**
	 * 시험보기 = 페이지바 태그 문자열 반환
	 * 
	 * @return String tag
	 */
	public String getExamPageBar(String page, int totalCount, String sideSeq) {

		if ( page == null || page == "null" ) {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		int ExamPageSize = 5;
		//System.out.println("nowPage : " + nowPage + ", blockSize : " + blockSize + ", loop : " + loop + ", no : " + no  );
		
		loop = 1;
		no = ( (nowPage - 1) / blockSize ) * blockSize + 1;
		totalPage = (int)Math.ceil(totalCount / (double)ExamPageSize);
		
		String pageBar = "";
		pageBar +=  "<ul class='pagination pagination-sm'>";
		
		// 이전 5 페이지
		if (no != 1){
			pageBar += String.format("<li><a href='/exam/user/exam/list.action?sideSeq=%s&page=%d'>«</a></li>"
									, sideSeq, no-1);
		} else {
			pageBar += String.format("<li class='disabled'><a href='#'>«</a></li>");
		}
		
		// 페이지 번호 링크
		while (!(loop > blockSize || no > totalPage)) {
			
			if(no == nowPage){
				pageBar += String.format("<li class='active'><a href='/exam/user/exam/list.action?sideSeq=%s&page=%d'>%d</a></li>", sideSeq, no, no);
			
			} else {
				pageBar += String.format("<li><a href='/exam/user/exam/list.action?sideSeq=%s&page=%d'>%d</a></li>", sideSeq , no, no);
			}
			
			loop++;
			no++;
		}
		
		// 다음 5 페이지
		if (no <= totalPage){
			pageBar += String.format("<li><a href='/exam/user/exam/list.action?sideSeq=%s&page=%d'>»</a></li>"
					, sideSeq, no);
		} else {
			pageBar += String.format("<li class='disabled'><a href='#'>»</a></li>");
		}
		
		pageBar += "</ul>";
		
		return pageBar;
	}
	
	
	
	
	
}

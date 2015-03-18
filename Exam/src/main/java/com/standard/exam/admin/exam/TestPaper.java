package com.standard.exam.admin.exam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("testpaper")
public class TestPaper {

	@Autowired
	private TestPaperDAO dao;
		
	// 문제지리스트
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/testpaperadd.action")
	public String list(TestPaperDTO dto, HttpServletRequest req, HttpSession session){
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		// 시험종류 리스트
		List<TestPaperDTO> tpbdivlist = dao.TestPaperCategoryTpb(dto);
		req.setAttribute("tpbdivlist", tpbdivlist);
		return "admin/exam/testpaperadd";
		
	}
	
	// 시험종류 선택 - 시험과목
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/testpapertpbsel.action")
	public String tpbsel(TestPaperDTO dto, HttpServletRequest req, HttpSession session){
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		// 시험종류명으로  seq 받기
		String tpbdiv = req.getParameter("tpbdiv");
		List<TestPaperDTO> tpmdivlist = dao.TestPaperCategoryTpm(tpbdiv);
		req.setAttribute("tpmdivlist", tpmdivlist);
	
		return "admin/exam/testpapertpbselok";
		
	}
	
	
	// 시험횟수 선택
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/testpapertpmsel.action")
	public String tpmsel(TestPaperDTO dto, HttpServletRequest req, HttpSession session){
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		// 시험과목명으로  seq 받기
		String tpmdiv = req.getParameter("tpmdiv");
		List<TestPaperDTO> tpsdivlist = dao.TestPaperCategoryTps(tpmdiv);

		req.setAttribute("tpsdivlist", tpsdivlist);
		return "admin/exam/testpapertpmselok";
		
	}
	
	// 시험회차 선택 후 문제 가져오기
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/testpapertpssel.action")
	public String tpssel(QuestionDTO dto, HttpServletRequest req, HttpSession session){
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		// 시험과목명으로  seq 받기
		String tpmdiv = req.getParameter("tpmdiv");
		tpmdiv = dao.tpmdivcheck(tpmdiv);
		List<QuestionDTO> questionlist = dao.questionlist(tpmdiv);
		req.setAttribute("questionlist", questionlist);
		
		return "admin/exam/testpapertpsselok";
		
	}
	
	
	// 문제지 추가하기
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/testpapermake.action")
	public String testpapermake(TestPaperDTO dto, HttpServletRequest req, HttpSession session){
		// 시험과목명으로  seq 받기
		String tpsDiv = req.getParameter("tpsdiv");
		String tpmSubject = req.getParameter("testpapersubject");
		String tpmPrice = req.getParameter("testprice");
		String tpmTime = req.getParameter("testtime");
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		dto.setTpsDiv(tpsDiv);
		dto.setTpmSubject(tpmSubject);
		dto.setTpmTime(tpmTime);
		dto.setTpmPrice(tpmPrice);
		
		// 문제지 등록
		dao.tpmadd(dto);
		String testpaperseq = dao.testpaperseq();
		
		// 전체시험 등록
		dao.alltestadd(testpaperseq);
		
		return "admin/exam/testpapermakeok";
		
	}
	
	// 선택문제 추가하기
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/testpaperquestionadd.action")
	public String testpaperquestionadd(QuestionDTO dto, HttpServletRequest req, HttpSession session){
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		int cnt = Integer.parseInt(req.getParameter("cnt"));
		String testpaperseq = dao.testpaperseq();
		String tpmdiv = req.getParameter("tpmdiv");
		dto.setTestpaperseq(testpaperseq);
		
		for (int i=0; i<cnt; i++) {
			dto.setSeq(req.getParameter("s" + i));			
			dao.questionadd(dto);
		}
		
		return "admin/exam/testpaperaddok";
		
	}
	
	
	// 시험그룹 리스트 페이지 
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/testpaperlist.action")
	public String testpaperlist(HttpServletRequest req,TestPaperDTO dto, HttpSession session){
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		// ******** 페이징 처리
		int totalCount = 0;
		int totalPage = 0;
		int pageSize = 10;
		int no = 0, loop = 0;
		int nowPage = 0;
		int blockSize = 10;
		String pageBar = "";

		if (req.getParameter("page") == null)
			nowPage = 1;
		else
			nowPage = Integer.parseInt(req.getParameter("page"));

		int start = ((nowPage - 1) * pageSize) + 1;
		int end = start + pageSize - 1;

		dto.setStart(start);
		dto.setEnd(end);
		// 총 게시물 수(alltest)
		totalCount = dao.getTotal();
		totalPage = (int) Math.ceil(totalCount / (double) pageSize);

		// 페이징 끝

		// 검색X

		List<String> tpmlistseq = new ArrayList<String>();

		tpmlistseq = dao.tpmseq();

		String tpmSeq = "";
		List<TestPaperDTO> tpmlist = new ArrayList<TestPaperDTO>();

		for (int i = 0; i < tpmlistseq.size(); i++) {
			// 조건문 없는 seq 리스트 출력
			// 시험문제수, 응시, 조회수

			// hashmap? 도 포함? 
			tpmSeq = tpmlistseq.get(i);
			dto = dao.allestcnt(tpmSeq);
			if (dto != null) {
				tpmlist.add(dto);
			}
		}

		for (int i = 0; i < tpmlist.size(); i++) {

			dto = tpmlist.get(i);

			// 제목 10자 이내 처리
			String tempSubject = dto.getTpmSubject();

			if (tempSubject.length() > 25) {
				tempSubject = tempSubject.substring(0, 25) + "...";
				dto.setTpmSubject(tempSubject);
			}

		}
		
		//페이지바 생성
				loop = 1;
				no = ((nowPage - 1)/blockSize) * blockSize + 1;
				
				pageBar += "<ul class='pagination pagination-sm'>";
		// 이전 10개 페이지
		if (no != 1)
			pageBar += String
					.format("<li><a href='/exam/admin/testpaperlist.action?page=%d'>«</a></li>",
							no - 1);
		else
			pageBar += "<li><a href='#'>«</a></li>";

		// 페이지
		while (loop <= blockSize && no <= totalPage) {
			if (no == nowPage)
				pageBar += String
						.format("<li class='active'><a href='/exam/admin/testpaperlist.action.action?page=%d'>%d</a></li>",
								no, no);
			else
				pageBar += String
						.format("<li><a href='/exam/admin/testpaperlist.action?page=%d'>%d</a></li>",
								no, no);
			loop++;
			no++;
		}

		// 다음 10페이지
		if (no <= totalPage)
			pageBar += String
					.format("<li><a href='/exam/admin/testpaperlist.action?page=%d'>»</a></li>",
							no);
		else
			pageBar += "<li><a href='#'>»</a></li>";

		pageBar += "</ul>";
		// 페이지바 생성 끝
	
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("pageBar", pageBar);

		req.setAttribute("tpmlist", tpmlist);
		return "admin/exam/testpaperlist";
	}
	
	// 문제지 수정정보 보내기
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/testpaperedit.action")
	public String testpaperEdit(HttpServletRequest req,TestPaperDTO dto,TestPaperDTO dto1,QuestionDTO dto2, HttpSession session){
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		List<TestPaperDTO> tpbdivlist = dao.TestPaperCategoryTpb(dto1);
		
		String tpmSeq = req.getParameter("seq");
		String tpmSubject = req.getParameter("tpmSubject");
		dto = dao.tpmedit(tpmSeq);
		
		// 선택된문제
		List<QuestionDTO> tpbdivlist1 = dao.questioneditlist(tpmSeq);
		// 전체문제
		List<QuestionDTO> tpbdivlist2 = dao.questioneditlist1(tpmSubject);
		
		
		req.setAttribute("tpmSeq", tpmSeq);
		req.setAttribute("tpbdivlist", tpbdivlist);
		req.setAttribute("tpbdivlist1", tpbdivlist1);
		req.setAttribute("tpbdivlist2", tpbdivlist2);
		req.setAttribute("dto", dto);
		return "admin/exam/testpaperedit"; 
	}
	
	// 문제지 문제수정
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/testpaperquestioneditok.action")
	public String testpaperEdit(HttpServletRequest req,QuestionDTO dto, HttpSession session){
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		int cnt = Integer.parseInt(req.getParameter("cnt"));
		
		String testpaperseq = dao.testpaperseq();
		String tpmSeq = req.getParameter("tpmSeq");
		
		dao.testpaperdel(tpmSeq);
		dao.tpmDel(tpmSeq);
		
		String tpmdiv = req.getParameter("tpmdiv");
		dto.setTestpaperseq(testpaperseq);
		
		for (int i=0; i<cnt; i++) {
			dto.setSeq(req.getParameter("s" + i));			
			dao.questionadd(dto);
		}		
		
		return "admin/exam/testpapereditok";
	}
	
	// 삭제하기
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/testpaperdel.action")
	public String testpaperDel(HttpServletRequest req,TestPaperDTO dto, HttpSession session){
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		String tpmSeq = req.getParameter("seq");
		dao.testpaperdel(tpmSeq);	
		
		return "admin/exam/testpaperdelok"; 
	}
	
}

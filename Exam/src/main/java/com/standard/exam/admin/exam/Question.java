package com.standard.exam.admin.exam;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//관리자 시험 컨트롤러
@Controller("question")
public class Question {
	
	@Autowired
	QuestionDAO dao;
	
	//시험문제 만들기 페이지
	@RequestMapping(method={RequestMethod.GET}, value="/admin/question.action")
	public String add(HttpServletRequest req, TestPaperDTO dto, HttpSession session) {
		
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		List<TestPaperDTO> tpblist = dao.getTpbList();
		
		req.setAttribute("tpblist", tpblist);
		
		return "admin/exam/question";
	}
	
	//시험 중분류 불러오기
	@RequestMapping(method={RequestMethod.GET}, value="/admin/questiontpm.action")
	public String getTpmDiv(HttpServletRequest req, TestPaperDTO dto, HttpSession session) {
		
		String tpbdiv = req.getParameter("tpbdivseq");
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		List<TestPaperDTO> tpmlist = dao.getTpmList(tpbdiv);
		
		req.setAttribute("tpmlist", tpmlist);
		
		return "admin/exam/questiontpm";
	}
	
	//시험 소분류 불러오기
	@RequestMapping(method={RequestMethod.GET}, value="/admin/questiontps.action")
	public String getTpsDiv(HttpServletRequest req, TestPaperDTO dto, HttpSession session) {
		
		String tpmdiv = req.getParameter("tpmdivseq");
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		List<TestPaperDTO> tpslist = dao.getTpsList(tpmdiv);
		
		
		for (int i=0; i<tpslist.size(); i++) {
			dto = tpslist.get(i);
			
			
		}
		
		req.setAttribute("tpslist", tpslist);
		
		return "admin/exam/questiontps";
	}
	
	
	//시험문제 삽입
	@RequestMapping(method={RequestMethod.POST}, value="/admin/questionok.action")
	public String addok(QuestionDTO dto, HttpServletRequest req, HttpSession session) {
		
		//데이터 가져오기
		String questionCode = req.getParameter("questionCode");
		String score = req.getParameter("score");
		String description = req.getParameter("description");
		String question = req.getParameter("question");
		String question1 = req.getParameter("question1");
		String question2 = req.getParameter("question2");
		String question3 = req.getParameter("question3");
		String question4 = req.getParameter("question4");
		String answer = req.getParameter("answer");
		String explanation = req.getParameter("explanation");
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		//dto에 값 넣기
		dto.setQuestionCode(questionCode);
		dto.setScore(score);
		dto.setDescription(description);
		dto.setQuestion(question);
		dto.setQuestion1(question1);
		dto.setQuestion2(question2);
		dto.setQuestion3(question3);
		dto.setQuestion4(question4);
		dto.setAnswer(answer);
		dto.setExplanation(explanation);
		
		//문제 삽입
		dao.add(dto);
		
		
		return "admin/exam/questionok";
	}

	
	//시험문제 목록
	@RequestMapping(method={RequestMethod.GET}, value="/admin/questionlist.action")
	public String list(HttpServletRequest req, QuestionDTO dto, HttpSession session) {
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		//페이징 ***************
		
		//초기화
		int totalCount = 0;
		int totalPage = 0;
		int pageSize = 10;
		int no = 0, loop = 0;
		int nowPage = 0;
		int blockSize = 10;
		String pageBar = "";
		
		//페이지 호출
		if (req.getParameter("page") == null)
			nowPage = 1;
		else
			nowPage = Integer.parseInt(req.getParameter("page"));
		
		//HashMap 담기
		int start = ((nowPage -1) * pageSize) + 1;
		int end = start + pageSize - 1;
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("start", start+"");
		map.put("end", end+"");
		
		//올림처리
		totalCount = dao.getTotal();
		totalPage = (int)Math.ceil(totalCount / (double)pageSize);
		
		loop = 1;
		no = ((nowPage - 1) / blockSize) * blockSize + 1;
		
		pageBar += "<div> ";
		
		//이전 5페이지
		if (no != 1)
			pageBar += String.format(" <a href='/exam/admin/questionlist.action?page=%d' style='cursor:pointer'>«</a> ", no-1);
		else
			pageBar += " <a href='#' style='cursor:pointer'>«</a> ";
		
		//페이지번호
		while (!(loop > blockSize || no > totalPage)) {
			
			/*if(no == nowPage)
				pageBar += String.format("<a href='/exam/admin/list.action?page=%d'>%d</a>", no, no);
			else*/
				pageBar += String.format(" <a href='/exam/admin/questionlist.action?page=%d' style='cursor:pointer'>%d</a> ", no, no);
			
			loop++;
			no++;
		}
		
		//다음 5페이지
		if(no <= totalPage)
			pageBar += String.format(" <a href='/exam/admin/questionlist.action?page=%d' style='cursor:pointer'>»</a> ", no);
		else
			pageBar += " <a href='#' style='cursor:pointer'>»</a> ";
		
		
		
		//페이징 끝 ***************
		
		
		
		//검색**************************
		
		//검색 초기화
		boolean isSearch = false;
		String searchWord = req.getParameter("searchWord");
		String searchLabel = "";
		
		//검색중인지 검사
		if (searchWord != null) {
			isSearch = true;
			map.put("searchWord", searchWord);
		} else {
			searchWord = "";
			map.put("searchWord", searchWord);
		}
		
		
		//검색끝**************************
		
		
		//게시글 불러오기
		List<QuestionDTO> list = null;
		
		if (!isSearch)
			list = dao.list(map);	//검색어 없는 목록
		else
			list = dao.searchList(map);	//검색어 있는 목록
		
		
		//추가기능***************
		for (int i=0; i<list.size(); i++) {
			dto = list.get(i);
			
			if(isSearch)
				dto.setQuestionCode(dto.getQuestionCode().replace(searchWord, "<span style='color:#EC0C00; font-weight:bold;'>"+searchWord+"</span>"));
			
		}
		
		//추가기능 끝***************
		
		
		//데이터 넘기기
		req.setAttribute("pageBar", pageBar);
		req.setAttribute("list", list);
		req.setAttribute("isSearch", isSearch);
		req.setAttribute("searchWord", searchWord);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("nowPage", nowPage);
		
		
		
		return "admin/exam/questionlist";
	}
	
	
	//글 수정페이지
	@RequestMapping(method={RequestMethod.GET}, value="/admin/questionedit.action")
	public String edit(HttpServletRequest req, QuestionDTO dto, HttpSession session) {

		//데이터 가져오기
		String seq = req.getParameter("seq");
		String questionCode = req.getParameter("questionCode");
		String score = req.getParameter("score");
		String description = req.getParameter("description");
		String question = req.getParameter("question");
		String question1 = req.getParameter("question1");
		String question2 = req.getParameter("question2");
		String question3 = req.getParameter("question3");
		String question4 = req.getParameter("question4");
		String answer = req.getParameter("answer");
		String explanation = req.getParameter("explanation");
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		System.out.println("answer: ("+ answer+ ")");
		
		req.setAttribute("seq", seq);
		req.setAttribute("questionCode", questionCode);
		req.setAttribute("score", score);
		req.setAttribute("description", description);
		req.setAttribute("question", question);
		req.setAttribute("question1", question1);
		req.setAttribute("question2", question2);
		req.setAttribute("question3", question3);
		req.setAttribute("question4", question4);
		req.setAttribute("answer", answer);
		req.setAttribute("explanation", explanation);
		
		return "admin/exam/questionedit";
	}
	
	//글 수정하기
	@RequestMapping(method={RequestMethod.POST}, value="/admin/questioneditok.action")
	public String editok(HttpServletRequest req, QuestionDTO dto, HttpSession session) {
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		//데이터 가져오기
		String seq = req.getParameter("seq");
		String questionCode = req.getParameter("questionCode");
		String score = req.getParameter("score");
		String description = req.getParameter("description");
		String question = req.getParameter("question");
		String question1 = req.getParameter("question1");
		String question2 = req.getParameter("question2");
		String question3 = req.getParameter("question3");
		String question4 = req.getParameter("question4");
		String answer = req.getParameter("answer");
		String explanation = req.getParameter("explanation");
		
		
		//dto에 값 넣기
		dto.setSeq(seq);
		dto.setQuestionCode(questionCode);
		dto.setScore(score);
		dto.setDescription(description);
		dto.setQuestion(question);
		dto.setQuestion1(question1);
		dto.setQuestion2(question2);
		dto.setQuestion3(question3);
		dto.setQuestion4(question4);
		dto.setAnswer(answer);
		dto.setExplanation(explanation);
		
		dao.edit(dto);
		
		return "admin/exam/questioneditok";
	}
	
	
	//문제 삭제
	@RequestMapping(method={RequestMethod.GET}, value="/admin/questiondel.action")
	public String del(HttpServletRequest req, HttpSession session) {
		
		String seq = req.getParameter("seq");
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		dao.del(seq);
		
		return "admin/exam/questiondel";
	}
}

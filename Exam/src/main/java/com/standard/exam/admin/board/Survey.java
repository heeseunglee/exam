package com.standard.exam.admin.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("survey")
public class Survey {
	
	@Autowired
	SurveyDAO dao;
	
	//설문조사 삽입페이지
	@RequestMapping(method={RequestMethod.GET}, value="/admin/surveyadd.action")
	public String add(HttpServletRequest req, HttpSession session) {
		
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		} 
		
		return "admin/board/surveyadd";
	}
	
	//설문조사 삽입
	@RequestMapping(method={RequestMethod.POST}, value="/admin/surveyaddok.action")
	public String addok(HttpServletRequest req, SurveyDTO dto, HttpSession session) {
		
		String userId = (String)session.getAttribute("userId");

		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		String subject = req.getParameter("subject");
		String count = req.getParameter("count");
		
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		dto.setStartDate(startDate);
		dto.setEndDate(endDate);
		dto.setSubject(subject);
		
		//설문조사 삽입
		dao.add(dto);
		//방금 만든 설문조사 seq 가져오기
		String surveySeq = dao.getSeq();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		for (int i=0; i<Integer.parseInt(count); i++) {
			
			map.put("content", req.getParameter("content"+i));
			map.put("surveySeq", surveySeq);
			
			System.out.println("content"+i+" : " + req.getParameter("content"+i));
			//설문조사내용 삽입
			dao.addContent(map);
			
		}
		
		
		return "admin/board/surveyaddok";
	
	}
	
	
	//설문조사 목록 가져오기
	@RequestMapping(method={RequestMethod.GET}, value="/admin/surveylist.action")
	public String list(HttpServletRequest req, SurveyDTO dto, HttpSession session) {
		
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
			
		//설문조사 제목리스트 불러오기
		List<SurveyDTO> subjectList = dao.subjectList();
		for (int i=0; i<subjectList.size(); i++) {
			
			dto = subjectList.get(i);
			
			dto.setStartDate(dto.getStartDate().substring(0, 10));
			dto.setEndDate(dto.getEndDate().substring(0, 10));
		}
		
		//설문조사 내용 리스트
		List<SurveyDTO> contentList = dao.contentList();
		
		req.setAttribute("subjectList", subjectList);
		req.setAttribute("contentList", contentList);
		
		
		return "admin/board/surveylist";
	
	}
	
	
	//설문조사 수정하기
	@RequestMapping(method={RequestMethod.GET}, value="/admin/surveyedit.action")
	public String edit(HttpServletRequest req, SurveyDTO dto, HttpSession session) {

		String seq = req.getParameter("seq");
		
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		//설문조사제목 가져오기
		SurveyDTO subjectSurvey = dao.getSubjectList(seq);
		subjectSurvey.setStartDate(subjectSurvey.getStartDate().substring(0,10));
		subjectSurvey.setEndDate(subjectSurvey.getEndDate().substring(0,10));
		
		//설문조사내용 가져오기
		List<SurveyDTO> surveyContentList = dao.getSurveyContentList(seq);
		
		int count = dao.getCount(seq);
		
		System.out.println(count);
		
		req.setAttribute("count", (count-1)+"");
		req.setAttribute("subjectSurvey", subjectSurvey);
		req.setAttribute("surveyContentList", surveyContentList);
		
		return "admin/board/surveyedit";
		
		
	}
	
	
	//설문조사 수정
	@RequestMapping(method={RequestMethod.POST}, value="/admin/surveyeditok.action")
	public String editok(HttpServletRequest req, SurveyDTO dto, HttpSession session) {

		String seq = req.getParameter("seq");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		String subject = req.getParameter("subject");
		String count = req.getParameter("count");
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}		
		
		dto.setSeq(seq);
		dto.setStartDate(startDate);
		dto.setEndDate(endDate);
		dto.setSubject(subject);
		
		//설문조사 삽입
		dao.edit(dto);
		//방금 만든 설문조사 seq 가져오기
		
		List<String> contentSeq = dao.getContentSeq(seq);
		
		System.out.println("contentSeq : " + contentSeq.size());
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		for (int i=0; i<contentSeq.size(); i++) {
			String surveyContentSeq = contentSeq.get(i);
			
			
			map.put("content", req.getParameter("content"+i));
			map.put("surveyContentSeq", surveyContentSeq);
			
			System.out.println("content : " + map.get("content"));
			System.out.println("surveySeq : " + map.get("surveyContentSeq"));
			
			dao.contentEdit(map);
			
		}
		
		
		return "admin/board/surveyeditok";
	
	}
	
	//설문조사삭제하기
	@RequestMapping(method={RequestMethod.GET}, value="/admin/surveydel.action")
	public String del(HttpServletRequest req, HttpSession session) {

		String seq = req.getParameter("seq");
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}		
		
		//설문조사내용 삭제
		dao.contentDel(seq);
		
		//설문조사제목삭제
		dao.subjectDel(seq);
		
		return "admin/board/surveydel";
	
	}
	
	//메인등록
	@RequestMapping(method={RequestMethod.GET}, value="/admin/surveymain.action")
	public String main(HttpServletRequest req, SurveyDTO dto, HttpSession session) {

		String seq = req.getParameter("seq");
		
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		dao.clearMain();
		
		dao.updateMain(seq);
		
		return "admin/board/surveymain";
	
	}
	
	
}

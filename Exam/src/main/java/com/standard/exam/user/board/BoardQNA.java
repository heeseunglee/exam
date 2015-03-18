package com.standard.exam.user.board;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("BoardQNA")
public class BoardQNA {
	
	@Autowired
	public BoardQNADAO dao;
	
	
	
	@RequestMapping(method={RequestMethod.GET}, value="/community/qna/list.action")
	public String list(HttpServletRequest req, Paging paging, HttpSession session) {
		
		String page = req.getParameter("page");
		HashMap<String,Integer> map = paging.getPageIndex(page); //페이지 시작 번호, 끝번호 요청
		//System.out.println(map);
		
		JSONArray JsonList = dao.list(map);	// 해당 페이지 글목록 요청
		
		int totalCount = dao.getTotalCount();	//게시글 총수 요청
		String pageBar = paging.getPageBar(page, totalCount);	// 페이지바 생성
		//System.out.println(pageBar);
		
		req.setAttribute("JsonList", JsonList);
		req.setAttribute("pageBar", pageBar);
		
		return "/user/board/BoardQNA";
	}
	
	
	
	@RequestMapping(method={RequestMethod.GET}, value="/community/qna/view.action")
	public String view(HttpServletRequest req, HttpSession session) {
		
		String seq = req.getParameter("seq");
		JSONObject obj = dao.view(seq);	// 게시글 상세 내용 요청
		
		req.setAttribute("view", obj);
		
		return "/user/board/BoardQNA_view";
	}
	
	
	@RequestMapping(method={RequestMethod.GET}, value="/community/qna/add.action")
	public String add(HttpServletRequest req, HttpSession session) {
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 
		return "/user/board/BoardQNA_add";
	}
	
	
	@RequestMapping(method={RequestMethod.POST}, value="/community/qna/addok.action")
	public String addOk(HttpServletRequest req, HttpSession session) {
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 
		String subject = req.getParameter("inSubject");
		String content = req.getParameter("inContent");
		String secret = req.getParameter("inSecret");
		String userSeq = (String)session.getAttribute("userSeq");
		
		System.out.println(secret);
		
		if ( secret == null ) secret = "n";
		else if ( secret.equals("on") ) secret = "y";
		
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("userSeq", userSeq);
		map.put("subject", subject);
		map.put("content", content);
		map.put("secret", secret);
		
		dao.addQna(map);
		
		return "/user/board/BoardQNA_addok";
	}
	
	
	@RequestMapping(method={RequestMethod.GET}, value="/center/faq.action")
	public String faqList(HttpServletRequest req, Paging paging) {
		
		String page = req.getParameter("page");
		HashMap<String,Integer> map = paging.getPageIndex(page); //페이지 시작 번호, 끝번호 요청
		//System.out.println(map);
		
		JSONArray JsonList = dao.faqList(map);	// 해당 페이지 글목록 요청
		
		int totalCount = dao.getTotalCount();	//게시글 총수 요청
		String pageBar = paging.getPageBar(page, totalCount);	// 페이지바 생성
		//System.out.println(pageBar);
		
		req.setAttribute("JsonList", JsonList);
		req.setAttribute("pageBar", pageBar);
		
		return "/user/center/FAQ";
	}
	
}

















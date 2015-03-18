package com.standard.exam.admin.message;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("message")
public class Message {

	@Autowired
	MessageDAO dao;

	// 쪽지 입력 페이지
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/addms.action")
	public String send(HttpServletRequest req, HttpSession session) {
		String memberId = req.getParameter("memberId");
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 
		else{

			req.setAttribute("memberId", memberId);
			return "admin/message/addms";
			
		}
	}

	// 쪽지 삽입 페이지
	@RequestMapping(method = { RequestMethod.POST }, value = "/admin/addokms.action")
	public String sendok(HttpServletRequest req, MessageDTO dto, HttpSession session) {
		// 사용자 입력 데이터 초기화
		String fromSeq = (String)session.getAttribute("userSeq");	//세션값 가져오기
		String memberId = req.getParameter("memberId");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String toSeq = "";
		
		
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 
		else{
			//toSeq 구하기
			toSeq = dao.getToSeq(memberId);
				
			dto.setSubject(subject);
			dto.setContent(content);
			dto.setToSeq(toSeq);
			dto.setFromSeq(fromSeq);
			
			
			dao.send(dto);
			return "admin/message/addokms";
		}
	}

	// 보낸쪽지함 불러오기
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/setms.action")
	public String getms(HttpServletRequest req, MessageDTO dto,
			HttpSession session) {
		
		String fromSeq = (String)session.getAttribute("userSeq");
		
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 
		else{

			List<MessageDTO> list = dao.getSetlist(fromSeq);
			for (int i=0; i<list.size(); i++) {
				dto = list.get(i);
				
				dto.setRegDate(dto.getRegDate().substring(0, 10));
				
				if (dto.getSubject().length() > 15)
					dto.setSubject(dto.getSubject().substring(0,15)+"...");
				
				dto.setRead(dto.getRead().equals("n") ? "읽지않음" : "읽음");
			}
			
			req.setAttribute("list", list);
			
			return "admin/message/setms";
			
		}
	}

	// 받은쪽지함 불러오기
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/getms.action")
	public String setms(HttpServletRequest req, MessageDTO dto,
			HttpSession session) {
		
		String toSeq = (String)session.getAttribute("userSeq");
		
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 
		else{

			List<MessageDTO> list = dao.getGetlist(toSeq);
			for (int i=0; i<list.size(); i++) {
				dto = list.get(i);
				
				dto.setRegDate(dto.getRegDate().substring(0, 10));
				
				if (dto.getSubject().length() > 15)
					dto.setSubject(dto.getSubject().substring(0,15)+"...");
				
				dto.setRead(dto.getRead().equals("n") ? "읽지않음" : "읽음");
			}
			
			req.setAttribute("list", list);
			
			
			
			return "admin/message/getms";
			
		}
	}

	
	//받은쪽지보기
	@RequestMapping(method = RequestMethod.GET, value = "/admin/viewms.action")
	public String view(HttpServletRequest req, MessageDTO dto, HttpSession session) {
		
		String seq = req.getParameter("seq");

		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 
		else{
			
			//읽음처리 + 쪽지내용가져오기
			dto = dao.getView(seq);
			
			dto.setRegDate(dto.getRegDate().substring(5, 7)+"월 "+dto.getRegDate().substring(8, 10)+"일 "+dto.getRegDate().substring(11, 13)+"시 "+dto.getRegDate().substring(14, 16)+"분");
			
			req.setAttribute("dto", dto);
			
			return "admin/message/viewms";
			
		}
		
	}
	
	//보낸쪽지보기
	@RequestMapping(method={RequestMethod.GET}, value="/admin/setviewms.action")
	public String setView(HttpServletRequest req, MessageDTO dto, HttpSession session) {
		
		String toSeq = req.getParameter("toSeq");
		String seq = req.getParameter("seq");
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 
		else{
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("toSeq", toSeq);
			map.put("seq", seq);
			
			//쪽지내용가져오기
			dto = dao.getSetView(map);
			
			dto.setRegDate(dto.getRegDate().substring(5, 7)+"월 "+dto.getRegDate().substring(8, 10)+"일 "+dto.getRegDate().substring(11, 13)+"시 "+dto.getRegDate().substring(14, 16)+"분");
			
			dto.setRead(dto.getRead().equals("n") ? "읽지않음" : "읽음");
			
			req.setAttribute("dto", dto);
			
			
			return "admin/message/setviewms";
		}
	}
	
	
	//아이디 찾기
	@RequestMapping(method={RequestMethod.GET}, value="/admin/searchid.action")
	public String searchId(HttpServletRequest req, MessageDTO dto, HttpSession session) {
		
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 
		else
			return "admin/message/searchid";
		
	}
	
	//아이디찾기 새창
	@RequestMapping(method={RequestMethod.GET}, value="/admin/searchidajax.action")
	public String searchIdAjax(HttpServletRequest req, HttpSession session) {

		String name = req.getParameter("name");
		
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 
		else{

			List<MessageDTO> userList = null;
			
			if (name!=null)
				userList = dao.getUser(name);
			
			req.setAttribute("userList", userList);
			
			return "admin/message/searchidajax";
			
		}
	}
	

}

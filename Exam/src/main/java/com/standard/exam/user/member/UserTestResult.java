package com.standard.exam.user.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller("usertestresult")
public class UserTestResult {

	@Autowired
	private UserTestResultDAO dao;
	
	@RequestMapping(method={RequestMethod.GET},value="/user/utrlist.action")
	public String TestResult(HttpServletRequest req, HttpSession session, UserTestResultDTO dto, HttpSession sessin) {
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 

		// 유저 시험목록 불러오기
		String userSeq = (String)session.getAttribute("userSeq");
		
		
		List<UserTestResultDTO> testList = new ArrayList<UserTestResultDTO>();
		testList = dao.testList(userSeq);
		
		req.setAttribute("testList", testList);
		
		return "user/member/utrlist";
	}
	
	@RequestMapping(method={RequestMethod.GET},value="/user/utrtotal.action")
	public String UsrTotal(HttpServletRequest req, HttpSession session, UserTestResultDTO dto) {
		
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 

		String userSeq = (String)session.getAttribute("userSeq");
		
		// 유저답안지 불러오기
		String tnSeq = req.getParameter("tnSeq");
		
		dto.setUserSeq(userSeq);
		dto.setTnSeq(tnSeq);
		
		List<UserTestResultDTO> userAnswerlist = new ArrayList<UserTestResultDTO>();
		userAnswerlist = dao.userAnswer(dto);
		
		
		
		req.setAttribute("userAnswerlist", userAnswerlist);
		
		
		return "user/member/utrlistok";
		
	}
	
	
}

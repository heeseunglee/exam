package com.standard.exam.admin.payment;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("account")
public class Account {
	
	@Autowired
	AccountDAO dao;
	
	//리스트+삽입
	@RequestMapping(method={RequestMethod.GET}, value="/admin/accountlist.action")
	public String list(HttpServletRequest req, AccountDTO dto, HttpSession session) {
		
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		List<AccountDTO> list = dao.list();
		
		req.setAttribute("list", list);
		
		return "admin/payment/accountlist";
	}
	
	//삽입+리스트출력
	@RequestMapping(method={RequestMethod.POST}, value="/admin/accountadd.action")
	public String add(HttpServletRequest req, AccountDTO dto, HttpSession session) {
		
		String bankName = req.getParameter("bankName");
		String bankNumber = req.getParameter("bankNumber");
		String bankRep = req.getParameter("bankRep");
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		dto.setBankName(bankName);
		dto.setBankNumber(bankNumber);
		dto.setBankRep(bankRep);
		
		
		dao.add(dto);
		
		String seq = dao.getSeq();
		
		int count = dao.count();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("seq", seq);
		map.put("count", count+"");
		
		req.setAttribute("map", map);
		
		return "admin/payment/accountadd";
	}
	
	//삭제
	@RequestMapping(method={RequestMethod.GET}, value="/admin/accountdel.action")
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
		
		int count = dao.count();
		
		req.setAttribute("count", count);
		
		return "admin/payment/accountdel";
	}
	
	
}

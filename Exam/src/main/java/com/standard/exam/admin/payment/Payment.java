package com.standard.exam.admin.payment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("payment")
public class Payment {
	
	@Autowired
	PaymentDAO dao;
	
	//사용자 결제신청
	@RequestMapping(method={RequestMethod.GET}, value="/user/requestpayment.action")
	public String requestPayment(HttpSession session) {
		
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		}
		
		return "user/payment/requestpayment";
	}
	
	//결제신청완료
	@RequestMapping(method={RequestMethod.GET}, value="/user/requestpaymentok.action")
	public String requestPaymentOk(HttpServletRequest req, PaymentDTO dto, HttpSession session) {
		
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		}
		
		String paymentList = req.getParameter("paymentList");
		String payment = req.getParameter("payment");
		String member = (String)session.getAttribute("userSeq");
		
		dto.setPaymentList(paymentList);
		dto.setPayment(payment);
		dto.setMember(member);
		
		dao.addPayment(dto);
		
		return "user/payment/requestpaymentok";
	}
	
	//결제요청목록
	@RequestMapping(method={RequestMethod.GET}, value="/user/listpayment.action")
	public String listPayment(HttpServletRequest req, PaymentDTO dto, HttpSession session) {

		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		}
		
		String member = (String)session.getAttribute("userSeq");
		String seq = dao.getSeq();
		
		//입금계좌
		PaymentDTO bdto = dao.getBank(seq);
		
		//결제요청목록
		List<PaymentDTO> list = dao.getList(member);
		for (int i=0; i<list.size(); i++) {
			dto = list.get(i);
			dto.setPaymentAuth(dto.getPaymentAuth().equals("n") ? "<span style='color: red;'>요청대기</span>" : "<span style='color: green;'>결제완료</span>");
			dto.setPaymentDate(dto.getPaymentDate().substring(0, 10));
		}
		
		
		req.setAttribute("bank", bdto);
		req.setAttribute("list", list);
		
		return "user/payment/listpayment";
	}
	
	
	//관리자 결제요청목록
	@RequestMapping(method={RequestMethod.GET}, value="/admin/listpayment.action")
	public String adminPaymentList(HttpServletRequest req, PaymentDTO dto, HttpSession session) {
		
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		List<PaymentDTO> list = dao.getAdminList();
		for(int i=0; i<list.size(); i++) {
			dto = list.get(i);
			
			dto.setPaymentDate(dto.getPaymentDate().substring(0, 10));
			int payment = Integer.parseInt(dto.getPayment());
			dto.setPayment(String.format("%,d", payment));
		}
		
		
		req.setAttribute("list", list);
		
		return "admin/payment/paymentlist";
	}
	
	
	//관리자 결제승인
	@RequestMapping(method={RequestMethod.GET}, value="/admin/authpayment.action")
	public String adminAuthPayment(HttpServletRequest req, PaymentDTO dto, HttpSession session) {
		
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		String seq = req.getParameter("seq");
		
		dao.authPayment(seq);
		
		
		
		return "admin/payment/authpayment";
	}
	
	
}

package com.standard.exam.admin.exam;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("category")
public class Category {

	@Autowired
	private CategoryDAO dao;

	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/categoryadd.action")
	public String add(HttpServletRequest req, CategoryDTO dto, HttpSession session) {
		
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		List<CategoryDTO> tpbdivlist = dao.tpbdivlist(dto);
		// 시험종류(대분류) 리스트
		req.setAttribute("tpbdivlist", tpbdivlist);

		return "admin/exam/categorylist";
	}

	// 대분류 선택 체인징
	@RequestMapping(method = { RequestMethod.GET }, value = "/admin/tpbdivselok.action")
	public String tpbdivselok(HttpServletRequest req, CategoryDTO dto, HttpSession session) {

		String tpbdivadd = req.getParameter("tpbdivadd");
		String tpbdivaddseq = dao.tbpdivcheckseq(tpbdivadd);
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		List<CategoryDTO> tpmdivlist = dao.tpmdivlist(tpbdivaddseq);
		req.setAttribute("tpmdivlist", tpmdivlist);
		req.setAttribute("tpbdivadd", tpbdivadd);
		return "admin/exam/categorytpbdivaddok";
	}
	
	
	// 중분류 선택 체인징
		@RequestMapping(method = { RequestMethod.GET }, value = "/admin/tpmdivselok.action")
		public String tpmdivselok(HttpServletRequest req, CategoryDTO dto, HttpSession session) {
			
			String tpbdivadd = req.getParameter("tpbdivadd");
			String tpmdivadd = req.getParameter("tpmdivadd");
			String tpbdivseq = dao.tbpdivcheckseq(tpbdivadd);
			
			String userSeq = (String)session.getAttribute("userSeq");
			String memberState = (String)session.getAttribute("memberState");
					
			if ( userSeq == null ) {
				return "auth/backToAdminHome";
			} else if ( !memberState.equals("4") ){
				return "auth/backToAdminHome";
			}

			dto.setTpbdivseq(tpbdivseq);
			dto.setTpmdivadd(tpmdivadd);
			
			String tpmdivseq = dao.tbmdivcheckseq(dto);
			List<CategoryDTO> tpsdivlist = dao.tpsdivlist(tpmdivseq);
			req.setAttribute("tpsdivlist", tpsdivlist);
			req.setAttribute("tpmdivadd", tpmdivadd);
			return "admin/exam/categorytpmdivaddok";
		}


		
		@RequestMapping(method ={ RequestMethod.GET }, value="/admin/tpsdivaddok.action")
		public String tpsdivaddok(HttpServletRequest req, CategoryDTO dto, HttpSession session){
			
			String tpbdivadd = req.getParameter("tpbdivadd");
			String tpmdivadd = req.getParameter("tpmdivadd");
			String tpsdivadd = req.getParameter("tpsdivadd");
			
			String userSeq = (String)session.getAttribute("userSeq");
			String memberState = (String)session.getAttribute("memberState");
					
			if ( userSeq == null ) {
				return "auth/backToAdminHome";
			} else if ( !memberState.equals("4") ){
				return "auth/backToAdminHome";
			}
			
			dto.setTpbdiv(tpbdivadd);
			dto.setTpmdiv(tpmdivadd);
			dto.setTpsdiv(tpsdivadd);
			
			
			// 시험종류 등록
			dao.tpbdivadd(tpbdivadd);
			// 시험종류 seq
			String tpbdivseq = dao.tbpdivcheckseq(tpbdivadd);
			dto.setTpbdivseq(tpbdivseq);

			
			// 시험과목 등록
			dao.tpmdivadd(dto);
			// 시험과목 seq
			String tpmdivseq = dao.tbmdivcheckseq(dto);
			dto.setTpmdivseq(tpmdivseq);
			
			// 시험회차 등록 
			dao.tpsdivadd(dto);			
			return "admin/exam/categorytpsdivaddok";
			
		}

}

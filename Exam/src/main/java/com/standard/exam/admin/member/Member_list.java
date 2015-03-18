package com.standard.exam.admin.member;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("member_list")
public class Member_list {

	@Autowired
	Member_listDAO dao;

	// 회원리스트 불러오기
	@RequestMapping(method = { RequestMethod.GET }, value = { "/admin/member_list.action" })
	public String member_list(HttpServletRequest req, MemberDTO dto,
			HttpSession session) {

		
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		
		// ******** 페이징 처리

		int totalCount = 0; // 총게시물수
		int totalPage = 0; // 총 페이지수
		int pageSize = 10; // 페이지당 게시물 수
		int no = 0, loop = 0; // 필요변수
		int nowPage = 0; // 현재 페이지 번호
		int blockSize = 10; // 페이지바의 한번에 보여질 페이지 개수
		String pageBar = ""; // 페이지바에 들어갈 태그 작업

		// 1. 페이지 호출
		if (req.getParameter("page") == null)
			nowPage = 1; // 가져온페이지 없으면 1페이지
		else
			nowPage = Integer.parseInt(req.getParameter("page")); // 가져온페이지

		// 화면표시
		// nowPage=1 -> 1~10, nowPage=2 -> 11~20
		int start = ((nowPage - 1) * pageSize) + 1;
		int end = start + pageSize - 1;

		// HashMap에 start, end 담기
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);

		// 총페이지(올림처리)
		totalCount = dao.getTotal(); // 총 게시물 불러오기
		totalPage = (int) Math.ceil(totalCount / (double) pageSize); // 게시물수/페이지수
																		// 를 올림
		// ******** 페이징 처리 끝

		// ******** 검색

		boolean isSearch = false; // 검색중인지 아닌지
		String searchColum = req.getParameter("searchColum"); // 검색 컬럼
		String searchWord = req.getParameter("searchWord"); // 검색어

		if (searchColum != null && searchWord != null) {
			isSearch = true;

			// [제목]에서 [테스트]로 검색중

		}

		HashMap<String, String> search = new HashMap<String, String>();
		search.put("searchColum", searchColum);
		search.put("searchWord", searchWord);

		// ******** 검색 끝

		// 게시물 불러오기
		List<MemberDTO> list = null;

		if (!isSearch)
			list = dao.list(map); // 검색어 없는 목록
		else
			list = dao.searchList(search);

		// ********* 각각 게시물 추가 처리
		for (int i = 0; i < list.size(); i++) {

			dto = list.get(i);

			/*
			 * //최신글 표시 String tempDate = dto.getRegDate();//년월일시분초
			 * 
			 * //형변환(문자형->날짜형) SimpleDateFormat format = new
			 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 * 
			 * try {
			 * 
			 * Date regDate = format.parse(tempDate); //글쓴 시간 Calendar now =
			 * Calendar.getInstance(); //현재 시간
			 * 
			 * //틱값 long gap = now.getTime().getTime() - regDate.getTime();
			 * 
			 * if (gap / 1000 / 60 < 30)
			 * dto.setNewImg("<img src='/resources/images/new.png'/>"); else
			 * dto.setNewImg("");
			 * 
			 * } catch (Exception e) { System.out.println(e.toString()); } //최신글
			 * 표시 끝
			 */

			// 날짜 표시 변경
			String temp = dto.getEnterDate().substring(0, 10);
			dto.setEnterDate(temp);// 년월일

			// 검색어 표시하기
			if (isSearch && searchColum.equals("name")) {
				dto.setName(dto.getName().replace(
						searchWord,
						"<span style='color:red; background-color:yellow;'>"
								+ searchWord + "</span>"));
			} else if (isSearch && searchColum.equals("email")) {
				dto.setEmail(dto.getEmail().replace(
						searchWord,
						"<span style='color:red; background-color:yellow;'>"
								+ searchWord + "</span>"));
			}
		}
		// ********* 페이지바 생성
		loop = 1;
		no = ((nowPage - 1) / blockSize) * blockSize + 1;

		pageBar += "<ul class='pagination pagination-sm'>";

		// 이전 5페이지 만들기
		if (no != 1)
			pageBar += String.format(
					"<li><a href='/exam/admin/member/member_list.action?page=%d'>«</a></li>",
					no - 1);
		else
			pageBar += "<li><a href='#'>«</a></li>";

		// 페이지 번호 링크
		while (!(loop > blockSize || no > totalPage)) {

			if (no == nowPage)
				pageBar += String
						.format("<li class='active'><a href='/exam/admin/member/member_list.action?page=%d'>%d</a></li>",
								no, no);
			else
				pageBar += String.format(
						"<li><a href='/exam/admin/member/member_list.action?page=%d'>%d</a></li>",
						no, no);

			loop++;
			no++;
		}

		// 다음 5페이지
		if (no <= totalPage)
			pageBar += String.format(
					"<li><a href='/exam/admin/member/member_list.action?page=%d'>»</a></li>", no);
		else
			pageBar += "<li><a href='#'>»</a></li>";

		pageBar += "</ul>";

		// ********* 페이지바 생성 끝
		req.setAttribute("pageBar", pageBar);
		req.setAttribute("list", list);

		// JSP에게 검색중인지 아닌지
		req.setAttribute("isSearch", isSearch);
		req.setAttribute("searchColum", searchColum);
		req.setAttribute("searchWord", searchWord);

		// 페이지수 넘기기
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("nowPage", nowPage);

		return "admin/member/member_list";
	}

	
	@RequestMapping(method = { RequestMethod.GET }, value = { "/admin/unregister_list.action" })
	public String unregister_list(HttpServletRequest req, MemberDTO dto,
			HttpSession session) {

		
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		
		// ******** 페이징 처리

		int totalCount = 0; // 총게시물수
		int totalPage = 0; // 총 페이지수
		int pageSize = 10; // 페이지당 게시물 수
		int no = 0, loop = 0; // 필요변수
		int nowPage = 0; // 현재 페이지 번호
		int blockSize = 10; // 페이지바의 한번에 보여질 페이지 개수
		String pageBar = ""; // 페이지바에 들어갈 태그 작업

		// 1. 페이지 호출
		if (req.getParameter("page") == null)
			nowPage = 1; // 가져온페이지 없으면 1페이지
		else
			nowPage = Integer.parseInt(req.getParameter("page")); // 가져온페이지

		// 화면표시
		// nowPage=1 -> 1~10, nowPage=2 -> 11~20
		int start = ((nowPage - 1) * pageSize) + 1;
		int end = start + pageSize - 1;

		// HashMap에 start, end 담기
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);

		// 총페이지(올림처리)
		totalCount = dao.getUnregisterTotal(); // 총 게시물 불러오기
		totalPage = (int) Math.ceil(totalCount / (double) pageSize); // 게시물수/페이지수
																		// 를 올림
		// ******** 페이징 처리 끝

		// ******** 검색

		boolean isSearch = false; // 검색중인지 아닌지
		String searchColum = req.getParameter("searchColum"); // 검색 컬럼
		String searchWord = req.getParameter("searchWord"); // 검색어

		if (searchColum != null && searchWord != null) {
			isSearch = true;

			// [제목]에서 [테스트]로 검색중

		}

		HashMap<String, String> search = new HashMap<String, String>();
		search.put("searchColum", searchColum);
		search.put("searchWord", searchWord);

		// ******** 검색 끝

		// 게시물 불러오기
		List<MemberDTO> list = null;

		if (!isSearch)
			list = dao.unregisterlist(map); // 검색어 없는 목록
		else
			list = dao.searchUnregisterList(search);

		// ********* 각각 게시물 추가 처리
		for (int i = 0; i < list.size(); i++) {

			dto = list.get(i);

			/*
			 * //최신글 표시 String tempDate = dto.getRegDate();//년월일시분초
			 * 
			 * //형변환(문자형->날짜형) SimpleDateFormat format = new
			 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 * 
			 * try {
			 * 
			 * Date regDate = format.parse(tempDate); //글쓴 시간 Calendar now =
			 * Calendar.getInstance(); //현재 시간
			 * 
			 * //틱값 long gap = now.getTime().getTime() - regDate.getTime();
			 * 
			 * if (gap / 1000 / 60 < 30)
			 * dto.setNewImg("<img src='/resources/images/new.png'/>"); else
			 * dto.setNewImg("");
			 * 
			 * } catch (Exception e) { System.out.println(e.toString()); } //최신글
			 * 표시 끝
			 */

			// 날짜 표시 변경
			String temp = dto.getEnterDate().substring(0, 10);
			dto.setEnterDate(temp);// 년월일

			// 검색어 표시하기
			if (isSearch && searchColum.equals("name")) {
				dto.setName(dto.getName().replace(
						searchWord,
						"<span style='color:red; background-color:yellow;'>"
								+ searchWord + "</span>"));
			} else if (isSearch && searchColum.equals("email")) {
				dto.setEmail(dto.getEmail().replace(
						searchWord,
						"<span style='color:red; background-color:yellow;'>"
								+ searchWord + "</span>"));
			}
		}
		// ********* 페이지바 생성
		loop = 1;
		no = ((nowPage - 1) / blockSize) * blockSize + 1;

		pageBar += "<ul class='pagination pagination-sm'>";

		// 이전 5페이지 만들기
		if (no != 1)
			pageBar += String.format(
					"<li><a href='/exam/admin/unregister_list.action?page=%d'>«</a></li>",
					no - 1);
		else
			pageBar += "<li><a href='#'>«</a></li>";

		// 페이지 번호 링크
		while (!(loop > blockSize || no > totalPage)) {

			if (no == nowPage)
				pageBar += String
						.format("<li class='active'><a href='/exam/admin/unregister_list.action?page=%d'>%d</a></li>",
								no, no);
			else
				pageBar += String.format(
						"<li><a href='/exam/admin/unregister_list.action?page=%d'>%d</a></li>",
						no, no);

			loop++;
			no++;
		}

		// 다음 5페이지
		if (no <= totalPage)
			pageBar += String.format(
					"<li><a href='/exam/admin/unregister_list.action?page=%d'>»</a></li>", no);
		else
			pageBar += "<li><a href='#'>»</a></li>";

		pageBar += "</ul>";

		// ********* 페이지바 생성 끝
		req.setAttribute("pageBar", pageBar);
		req.setAttribute("list", list);

		// JSP에게 검색중인지 아닌지
		req.setAttribute("isSearch", isSearch);
		req.setAttribute("searchColum", searchColum);
		req.setAttribute("searchWord", searchWord);

		// 페이지수 넘기기
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("nowPage", nowPage);

		return "admin/member/unregister_list";
	}
	
	
	
	@RequestMapping(method = { RequestMethod.GET }, value = { "/admin/membership_list.action" })
	public String membership_list(HttpServletRequest req, MemberDTO dto,
			HttpSession session) {

		
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		
		// ******** 페이징 처리

		int totalCount = 0; // 총게시물수
		int totalPage = 0; // 총 페이지수
		int pageSize = 10; // 페이지당 게시물 수
		int no = 0, loop = 0; // 필요변수
		int nowPage = 0; // 현재 페이지 번호
		int blockSize = 10; // 페이지바의 한번에 보여질 페이지 개수
		String pageBar = ""; // 페이지바에 들어갈 태그 작업

		// 1. 페이지 호출
		if (req.getParameter("page") == null)
			nowPage = 1; // 가져온페이지 없으면 1페이지
		else
			nowPage = Integer.parseInt(req.getParameter("page")); // 가져온페이지

		// 화면표시
		// nowPage=1 -> 1~10, nowPage=2 -> 11~20
		int start = ((nowPage - 1) * pageSize) + 1;
		int end = start + pageSize - 1;

		// HashMap에 start, end 담기
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);

		// 총페이지(올림처리)
		totalCount = dao.getMembershipTotal(); // 총 게시물 불러오기
		totalPage = (int) Math.ceil(totalCount / (double) pageSize); // 게시물수/페이지수
																		// 를 올림
		// ******** 페이징 처리 끝

		// ******** 검색

		boolean isSearch = false; // 검색중인지 아닌지
		String searchColum = req.getParameter("searchColum"); // 검색 컬럼
		String searchWord = req.getParameter("searchWord"); // 검색어

		if (searchColum != null && searchWord != null) {
			isSearch = true;

			// [제목]에서 [테스트]로 검색중

		}

		HashMap<String, String> search = new HashMap<String, String>();
		search.put("searchColum", searchColum);
		search.put("searchWord", searchWord);

		// ******** 검색 끝

		// 게시물 불러오기
		List<MemberDTO> list = null;

		if (!isSearch)
			list = dao.Membershiplist(map); // 검색어 없는 목록
		else
			list = dao.searchMembershipList(search);

		// ********* 각각 게시물 추가 처리
		for (int i = 0; i < list.size(); i++) {

			dto = list.get(i);

			/*
			 * //최신글 표시 String tempDate = dto.getRegDate();//년월일시분초
			 * 
			 * //형변환(문자형->날짜형) SimpleDateFormat format = new
			 * SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			 * 
			 * try {
			 * 
			 * Date regDate = format.parse(tempDate); //글쓴 시간 Calendar now =
			 * Calendar.getInstance(); //현재 시간
			 * 
			 * //틱값 long gap = now.getTime().getTime() - regDate.getTime();
			 * 
			 * if (gap / 1000 / 60 < 30)
			 * dto.setNewImg("<img src='/resources/images/new.png'/>"); else
			 * dto.setNewImg("");
			 * 
			 * } catch (Exception e) { System.out.println(e.toString()); } //최신글
			 * 표시 끝
			 */

			// 날짜 표시 변경
			String temp = dto.getEnterDate().substring(0, 10);
			dto.setEnterDate(temp);// 년월일

			// 검색어 표시하기
			if (isSearch && searchColum.equals("name")) {
				dto.setName(dto.getName().replace(
						searchWord,
						"<span style='color:red; background-color:yellow;'>"
								+ searchWord + "</span>"));
			} else if (isSearch && searchColum.equals("email")) {
				dto.setEmail(dto.getEmail().replace(
						searchWord,
						"<span style='color:red; background-color:yellow;'>"
								+ searchWord + "</span>"));
			}
		}
		// ********* 페이지바 생성
		loop = 1;
		no = ((nowPage - 1) / blockSize) * blockSize + 1;

		pageBar += "<ul class='pagination pagination-sm'>";

		// 이전 5페이지 만들기
		if (no != 1)
			pageBar += String.format(
					"<li><a href='/exam/admin/membership_list.action?page=%d'>«</a></li>",
					no - 1);
		else
			pageBar += "<li><a href='#'>«</a></li>";

		// 페이지 번호 링크
		while (!(loop > blockSize || no > totalPage)) {

			if (no == nowPage)
				pageBar += String
						.format("<li class='active'><a href='/exam/admin/membership_list.action?page=%d'>%d</a></li>",
								no, no);
			else
				pageBar += String.format(
						"<li><a href='/exam/admin/membership_list.action?page=%d'>%d</a></li>",
						no, no);

			loop++;
			no++;
		}

		// 다음 5페이지
		if (no <= totalPage)
			pageBar += String.format(
					"<li><a href='/exam/admin/membership_list.action?page=%d'>»</a></li>", no);
		else
			pageBar += "<li><a href='#'>»</a></li>";

		pageBar += "</ul>";

		// ********* 페이지바 생성 끝
		req.setAttribute("pageBar", pageBar);
		req.setAttribute("list", list);

		// JSP에게 검색중인지 아닌지
		req.setAttribute("isSearch", isSearch);
		req.setAttribute("searchColum", searchColum);
		req.setAttribute("searchWord", searchWord);

		// 페이지수 넘기기
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("nowPage", nowPage);

		return "admin/member/membership_list";
	}
	

	// 회원리스트 수정
	@RequestMapping(method = { RequestMethod.GET }, value = { "/admin/member_edit.action" })
	public String member_edit(HttpServletRequest req, MemberDTO dto, HttpSession session) {

		
		// 데이터 가져오기
		String seq = req.getParameter("seq");
		dto.setSeq(seq);
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		// 글내용 가져오기
		dto = dao.get(seq);
		
		// 데이터 보내기
		req.setAttribute("dto", dto);
		return "admin/member/member_edit";

	}
	
	
	// 회원리스트 수정
		@RequestMapping(method = { RequestMethod.GET }, value = { "/admin/member_reactive.action" })
		public String member_reactive(HttpServletRequest req, MemberDTO dto, HttpSession session) {

			// 데이터 가져오기
			String seq = req.getParameter("seq");
			String userSeq = (String)session.getAttribute("userSeq");
			String memberState = (String)session.getAttribute("memberState");
					
			if ( userSeq == null ) {
				return "auth/backToAdminHome";
			} else if ( !memberState.equals("4") ){
				return "auth/backToAdminHome";
			}
			
			// 글내용 가져오기
			dao.member_reactive(seq);
			
			
			return "admin/member/member_reactive";

		}
		
	

	// 수정하기
	@RequestMapping(method = { RequestMethod.POST }, value = "/admin/member_editok.action")
	public String member_editok(HttpServletRequest req, MemberDTO dto, HttpSession session) {
		System.out.println("수정하기 전달 테스트");
		String userSeq = (String)session.getAttribute("userSeq");
		String memberState = (String)session.getAttribute("memberState");
				
		if ( userSeq == null ) {
			return "auth/backToAdminHome";
		} else if ( !memberState.equals("4") ){
			return "auth/backToAdminHome";
		}
		
		// 데이터 입력
		dto.setName(req.getParameter("name"));
		dto.setUserID(req.getParameter("userID"));
		dto.setSeq(req.getParameter("seq"));
		dto.setUserPW(req.getParameter("userPW"));
		dto.setGender(req.getParameter("gender"));
		dto.setTel1(req.getParameter("tel1"));
		dto.setTel2(req.getParameter("tel2"));
		dto.setTel3(req.getParameter("tel3"));
		dto.setBirth(req.getParameter("birth"));
		dto.setAddress(req.getParameter("address"));
		dto.setEmail(req.getParameter("email"));
		dto.setUserProduce(req.getParameter("userProduce"));

		dto.setMemberShip(req.getParameter("memberShip"));
		dto.setMemberPeriodStart(req.getParameter("memberPeriodStart"));
		dto.setMemberPeriodEnd(req.getParameter("memberPeriodEnd"));
		dto.setMileagePoint(req.getParameter("mileagePoint"));

		dto.setSmsCheck(req.getParameter("smsCheck"));
		dto.setEmailCheck(req.getParameter("emailCheck"));
		dto.setMessageCheck(req.getParameter("messageCheck"));

		dto.setMemberStateDIV(req.getParameter("memberStateDIV"));

		String member = dto.getSeq();

		dto.setMember(member);

		String seq = dto.getSeq();
		
		if ( req.getParameter("memberPeriodStart") != null
				&& !req.getParameter("memberPeriodStart").equals("")
				&& req.getParameter("memberPeriodEnd") != null
				&& !req.getParameter("memberPeriodEnd").equals("")) {

			dao.msedit(dto);
		} else if (req.getParameter("memberPeriodStart") == null
				&& req.getParameter("memberPeriodStart").equals("")
				&& req.getParameter("memberPeriodEnd") == null
				&& req.getParameter("memberPeriodEnd").equals("")) {

			dto.setMemberPeriodStart("default");
			dto.setMemberPeriodEnd("default");
			dao.msedit(dto);
		}

		System.out.println("seq:" + dto.getSeq());
		System.out.println("멤버십:" + dto.getMemberShip());
		System.out.println("멤버시작기간:" + dto.getMemberPeriodStart());
		System.out.println("멤버기한:" + dto.getMemberPeriodEnd());
		System.out.println("마일리지:" + dto.getMileagePoint());
		System.out.println("member: " + dto.getMember());
		System.out.println("멤버상태1:" + dto.getMemberStateDIV());

		dao.edit(dto);
				
		// memberState 테이블 update
		dao.mbsedit(dto);
		
		req.setAttribute("seq", seq);
	
		return "admin/member/member_editok";
	}

	//

}

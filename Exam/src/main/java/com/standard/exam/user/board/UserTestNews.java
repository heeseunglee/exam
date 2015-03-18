package com.standard.exam.user.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller("UserTestNews")
public class UserTestNews {
	
	@Autowired
	private UserTestNewsDAO dao;
	
	// 게시물 리스트
		@RequestMapping(method={RequestMethod.GET},value="/user/usertestnewslist.action")
		private String list(HttpServletRequest req, UserTestNewsDTO dto, HttpSession session){

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
				nowPage = 1;
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
			String searchColumn = req.getParameter("searchColumn"); // 검색 컬럼
			String searchWord = req.getParameter("searchWord"); // 검색어

			// null 처리
			if (searchColumn != null && searchWord != null) {
				isSearch = true;
			}
			
			HashMap<String, String> search = new HashMap<String, String>();
			search.put("searchColumn", searchColumn);
			search.put("searchWord", searchWord);
			search.put("start", start+"");
			search.put("end", end+"");
			
			
			// ******** 검색 끝

			// 조회수 증가처리
			session.setAttribute("read", "n");

			// 게시물 불러오기
			List<UserTestNewsDTO> list = null;

			if (!isSearch)
				list = dao.list(map); // 검색어 없는 목록
			else
				list = dao.searchList(search);

			// ********* 각각 게시물 추가 처리
			for (int i = 0; i < list.size(); i++) {

				dto = list.get(i);

		
				// 날짜 표시 변경
				String temp = dto.getRegdate().substring(0, 10);
				dto.setRegdate(temp);// 년월일

				// 제목 10자 이내 처리
				String tempSubject = dto.getSubject();

				if (tempSubject.length() > 10) {
					tempSubject = tempSubject.substring(0, 10) + "...";
					dto.setSubject(tempSubject);
				}

				// 검색어 표시하기
				if (isSearch && searchColumn.equals("subject")){
					dto.setSubject(dto.getSubject().replace(
							searchWord,
							"<span style='color:red; background-color:yellow;'>"
									+ searchWord + "</span>"));}
				else if (isSearch && searchColumn.equals("content")){
					dto.setSubject(dto.getContent().replace(
							searchWord,
							"<span style='color:red; background-color:yellow;'>"
									+ searchWord + "</span>"));}
			}
			// ********* 페이지바 생성
			loop = 1;
			no = ((nowPage - 1) / blockSize) * blockSize + 1;

			pageBar += "<ul class='pagination pagination-sm'>";

			// 이전 5페이지 만들기
			if (no != 1)
				pageBar += String.format(
						"<li><a href='/exam/user/usertestnewslist.action?page=%d'>«</a></li>",
						no - 1);
			else
				pageBar += "<li><a href='#'>«</a></li>";

			// 페이지 번호 링크
			while (!(loop > blockSize || no > totalPage)) {

				if (no == nowPage)
					pageBar += String
							.format("<li class='active'><a href='/exam/user/usertestnewslist.action?page=%d'>%d</a></li>",
									no, no);
				else
					pageBar += String.format(
							"<li><a href='/exam/user/usertestnewslist.action?page=%d'>%d</a></li>",
							no, no);

				loop++;
				no++;
			}

			// 다음 5페이지
			if (no <= totalPage)
				pageBar += String.format(
						"<li><a href='/exam/user/usertestnewslist.action?page=%d'>»</a></li>", no);
			else
				pageBar += "<li><a href='#'>»</a></li>";

			pageBar += "</ul>";

			// ********* 페이지바 생성 끝
			System.out.println("list" + list.size());
			req.setAttribute("pageBar", pageBar);
			req.setAttribute("list", list);

			req.setAttribute("isSearch", isSearch);
			req.setAttribute("searchColumn", searchColumn);
			req.setAttribute("searchWord", searchWord);


			req.setAttribute("totalPage", totalPage);
			req.setAttribute("totalCount", totalCount);
			req.setAttribute("nowPage", nowPage);

			return "user/board/usertestnewslist";

		}
		
		

		// 게시물 보기
			@RequestMapping(method = RequestMethod.GET, value = "/user/usertestnewsview.action")
			public String view(HttpServletRequest req, UserTestNewsDTO dto) {

				// 데이터 가져오기
				String seq = req.getParameter("seq");
				String searchColum = req.getParameter("searchColum");
				String searchWord = req.getParameter("searchWord");

				  System.out.println("seq" + seq);
				
				
				// 조회수 증가처리
				HttpSession session = req.getSession();

				if (session.getAttribute("read") == null
						|| session.getAttribute("read").toString().equals("n")) {
					// 조회수 증가
					dao.addCount(seq);
					// y이면 조회수 증가 안됨
					session.setAttribute("read", "y");
				}

				// 글 내용 가져오기
				dto = dao.get(seq);


				// 스크립트방지
				dto.setContent(dto.getContent().replace("<script", "&lt;script")
						.replace("</script", "&lt;/script"));

				// 글내용 중 엔터값 처리
				dto.setContent(dto.getContent().replace("\r\n", "<br />"));

				// 검색중 단어 표시
				if (searchColum != null && searchWord != null
						&& searchColum.equals("content"))
					dto.setContent(dto.getContent().replace(
							searchWord,
							"<span style='color:red; background-color:yellow;'>"
									+ searchWord + "</span>"));

				if (searchColum == null && searchWord == null) {
					searchColum = "";
					searchWord = "";
				}

				// ********추가업무 끝
				
				req.setAttribute("dto",dto);
				
				return "user/board/usertestnewsview";
			}

	
	
}

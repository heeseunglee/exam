package com.standard.exam.user.board;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.standard.exam.admin.board.NoticeDTO;


@Controller("examboard")
public class ExamBoard {

	@Autowired
	ExamBoardDAO dao;
	
	//글쓰는 페이지 호출
	@RequestMapping(method={RequestMethod.GET}, value="/user/examboardadd.action")
	public String add(HttpServletRequest req, HttpSession session){
		
		String mode = req.getParameter("mode");
		String thread = req.getParameter("thread");
		String depth = req.getParameter("depth");
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 
	
		if (mode==null)
			mode = "new";
		
		req.setAttribute("mode", mode);
		req.setAttribute("thread", thread);
		req.setAttribute("depth", depth);
		
		return "user/board/examboardadd";
	
	}
	
	//글 쓰는 페이지
	@RequestMapping(method={RequestMethod.POST}, value="/user/examboardaddok.action")
	public String addok(HttpServletRequest req, ExamBoardDTO dto, HttpSession session){
		
		
		String memberSeq = (String)session.getAttribute("userSeq");
		String subject = req.getParameter("subject");
		String content = req.getParameter("content");
		String mode = req.getParameter("mode");
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 
		
		int thread = -1;
		int depth = -1;
		
		if(mode.equals("new")){
			thread = dao.getThread();
			depth = 0;
		}else if(mode.equals("reply")){
			int parentThread = Integer.parseInt(req.getParameter("thread"));
			int parentDepth = Integer.parseInt(req.getParameter("depth"));
			
			int prevThread =  (int)Math.floor((parentThread-1)/1000)* 1000;
			
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("parentThread", parentThread);
			map.put("prevThread", prevThread);
			
			dao.updateThread(map);
			
			thread = parentThread - 1;
			depth = parentDepth +1;
		}
		
		
		dto.setThread(thread+"");
		dto.setDepth(depth+"");
		dto.setMemberSeq(memberSeq);
		dto.setSubject(subject);
		dto.setContent(content);
		
		dao.add(dto);
		
		return "user/board/examboardaddok";
		
	
	}
	
	//리스트 불러오기
	@RequestMapping(method={RequestMethod.GET}, value="/user/examboardlist.action")
	public String list(HttpServletRequest req, ExamBoardDTO dto, NoticeDTO ndto, HttpSession session){
		
		session.setAttribute("read", "n");
		String name = (String)session.getAttribute("userName");
		
		//페이징
		int totalCount = 0;
		int totalPage = 0;
		int pageSize = 10;
		int no = 0, loop = 0;
		int nowPage = 0;
		int blockSize = 10;
		String pageBar = "";
		
		if (req.getParameter("page")==null)
			nowPage = 1;
		else
			nowPage = Integer.parseInt(req.getParameter("page"));
		
		int start = ((nowPage-1) * pageSize) + 1;
		int end = start + pageSize - 1;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		totalCount = dao.getTotal();
		totalPage = (int)Math.ceil(totalCount/(double)pageSize);
		//페이징 끝
		
		
		//검색
		boolean isSearch = false;
		
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		
		if (searchColumn != null && searchWord !=null) {
			
			isSearch = true;
			
			}
		
		HashMap<String, String> search = new HashMap<String, String>();
		search.put("searchColumn", searchColumn);
		search.put("searchWord", searchWord);
		search.put("start", start+"");
		search.put("end", end+"");
		
		//검색 끝
				
		//리스트 불러오기
		List<ExamBoardDTO> list = null;
		
		if (!isSearch)
			list = dao.list(map);
		else
			list = dao.searchList(search);
		
		for (int i=0; i<list.size(); i++) {
			
			dto = list.get(i);
			
			String tempDate = dto.getRegDate();
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			
			try {
				
				Date regDate = format.parse(tempDate);
				Calendar now = Calendar.getInstance();
				
				//틱값
				long gap = now.getTime().getTime() - regDate.getTime();
				
				if(gap/1000/60<30)
					dto.setNewImg("<img src = '/exam/resources/images/new.png'/>");
				
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			
			dto.setRegDate(dto.getRegDate().substring(0, 4)+"년 "+dto.getRegDate().substring(5, 7)+"월 "+dto.getRegDate().substring(8, 10)+"일");
			
			if (dto.getSubject().length() > 20)
				dto.setSubject(dto.getSubject().substring(0, 20) + "...");
			
			if(isSearch && searchColumn.equals("subject"))
				dto.setSubject(dto.getSubject().replace(searchWord, "<span style='color: #EE0C00;'>" + searchWord + "</span>"));
			else if (isSearch && searchColumn.equals("name"))
				dto.setName(dto.getName().replace(searchWord, "<span style='color: #EE0C00;'>"+searchWord+"</span>"));
			
			if (Integer.parseInt(dto.getDepth())>0)
				dto.setReplyImg(String.format("<img src='/exam/resources/images/icons/1424350101_logout.png' style='margin-left: %dpx'/>", Integer.parseInt(dto.getDepth()) * 10));
			else
				dto.setReplyImg("");
			
		}
		
		//페이지바 생성
		loop = 1;
		no = ((nowPage - 1)/blockSize) * blockSize + 1;
		
		pageBar += "<ul class='pagination pagination-sm'>";
		
		//이전 10개 페이지
		if (no != 1)
			pageBar += String.format("<li><a href='/exam/user/examboardlist.action?page=%d'>«</a></li>", no-1);
		else
			pageBar += "<li><a href='#'>«</a></li>";
		
			
		//페이지
		while (loop <= blockSize && no <= totalPage) {
			if (no==nowPage)
				pageBar += String.format("<li class='active'><a href='/exam/user/examboardlist.action?page=%d'>%d</a></li>", no, no);
			else
				pageBar += String.format("<li><a href='/exam/user/examboardlist.action?page=%d'>%d</a></li>", no, no); 
			loop++;
			no++;
		}
		
		//다음 10페이지
		if(no <= totalPage)
			pageBar += String.format("<li><a href='/exam/user/examboardlist.action?page=%d'>»</a></li>", no);
		else
			pageBar += "<li><a href='#'>»</a></li>";
		
		pageBar += "</ul>";
		//페이지바 생성 끝
		
		int noticeTotalCount = dao.getNoticeTotalCount();
		int noticeStartCount = noticeTotalCount - 2;
		
		HashMap<String , Integer> noticeMap = new HashMap<String, Integer>();
		noticeMap.put("start", noticeStartCount);
		noticeMap.put("end", noticeTotalCount);
		
		List<NoticeDTO> noticeList = dao.getNoticeList(noticeMap);

		
		for (int i=0; i<noticeList.size(); i++) {
			ndto = noticeList.get(i);

			ndto.setRegDate(ndto.getRegDate().substring(0, 4)+"년 "+ndto.getRegDate().substring(5, 7)+"월 "+ndto.getRegDate().substring(8, 10)+"일");
			
			if (ndto.getSubject().length() > 20)
				ndto.setSubject(ndto.getSubject().substring(0, 20)+"...");
		}
		
		
		req.setAttribute("noticeList", noticeList);
		
		req.setAttribute("name", name);
		req.setAttribute("pageBar", pageBar);
		req.setAttribute("list", list);
		req.setAttribute("isSearch", isSearch);
		req.setAttribute("searchWord", searchWord);
		req.setAttribute("searchColumn", searchColumn);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("totalCount", totalCount);
		req.setAttribute("nowPage", nowPage);
		
		
		return "user/board/examboardlist";
		}
	
	
	    //게시물 보기
	    @RequestMapping(method={RequestMethod.GET}, value="/user/examboardview.action")
		public String view(HttpServletRequest req, ExamBoardDTO dto, HttpSession session){
	    	
	    	String seq = req.getParameter("seq");
	    	String userName = (String)session.getAttribute("userName");
	    	String userSeq = (String)session.getAttribute("userSeq");
	    	String userId = (String)session.getAttribute("userId");
	    	boolean check = false;
			
	    	if (userId == null)
				return "back";
			else{

				if (session.getAttribute("read") == null || session.getAttribute("read").toString().equals("n")) {
					//조회수 증가
					dao.addCount(seq);
					//y이면 조회수 증가 안됨
					session.setAttribute("read", "y");
				}
				
				dto = dao.get(seq);
				
				dto.setContent(dto.getContent().replace("\r\n", "<br />"));
				
				if (dto.getMemberSeq().equals(userSeq))
					check = true;
				
				
				//댓글 목록 가져오기
				List<ExamBoardCommentDTO> clist = dao.listComment(seq);
				
				req.setAttribute("userName", userName);
				req.setAttribute("check", check);
				req.setAttribute("dto", dto);
				req.setAttribute("clist", clist);
				
				return "user/board/examboardview";
				
			}
		}
	    
	    

		//수정페이지 부르기
	    @RequestMapping(method={RequestMethod.GET}, value="/user/examboardedit.action")
	  	public String edit(HttpServletRequest req, ExamBoardDTO dto, HttpSession session){
			
			String seq = req.getParameter("seq");
			
			if ( session.getAttribute("userSeq") == null ) {
				return "auth/MemberOnly";
			} 
			dto = dao.get(seq);
			
			req.setAttribute("dto", dto);
			
			return "user/board/examboardedit";
		
		}
	    
	    
	    //수정하기
	    @RequestMapping(method={RequestMethod.POST}, value= "/user/examboardeditok.action")
	    public String editok(HttpServletRequest req, ExamBoardDTO dto, HttpSession session){
	    	
	    	String subject = req.getParameter("subject");
	    	String content = req.getParameter("content");
	    	if ( session.getAttribute("userSeq") == null ) {
				return "auth/MemberOnly";
			} 
			dto.setSubject(subject);
			dto.setContent(content);
			
			dao.edit(dto);
			
			return "user/board/examboardeditok";
		
	    }
	
	    //삭제하기
	    @RequestMapping(method={RequestMethod.GET}, value= "/user/examboarddel.action")
	    public String del(HttpServletRequest req, HttpSession session){
	    	
	    	String seq = req.getParameter("seq");
	    	if ( session.getAttribute("userSeq") == null ) {
				return "auth/MemberOnly";
			} 
    	
			//댓글 삭제
			dao.delComment(seq);
			//원래글 삭제
			dao.del(seq);
			
			return "user/board/examboarddel";
		
	    }
	    
	    //댓글 쓰기
	    @RequestMapping(method={RequestMethod.POST}, value= "/user/examboardcomment.action")
	    public String comment(HttpServletRequest req, ExamBoardCommentDTO dto, HttpSession session){
	    
	    	
	    	String name = (String)session.getAttribute("userName");
	    	
	    	String pSeq = req.getParameter("pSeq");
	    	String content = req.getParameter("content");
	    	if ( session.getAttribute("userSeq") == null ) {
				return "auth/MemberOnly";
			} 
			dto.setpSeq(pSeq);
			dto.setContent(content);
			dto.setName(name);
			
			//댓글쓰기
			dao.comment(dto);
			
			//댓글 카운트 증가
			dao.commentCount(pSeq);
			
			req.setAttribute("pSeq", pSeq);
			
			return "user/board/examboardcomment";
		
	    }
	    
	    //댓글 한줄씩삭제
	    @RequestMapping(method={RequestMethod.GET}, value="/user/examboardcommentdel.action")
	    public String commentDel(HttpServletRequest req, HttpSession session) {
	    	
	    	String pSeq = req.getParameter("pSeq");
	    	String seq = req.getParameter("seq");
	    	if ( session.getAttribute("userSeq") == null ) {
				return "auth/MemberOnly";
			} 
			dao.commentDel(seq);
			
			req.setAttribute("seq", pSeq);
			
			return "user/board/examboardcommentdel";
		
	    	
	    }
	    
}

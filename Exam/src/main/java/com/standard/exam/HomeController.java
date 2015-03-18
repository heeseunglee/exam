package com.standard.exam;

import java.text.ParseException;
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
import com.standard.exam.admin.board.SurveyDTO;
import com.standard.exam.user.board.CalendarDTO;

/**
 *  사이트 홈페이지 컨트롤러
 */
@Controller
public class HomeController {
	
	/**
	 * 
	 */
	@Autowired
	HomeControllerDAO dao;
	
	//메인페이지
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(HttpServletRequest req, SurveyDTO dto) {
		
		//설문조사 리스트 출력**************
		List<SurveyDTO> contentList = null;
		
		try {
			//설문조사제목리스트
			dto = dao.subjectList();
			//설문조사내용리스트
			contentList = dao.contentList(dto.getSeq());
		} catch (NullPointerException e) {
			req.setAttribute("subjectList", dto);
			req.setAttribute("contentList", contentList);
		}
		//설문조사 리스트 출력 끝**************
		
		
		
		//공지사항 리스트 출력 ****************
		
		List<NoticeDTO> noticeList = null;
		
		int totalCount = dao.getTotal();
		int startCount = totalCount - 4;
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("start", startCount);
		map.put("end", totalCount);
		
		
		try {
			noticeList = dao.getNoticeList(map);
			for (int i=0; i<noticeList.size(); i++) {
				
				NoticeDTO ndto = noticeList.get(i);
				
				ndto.setRegDate(ndto.getRegDate().substring(0, 10));
				if (ndto.getSubject().length() > 10)
					ndto.setSubject(ndto.getSubject().substring(0, 10)+"...");
			}
		} catch (NullPointerException e) {
			req.setAttribute("noticeList", noticeList);
		}
		
		
		//공지사항 리스트 출력 끝**************
		
		
		//시험일정보기****************
		
		List<CalendarDTO> calendarList = null;
		
		int calendarTotalCount = dao.getCalendarTotal();
		int calendarStartCount = calendarTotalCount-1;
		
		HashMap<String , Integer> calendarMap = new HashMap<String, Integer>();
		calendarMap.put("start", calendarStartCount);
		calendarMap.put("end", calendarTotalCount);
		try {
			
			calendarList = dao.getCalendarList(calendarMap);
			
			for (int i=0; i<calendarList.size(); i++) {
				CalendarDTO cdto = calendarList.get(i);
				
				Calendar now = Calendar.getInstance();
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String tempDate = cdto.getExamDate();
				long gap = 0;
				Date examDate = new Date();
				try {
					examDate = format.parse(tempDate);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				gap = examDate.getTime() - now.getTime().getTime();
				
				cdto.setRemainDate("<span style='color: red;'>"+(gap/1000/60/60/24)+"</span>일 남음");
				cdto.setExamDate(cdto.getExamDate().substring(0, 10));
			}
			
		} catch (NullPointerException e) {
			req.setAttribute("calendarList", calendarList);
		}
		
		
		//시험일정보기 끝****************
		
		req.setAttribute("calendarList", calendarList);
		req.setAttribute("noticeList", noticeList);
		req.setAttribute("subjectList", dto);
		req.setAttribute("contentList", contentList);
		
		return "home";
	}
	
	//설문조사투표하기
	@RequestMapping(method={RequestMethod.GET}, value="/user/survey.action")
	public String survey(HttpServletRequest req, HttpSession session) {
		
		String seq = req.getParameter("seq");
		String cSeq = req.getParameter("content");
		String userSeq = (String)session.getAttribute("userSeq");
		int check = -1;
		
		if ( session.getAttribute("userSeq") == null ) {
			return "auth/MemberOnly";
		} 
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("seq", seq);
		map.put("userSeq", userSeq);
		
		
		//설문조사 했는지 검사
		check = dao.checkHistory(map);
		
		if(check==0) {
			//설문조사기록남기기
			dao.insertHistory(map);
		
			//설문조사제목 카운트 증가
			dao.updateCount(seq, cSeq);
		
			
		}
		
		req.setAttribute("check", check);
		
		return "user/board/survey";
	}
	
	//설문조사결과보기
	@RequestMapping(method={RequestMethod.GET}, value="/user/surveyresult.action")
	public String surveyResult(HttpServletRequest req, SurveyDTO dto) {
		//설문조사제목리스트
		dto = dao.subjectList();
		dto.setStartDate(dto.getStartDate().substring(0, 10));
		dto.setEndDate(dto.getEndDate().substring(0, 10));
		
		
		//설문조사내용리스트
		List<SurveyDTO> contentList = dao.contentList(dto.getSeq());
		for (int i=0; i<contentList.size(); i++) {
			SurveyDTO sdto = contentList.get(i);
			
			int voteCount = Integer.parseInt(dto.getVoteCount());
			int answerCount = Integer.parseInt(sdto.getAnswerCount());
			
			sdto.setPercent((int)(answerCount/(float)voteCount*100)+"");
		}
		
		req.setAttribute("subjectList", dto);
		req.setAttribute("contentList", contentList);
		
		return "user/board/surveyresult";
	}
	
}

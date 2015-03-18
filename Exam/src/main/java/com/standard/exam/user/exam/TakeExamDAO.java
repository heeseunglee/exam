package com.standard.exam.user.exam;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TakeExamDAO {

	@Autowired
	private SqlSessionTemplate sql;	
	
	
	/**
	 * 시험 전체 목록 리턴
	 * @return
	 */
	public List<TakeExamDTO> list() {
		
		return sql.selectList("TakeExam.list");
	}

	/**
	 * 시험 페이지별 목록 리턴
	 * @return
	 */
	public List<TakeExamDTO> list(HashMap<String, Integer> map) {
		
		return sql.selectList("TakeExam.pageList", map);
	}

	
	/**
	 * 전체 문제지 수
	 * 
	 * @return int totalCount
	 */
	public int getTotalCount() {
		
		return sql.selectOne("TakeExam.totalCount");
	}
	
	
	
	/**
	 * 사이드바 메뉴(대분류) 리턴
	 * @return
	 */
	public List<TakeExamDTO> side() {

		return sql.selectList("TakeExam.side");
	}

	
	
	public List<TakeExamDTO> category(HashMap<String, Integer> map) {

		return sql.selectList("TakeExam.category", map);
	}

	
	/**
	 * 카테고리별 문제지 총수
	 * @param sideSeq
	 * @return
	 */
	public int getCategoryCount(String sideSeq) {

		return sql.selectOne("TakeExam.categoryCount", Integer.parseInt(sideSeq));
	}

	
	/**
	 * 문제지에 속하는 문제들 배열 리턴	
	 * @param examSeq
	 * @return List
	 */
	public List<LiveQuestionDTO> getQuestions(String examSeq) {

		return sql.selectList("TakeExam.getQuestions", Integer.parseInt(examSeq));
	}
	

	/**
	 * 선택한 문제지 정보
	 * @param examSeq
	 * @return TakeExamDTO
	 */
	public TakeExamDTO getTestInfo(String examSeq) {

		return sql.selectOne("TakeExam.getTestInfo", Integer.parseInt(examSeq));
	}
	
	
	
	/**
	 * 선택한 문제지 문항수
	 * @param examSeq
	 * @return
	 */
	public int getQuestionCNT(String examSeq) {
		return sql.selectOne("TakeExam.getQuestionCNT", Integer.parseInt(examSeq));
	}
	
	

	/**
	 * 답안지 채점 및 인서트
	 * @param answers
	 */
	public JSONArray OXCheck(JSONArray answers, String examSeq, String userSeq) {
		
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("examSeq", Integer.parseInt(examSeq));
		map.put("userSeq", Integer.parseInt(userSeq));
		
		
		//응사횟수
		int userTestCNT = sql.selectOne("TakeExam.userTestCNT", map);
		map.put("userTestCNT", userTestCNT + 1);
		
		
		//시험번호 생성
		sql.insert("TakeExam.addTestNumber", map);
		String testNumberSeq = sql.selectOne("TakeExam.testNumberSeq");
		
		
		//정답체크 후 답안지 생성
		List<LiveQuestionDTO> list = sql.selectList("TakeExam.getQuestions", Integer.parseInt(examSeq));

		
		JSONArray answerCheck = new JSONArray();

		for (int i=0; i<list.size(); i++) {
			
			String questionSeq = list.get(i).getSeq();
			String rightAnswer = list.get(i).getRightAnswer();
			String userAnswer = (String)answers.get(i);

			String oxCheck = "";
			
			if ( rightAnswer.equals(userAnswer) ) {
				oxCheck = "o";
			} else {
				oxCheck = "x";
			}
			
			System.out.println("시험 : " + testNumberSeq + ", 문제: " + questionSeq + ", " +  rightAnswer + " : " + userAnswer + ", 정답확인 : " + oxCheck);
			
			JSONObject obj = new JSONObject();
			obj.put("testNumberSeq", testNumberSeq);
			obj.put("userAnswer", userAnswer);
			obj.put("oxCheck", oxCheck);
			obj.put("rightAnswer", rightAnswer);
			answerCheck.add(obj);
			
			
			HashMap<String, String> answerPaper = new HashMap<String, String>();
			answerPaper.put("testNumberSeq", testNumberSeq);
			answerPaper.put("questionSeq", questionSeq);
			answerPaper.put("userAnswer", userAnswer);
			answerPaper.put("oxCheck", oxCheck);
			
			sql.insert("TakeExam.addAnswer", answerPaper);
			
		}
		
		return answerCheck;
	}
	
	
	
}

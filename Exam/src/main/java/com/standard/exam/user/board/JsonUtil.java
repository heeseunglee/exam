package com.standard.exam.user.board;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Repository;

import com.standard.exam.user.exam.TakeExamDTO;

@Repository
public class JsonUtil {
	
	
	
	/**
	 *  글 목록, List -->  JSONArray
	 */	
	public JSONArray qnaList(List<BoardQNADTO> list) {

		JSONArray array = new JSONArray();

		for(int i=0; i<list.size(); i++) {
			
			BoardQNADTO dto = list.get(i);
			
			JSONObject obj = new JSONObject();
			
			obj.put("seq", dto.getSeq());
			obj.put("subject", dto.getSubject());
			//obj.put("content", dto.getContent());
			obj.put("answer", dto.getAnswer());
			obj.put("regDate", dto.getRegDate());
			obj.put("secret", dto.getSecret());
			obj.put("writer", dto.getWriter());
			obj.put("name", dto.getName());
			
			//System.out.println(obj.toJSONString());	//레코드 1개 : JSON객체 1개
			
			array.add(obj);
		}
		
		//System.out.println(array.toJSONString());	// 레코드 수만큼 JSON객체를 담은 JSON배열
		
		return array;
	}
	
	
	

	/**
	 *  글 내용, BoardQNADTO -> JSONObject 
	 */		
	public JSONObject qnaView(BoardQNADTO dto) {
		
		JSONObject obj = new JSONObject();
		
		obj.put("seq", dto.getSeq());
		//obj.put("subject", dto.getSubject());
		obj.put("content", dto.getContent());
		obj.put("answer", dto.getAnswer());
		//obj.put("regDate", dto.getRegDate());
		obj.put("secret", dto.getSecret());
		obj.put("writer", dto.getWriter());
		
		return obj;
	}
	
	
	/**
	 *  글 목록, List -->  JSONArray
	 */	
	public JSONArray listToJson(List<TakeExamDTO> list) {

		JSONArray array = new JSONArray();

		for(int i=0; i<list.size(); i++) {
			
			TakeExamDTO dto = list.get(i);
			
			JSONObject obj = new JSONObject();
			
			obj.put("seq", dto.getSeq());
			obj.put("headline", dto.getHeadline());
			obj.put("midline", dto.getMidline());
			obj.put("footline", dto.getFootline());
			obj.put("testSubject", dto.getTestSubject());
			obj.put("timeLimit", dto.getTimeLimit());
			obj.put("testPrice", dto.getTestPrice());
			
			//System.out.println(obj.toJSONString());	//레코드 1개 : JSON객체 1개
			
			array.add(obj);
		}
		
		//System.out.println(array.toJSONString());	// 레코드 수만큼 JSON객체를 담은 JSON배열
		
		return array;
	}




	public JSONArray sideToJson(List<TakeExamDTO> side) {
		
		JSONArray array = new JSONArray();

		for(int i=0; i<side.size(); i++) {
			
			TakeExamDTO dto = side.get(i);
			
			JSONObject obj = new JSONObject();
			
			obj.put("seq", dto.getSeq());
			obj.put("headline", dto.getHeadline());
			
			array.add(obj);
		
		}
		return array;
	}
	
	
	
	
}

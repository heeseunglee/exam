package com.standard.exam.user.board;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardQNADAO {

	
	@Autowired
	private SqlSessionTemplate sql;	
	@Autowired
	private JsonUtil util;
	
	
	/**
	 *  전체 게시글 목록
	 * 
	 * @return JSONArray
	 */
	public JSONArray list() {
		//1. 글목록 ArrayList<BoardQNADTO>에 담기
		//2. ArrayList<BoardQNADTO> -->  JSONArray
		
		
		//1.
		List<BoardQNADTO> list = sql.selectList("userQNA.list");
		
		
		
		//2.
		JSONArray JsonList = util.qnaList(list);
		//System.out.println(util.qnaList(list).toJSONString());
		
		return JsonList;
	}


	
	/**
	 * 질문/답변 상세내용
	 * 	
	 * @param seq
	 * @return JSONObject
	 */
	public JSONObject view(String seq) {

		//System.out.println(seq);
		BoardQNADTO dto = sql.selectOne("userQNA.view", seq);
		
		//System.out.println(dto == null);
				
		return util.qnaView(dto);
	}


	
	/**
	 * 페이지당 게시글 목록
	 * 
	 * @param map
	 * @return JSONArray
	 */
	public JSONArray list(HashMap<String, Integer> map) {
		
		List<BoardQNADTO> list = sql.selectList("userQNA.pageList", map);

		JSONArray JsonList = util.qnaList(list);
		
		return JsonList;
	}


	/**
	 * 전체 게시글 수
	 * 
	 * @return int totalCount
	 */
	public int getTotalCount() {
		//System.out.println(sql.selectOne("userQNA.totalCount"));
		return sql.selectOne("userQNA.totalCount");
	}


	/**
	 *	질문하기
	 * @param map 
	 */
	public void addQna(HashMap<String, String> map) {
		sql.insert("userQNA.addQna", map);
	}
	
	/**
	 * 페이지당 게시글 목록
	 * 
	 * @param map
	 * @return JSONArray
	 */
	public JSONArray faqList(HashMap<String, Integer> map) {
		
		List<BoardQNADTO> list = sql.selectList("userQNA.faqList", map);

		JSONArray JsonList = util.qnaList(list);
		
		return JsonList;
	}

}

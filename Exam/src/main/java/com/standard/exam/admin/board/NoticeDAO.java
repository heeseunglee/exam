package com.standard.exam.admin.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//게시물 삽입
	public int add(NoticeDTO dto) {
		System.out.println("add");
		return sqlSession.insert("noticeboard.add", dto);
	}
	
	
	//총 게시물수 가져오기
	public int getTotal() {
		System.out.println("txt");
		return sqlSession.selectOne("noticeboard.getTotal");
	}

	
	//검색어 없는 목록
	public List<NoticeDTO> list(HashMap<String, Integer> map) {
		return sqlSession.selectList("noticeboard.list", map);
	}
	
	
	//검색어 있는 목록
	public List<NoticeDTO> searchList(HashMap<String, String> search) {
		return sqlSession.selectList("noticeboard.searchList", search);
	}

	
	//조회수 증가
	public void addCount(String seq) {
		sqlSession.update("noticeboard.addCount", seq);
	}

	
	//글 내용 가져오기
	public NoticeDTO get(String seq) {
		return sqlSession.selectOne("noticeboard.get", seq);
	}

	
	//해당 글 삭제
	public void del(String seq) {
		sqlSession.delete("noticeboard.del", seq);
	}

	
	//수정하기
	public void edit(NoticeDTO dto) {
		sqlSession.update("noticeboard.edit", dto);
	}
	




}

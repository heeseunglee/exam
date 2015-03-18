package com.standard.exam.user.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserNoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//총 게시물수 가져오기
	public int getTotal() {
		System.out.println("txt");
		return sqlSession.selectOne("usernoticeboard.getTotal");
	}

	
	//검색어 없는 목록
	public List<UserNoticeDTO> list(HashMap<String, Integer> map) {
		return sqlSession.selectList("usernoticeboard.list", map);
	}
	
	
	//검색어 있는 목록
	public List<UserNoticeDTO> searchList(HashMap<String, String> search) {
		return sqlSession.selectList("usernoticeboard.searchList", search);
	}

	
	//조회수 증가
	public void addCount(String seq) {
		sqlSession.update("usernoticeboard.addCount", seq);
	}

	
	//글 내용 가져오기
	public UserNoticeDTO get(String seq) {
		return sqlSession.selectOne("usernoticeboard.get", seq);
	}

}

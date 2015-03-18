package com.standard.exam.user.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserTestResultDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<UserTestResultDTO> userAnswer(UserTestResultDTO dto) {
		return sqlSession.selectList("usertestresult.answerlist", dto);
	}

	public List<UserTestResultDTO> testList(String userSeq) {
		return sqlSession.selectList("usertestresult.testList", userSeq);
	}




	
	
	
}

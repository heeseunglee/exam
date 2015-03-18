package com.standard.exam.user.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.standard.exam.user.member.UserMemberDTO;


@Repository
public class UserMemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public UserMemberDTO get(String seq) {
		return sqlSession.selectOne("usermember.get", seq);
	}

	public void memberedit(UserMemberDTO dto) {
		sqlSession.update("usermember.memberedit", dto);
	}

	public void receptionedit(UserMemberDTO dto) {
		sqlSession.update("usermember.receptionedit", dto);
		
	}

	public void membershipedit(UserMemberDTO dto) {
		sqlSession.update("usermember.membershipedit", dto);
		
	}

	public void userdel(String userSeq) {
		sqlSession.update("usermember.userdel", userSeq);		
	}

	
}

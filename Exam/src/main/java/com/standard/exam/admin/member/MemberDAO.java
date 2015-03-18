package com.standard.exam.admin.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void receptionadd(MemberDTO dto) {

		sqlSession.insert("member.receptionadd",dto);
		
	}
	
	public String addsel() {
		
		return sqlSession.selectOne("member.addsel");
	}

	public void add(MemberDTO dto) {
		
		sqlSession.insert("member.add", dto);
		
	}

	/**
	 * 
	 * @param String
	 * @return boolesn idCheck
	 */
	public boolean id_check(String userID) {

		boolean id_check = true;
		
		int count = sqlSession.selectOne("member.id_check", userID);	
		
		if( count == 1 ) {
			
			id_check = false;
		}
		
		return id_check;
	}

	public void memberstateseq(MemberDTO dto) {
		sqlSession.insert("member.memberstateseq",dto);
		
	}

	public String memberstatesel() {
		return sqlSession.selectOne("member.memberstatesel");
	}

	public void membershipseq(MemberDTO dto) {
		sqlSession.insert("member.membershipseq", dto);
	}

	
	public String memberseq() {
		return sqlSession.selectOne("member.memberseq");
	
	}

	public void membershipadd(String memberseq) {
		sqlSession.insert("member.membershipadd", memberseq);	
	}







	
}

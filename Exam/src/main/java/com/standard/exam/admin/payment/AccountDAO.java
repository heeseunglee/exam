package com.standard.exam.admin.payment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//계좌등록
	public void add(AccountDTO dto) {
		sqlSession.insert("account.add", dto);
	}
	
	//방금 삽입한 계좌불러오기
	public String getSeq() {
		return sqlSession.selectOne("account.getseq");
	}
	
	
	//계좌삭제하기
	public void del(String seq) {
		sqlSession.delete("account.del", seq);
	}
	
	//리스트불러오기
	public List<AccountDTO> list() {
		return sqlSession.selectList("account.list");
	}
	
	//테이블개수가져오기
	public int count() {
		return sqlSession.selectOne("account.count");
	}

}

package com.standard.exam.admin.payment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//결제 승인요청
	public void addPayment(PaymentDTO dto) {
		sqlSession.insert("payment.add", dto);
	}
	
	//가장큰 Seq 가져오기
	public String getSeq() {
		return sqlSession.selectOne("payment.getseq");
	}
	
	//입금계좌불러오기
	public PaymentDTO getBank(String seq) {
		return sqlSession.selectOne("payment.getbank", seq);
	}
	
	//결제요청목록
	public List<PaymentDTO> getList(String member) {
		return sqlSession.selectList("payment.getlist", member);
	}
	
	//관리자 결제요청 리스트
	public List<PaymentDTO> getAdminList() {
		return sqlSession.selectList("payment.getadminlist");
	}
	
	//관리자 결제승인
	public void authPayment(String seq) {
		sqlSession.update("payment.authpayment", seq);
	}
	
}

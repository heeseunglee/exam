package com.standard.exam.admin.message;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//쪽지 쓰기
	public int send(MessageDTO dto){
		return sqlSession.insert("message.sendms",dto);
	}

	//받은 쪽지 내용 가져오기
	public MessageDTO getms(String seq){
		return sqlSession.selectOne("message.getms",seq);
	}
	
	//보낸 쪽지 내용 가져오기
	public MessageDTO setms(String seq){
		return sqlSession.selectOne("message.setms",seq);
	}
	
	//쪽지 삭제
	public void delms(String seq){
		sqlSession.delete("message.delms",seq);
	}
	
	
	//유저아이디 가져오기
	public List<MessageDTO> getUser(String name) {
		return sqlSession.selectList("message.getuser", name);
	}
	
	//toSeq 가져오기
	public String getToSeq(String memberId) {
		return sqlSession.selectOne("message.gettoseq", memberId);
	}
	
	//보낸쪽지리스트가져오기
	public List<MessageDTO> getSetlist(String fromSeq) {
		return sqlSession.selectList("message.getsetlist", fromSeq);
	}
	
	//받은쪽지리스트가져오기
	public List<MessageDTO> getGetlist(String toSeq) {
		return sqlSession.selectList("message.getgetlist", toSeq);
	}
	
	//읽음 표시 + 쪽지 내용 보기
	public MessageDTO getView(String seq) {
		sqlSession.update("message.updateread", seq);
		return sqlSession.selectOne("message.getview", seq);
	}
	
	//보낸쪽지내용보기
	public MessageDTO getSetView(HashMap<String, String> map) {
		return sqlSession.selectOne("message.getsetview", map);
	}
	
	
}

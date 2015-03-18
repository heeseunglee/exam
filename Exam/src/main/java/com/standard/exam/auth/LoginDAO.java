package com.standard.exam.auth;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	
	/**
	 * id 존재 여부 check, 아이디가 일치하는 레코드 존재시 true 리턴
	 * 
	 * @param id
	 * @return boolean idCheck
	 */
	public boolean idCheck(String id) {

		boolean idCheck = false;
		//System.out.println("체크할 id : " + id);
		
		int count = sql.selectOne("loginMapper.idCheck", id);
		//System.out.println("아이디가 일치하는 레코드 : " + count);
		
		if ( count == 1 ) {
			idCheck = true;
		}
		
		//System.out.println("아이디 체크 : " + idCheck);
		return idCheck;
	}



	/**
	 * id,pw 일치하면 로그인, 유저 인증정보 받아오기
	 * @param map
	 * @return
	 */
	public LoginDTO login(HashMap<String, String> map) {
		
		return sql.selectOne("loginMapper.login", map);
	}



	/**
	 * id와 pw일치 하지 않으면 false 리턴
	 * @param map
	 * @return
	 */
	public boolean pwCheck(HashMap<String, String> map) {
		boolean pwCheck = false;
		
		int count = sql.selectOne("loginMapper.pwCheck", map);
		
		if ( count == 1 ) {
			pwCheck = true;
		}
		
		//System.out.println("비번 체크 : " + pwCheck);
		return pwCheck;
	}



	public int getMassage(String userSeq) {
		
		return sql.selectOne("loginMapper.getMassage", userSeq);
	}
	
	
}

package com.ineat.oxo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.ineat.oxo.vo.MemberVO;

//mDAO
public class MemberDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//로그인처리
	public int loginProc(MemberVO mVO) {
		int cnt = sqlSession.selectOne("mSQL.Login", mVO);
		return cnt;
	}
}

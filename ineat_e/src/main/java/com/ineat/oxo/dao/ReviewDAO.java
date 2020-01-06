package com.ineat.oxo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.ineat.oxo.vo.ReviewVO;

//rvDAO
public class ReviewDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public void addreview (ReviewVO rvVO) {
		sqlSession.insert("rvSQL.addreview", rvVO);
	}
	
	public void f_addreview(ReviewVO rvVO) {
		sqlSession.insert("rvSQL.f_addreview", rvVO);
	}
}

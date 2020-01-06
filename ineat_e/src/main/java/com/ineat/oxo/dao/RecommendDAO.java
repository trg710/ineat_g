package com.ineat.oxo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class RecommendDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List storeList() {
			
		return sqlSession.selectList("rSQL.showList");
	}
	
	public List menuList() {
		return sqlSession.selectList("rSQL.menuList");
	}
	public List weatherChoo(String dayCondition) {
		System.out.println(dayCondition);
		return sqlSession.selectList("rSQL.weatherChoo", dayCondition);
	}	
}

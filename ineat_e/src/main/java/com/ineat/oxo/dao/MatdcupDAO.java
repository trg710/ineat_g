package com.ineat.oxo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

//mcDAO
public class MatdcupDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List matList(){
		
		return sqlSession.selectList("mdSQL.matList"); 
	}
}

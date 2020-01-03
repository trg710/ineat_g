package com.ineat.oxo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.ineat.oxo.vo.TasteInfoVO;

//tDAO
public class TasteInfoDAO {
	@Autowired SqlSessionTemplate sqlSession;
	
	
	public List<TasteInfoVO> selectList() {
		List<TasteInfoVO> list = sqlSession.selectList("tSQL.selectlist");
		
		
		return list;
	}
	
	public List<TasteInfoVO> moreList(TasteInfoVO tVO){
		
		List<TasteInfoVO> list = sqlSession.selectList("tSQL.morelist",tVO);
		
		return list;
	}
	
	public List<TasteInfoVO> tagList(TasteInfoVO tVO){
		List<TasteInfoVO> list = sqlSession.selectList("tSQL.taglist",tVO);
		
		return list;
	}
}

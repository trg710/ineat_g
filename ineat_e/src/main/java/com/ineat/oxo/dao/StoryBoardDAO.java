package com.ineat.oxo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.ineat.oxo.vo.StoryBoardVO;

//sbDAO
public class StoryBoardDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<StoryBoardVO> storyBoard(){
		return sqlSession.selectList("sbSQL.storyBoard");
	}
	
	public StoryBoardVO storyBoardInfo(int bno) {
		return sqlSession.selectOne("sbSQL.storyBoardInfo", bno);
	}
}

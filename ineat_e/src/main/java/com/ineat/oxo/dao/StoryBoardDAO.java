package com.ineat.oxo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.ineat.oxo.vo.StoryBoardVO;

//sbDAO
public class StoryBoardDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// sb 출력
	public List<StoryBoardVO> storyBoard(){
		return sqlSession.selectList("sbSQL.storyBoard");
	}
	
	// sb 상세보기
	public StoryBoardVO storyBoardInfo(int bno) {
		return sqlSession.selectOne("sbSQL.storyBoardInfo", bno);
	}
	
	// sb write 처리
	public int storyBoardWriteProc(StoryBoardVO sbVO) {
		int cnt = sqlSession.insert("sbSQL.storyBoardWriteProc", sbVO);
		
		return cnt;
	}
	
	// sb like 처리
	public int sbLike(StoryBoardVO sbVO) {
		return sqlSession.selectOne("sbSQL.sbLike", sbVO);
	}
	
	public int sbLikeU(StoryBoardVO sbVO) {
		return sqlSession.update("sbSQL.sbLikeU", sbVO);
	}
	
	public int sbLikeHC(StoryBoardVO sbVO) {
		return sqlSession.selectOne("sbSQL.sbLikeHC", sbVO);
	}
	
	public int sbLikeZC(StoryBoardVO sbVO) {
		return sqlSession.selectOne("sbSQL.sbLikeZC", sbVO);
	}
	
	public int sbLikeU2(StoryBoardVO sbVO) {
		return sqlSession.update("sbSQL.sbLikeU2", sbVO);
	}
	
	public int sbLike2(StoryBoardVO sbVO) {
		return sqlSession.update("sbSQL.sbLike2", sbVO);
	}
}

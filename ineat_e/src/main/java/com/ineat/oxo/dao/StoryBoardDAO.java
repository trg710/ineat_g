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
	
	
	// 싫어요 처리
	public int sbHate(StoryBoardVO sbVO) {
		return sqlSession.selectOne("sbSQL.sbHate", sbVO);
	}
	
	public int sbHateU(StoryBoardVO sbVO) {
		return sqlSession.update("sbSQL.sbHateU", sbVO);
	}
	
	public int sbHateLC(StoryBoardVO sbVO) {
		return sqlSession.selectOne("sbSQL.sbHateLC", sbVO);
	}
	
	public int sbHateZC(StoryBoardVO sbVO) {
		return sqlSession.selectOne("sbSQL.sbHateZC", sbVO);
	}
	
	public int sbHateU2(StoryBoardVO sbVO) {
		return sqlSession.update("sbSQL.sbHateU2", sbVO);
	}
	
	public int sbHate2(StoryBoardVO sbVO) {
		return sqlSession.update("sbSQL.sbHate2", sbVO);
	}
	
	// 삭제 처리
	public int sblhDelete(StoryBoardVO sbVO) {
		return sqlSession.delete("sbSQL.sblhDelete", sbVO);
	}
	
	public int sbDelete(StoryBoardVO sbVO) {
		return sqlSession.delete("sbSQL.sbDelete", sbVO);
	}

	public int sbfileDelete(StoryBoardVO sbVO) {
		return sqlSession.delete("sbSQL.sbfileDelete", sbVO);
	}
	// 게시물 상세보기
	public StoryBoardVO sbViewDetail(String id) {
		return sqlSession.selectOne("sbSQL.sbViewDetail", id);
	}

	public int sbInfoEdit(StoryBoardVO sbVO) {
		return sqlSession.update("sbSQL.sbInfoEdit", sbVO);
	}

	public int viewsCnt(int bno) {
		return sqlSession.update("sbSQL.viewsCnt", bno);
	}

	public int sbComment(StoryBoardVO sbVO) {
		return sqlSession.insert("sbSQL.sbComment", sbVO);		
	}

	// 댓글 가져오는 함수
	public List<StoryBoardVO> sbCommentList(int bno){
		return sqlSession.selectList("sbSQL.sbCommentList");
	}


}

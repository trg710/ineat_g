package com.ineat.oxo.dao;

import java.util.List;

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
	
//	리뷰 갯수를 카운트 하는 함수.
	public int getReviewCnt(int ml_no) {
		return sqlSession.selectOne("rvSQL.reviewcnt", ml_no);
	}
	
// 리뷰 정보 리스트를 가져오는 함수	
	public List<ReviewVO> getReviewInfo(ReviewVO rvVO){
		return sqlSession.selectList("rvSQL.reviewinfo", rvVO);
	}
 
}

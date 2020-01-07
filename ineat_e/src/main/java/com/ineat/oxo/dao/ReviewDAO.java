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
	
//	리뷰 평균을 구하는 함수
	public double getReviewAvg(int ml_no) {
		return sqlSession.selectOne("rvSQL.reviewavg", ml_no);
	}
	 
// 리뷰 정보 리스트를 가져오는 함수	
	public List<ReviewVO> getReviewInfo(int ml_no){
//		리뷰정보가져오는 함수.
		List<ReviewVO> list = sqlSession.selectList("rvSQL.reviewinfo", ml_no);
		
//		리뷰 갯수만큼 반복
		for(int i = 0 ; i<list.size(); i++) {
//			i번째 리뷰의 사진갯수를 가져옴.
			int cnt = list.get(i).getCnt();
			System.out.println(i+"번째 리뷰의 사진갯수 : "+cnt);
//			사진갯수가 0보다 크면
			if(cnt > 0) {
//				i번째 리뷰번호를 받아서
				int rvno =list.get(i).getRv_no();
				System.out.println(i+" i번째리뷰의  rvno : "+rvno);
//				사진정보(savename)을 i번째 리뷰에 넣는다.
				list.get(i).setRf_savename(sqlSession.selectList("rvSQL.rvfileinfo", rvno));
			}
		}
//		리스트를 반환
		return list;
	}
	
	//메인에 노출될 리뷰
	public List<ReviewVO> mainReview(){
		return sqlSession.selectList("rvSQL.mainReview");
	}
}

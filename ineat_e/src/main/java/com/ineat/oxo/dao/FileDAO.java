package com.ineat.oxo.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.ineat.oxo.vo.FileVO;

//fDAO
public class FileDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	// sb 파일 정보 입력 전담 처리 함수
	public int sbFileAddProc(FileVO fVO) {
		return sqlSession.insert("sbSQL.sbFileAddProc", fVO);
	}
}

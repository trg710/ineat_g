package com.ineat.oxo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ineat.oxo.dao.ReviewDAO;

/**
 * 이 클래스는 리뷰관련 컨트롤러 입니다.
 * 
 * @author 박송림
 * @since  2019.12.30
 * @version v.1.0
 * 
 * 			변경이력
 * 				2019.12.30	-	클래스 제작		-	담당자 : 박송림
 *
 */

@Controller
@RequestMapping("/ineatlist/review")
public class Review {
	@Autowired
	ReviewDAO rvVO;
	
	@RequestMapping("addreview.eat")
	public ModelAndView addreview(ModelAndView mv) {
		
		mv.setViewName("ineatlist/review/addreview");
		return mv;
	}
}

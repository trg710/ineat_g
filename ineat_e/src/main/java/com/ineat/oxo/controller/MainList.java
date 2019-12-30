package com.ineat.oxo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 이 클래스는 맛집리스트 보기, 상세보기를 도와주는 클래스 입니다.
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
public class MainList {
	
	@RequestMapping("list.eat")
	public ModelAndView List(ModelAndView mv) {
		mv.setViewName("ineatlist/list");
		return mv;
	}
	
	
}

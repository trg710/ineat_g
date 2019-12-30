package com.ineat.oxo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 음식추천관련하여 사용하는 클래스입니다.
 * 
 * @author 황태은
 *
 *						2019-12-30
 */
@Controller
@RequestMapping("/recommend/")
public class Recommend {

	@RequestMapping("recommend.eat")
	public ModelAndView recommendForm(ModelAndView mv) {
		mv.setViewName("recommend/recommendForm");
		
		return mv;
	}
}

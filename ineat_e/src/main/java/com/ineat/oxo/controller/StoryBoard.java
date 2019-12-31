package com.ineat.oxo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 이 클래스는 storyboard 컨트롤러입니다.
 * @author	이태성
 * @since	2019.12.31
 * @version	v.1.0
 * @see		2019.12.31 - 클래스 제작 - 담당자: 이태성
 *
 */
@Controller
@RequestMapping("/storyboard/")
public class StoryBoard {
	
	@RequestMapping("storyBoard.eat")
	public ModelAndView storyBoard(ModelAndView mv) {
		
		return mv;
	}

	@RequestMapping("storyBoardInfo.eat")
	public ModelAndView storyBoardInfo(ModelAndView mv) {
		
		return mv;
	}
	
	@RequestMapping("storyBoardWrite.eat")
	public ModelAndView storyBoardWrite(ModelAndView mv) {
		
		return mv;
	}
}

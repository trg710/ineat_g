package com.ineat.oxo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

  
@Controller
@RequestMapping("/ineatlist/")
public class MainList {
	
	@RequestMapping("list.eat")
	public ModelAndView List(ModelAndView mv) {
		
		
		mv.setViewName("ineatlist/list");
		return mv;
	}
	
	@RequestMapping("info.eat")
	public ModelAndView detailinfo(ModelAndView mv) {
		mv.setViewName("ineatlist/detail/detailinfo");
		
		return mv;
	}
	@RequestMapping("map.eat")
	public ModelAndView MapTest(ModelAndView mv) {
		mv.setViewName("ineatlist/detail/modal");
		return mv;
	}
}

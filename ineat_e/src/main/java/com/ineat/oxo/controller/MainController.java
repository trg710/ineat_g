package com.ineat.oxo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping
public class MainController {
	@RequestMapping("/main.eat")
	public ModelAndView Main(ModelAndView mv) {
		mv.setViewName("main/main");
		return mv;
	}
}

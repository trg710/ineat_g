package com.ineat.oxo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mat/")
public class Matdcup {
	
	@RequestMapping("matdcup.eat")
	public ModelAndView matdcupForm(ModelAndView mv) {
		//List list = mdDAO. 
		
		mv.setViewName("matdcup/matdcup");
		return mv;
	}
}

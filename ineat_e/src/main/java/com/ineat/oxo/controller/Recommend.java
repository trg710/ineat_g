package com.ineat.oxo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ineat.oxo.dao.RecommendDAO;

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
	@Autowired
	RecommendDAO rDAO;

	@RequestMapping("recommend.eat")
	public ModelAndView recommendForm(ModelAndView mv) {
		List list = rDAO.storeList();
		mv.addObject("LIST", list);

		mv.setViewName("recommend/recommendForm");
		return mv;
	}
}

package com.ineat.oxo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ineat.oxo.dao.SearchDAO;
import com.ineat.oxo.vo.SearchVO;
import com.ineat.oxo.vo.TasteInfoVO;

@Controller
public class Search {
	@Autowired
	SearchDAO schDAO;
	
	@RequestMapping("/searchResult.eat")
	public ModelAndView searchFrom(ModelAndView mv) {
		mv.setViewName("search/searchResult");
		
		return mv;
	}
	
	@RequestMapping("/searchProc.eat")
	public ModelAndView searchProc(ModelAndView mv, SearchVO schVO) {
		List<TasteInfoVO> list=schDAO.searchM(schVO);
		mv.addObject("SCH", schVO);
		mv.addObject("LIST", list);
		mv.setViewName("search/searchResult");
		return mv;
	}
	
	@RequestMapping("/moreResult.eat")
	@ResponseBody
	public List<TasteInfoVO> moreResult(SearchVO schVO) {
		List<TasteInfoVO> list = schDAO.moreResult(schVO);
		
		return list;
		
	}
	
}

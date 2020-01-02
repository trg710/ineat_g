package com.ineat.oxo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ineat.oxo.dao.TasteInfoDAO;
import com.ineat.oxo.vo.TasteInfoVO;

import java.util.*;
  
@Controller
@RequestMapping("/ineatlist/")
public class MainList {
	@Autowired
	TasteInfoDAO tDAO;
	
	@RequestMapping("list.eat")
	public ModelAndView List(ModelAndView mv) {
		List<TasteInfoVO> list = tDAO.selectList();
		
		int total = list.size();
		
		mv.addObject("LIST",list);
		
		mv.addObject("TOTAL", total);
		mv.addObject("type","조회");
		mv.setViewName("ineatlist/list");
		
		return mv;
	}
	
	
	@RequestMapping("morelist.eat")
	@ResponseBody
	public List<TasteInfoVO> morelist(TasteInfoVO tVO) {
		
		List<TasteInfoVO> list = tDAO.moreList(tVO);
		
		return list;
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

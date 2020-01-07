package com.ineat.oxo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ineat.oxo.dao.ReviewDAO;
import com.ineat.oxo.dao.TasteInfoDAO;
import com.ineat.oxo.vo.ReviewVO;
import com.ineat.oxo.vo.TasteInfoVO;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
  
@Controller
@RequestMapping("/ineatlist/")
public class MainList {
	@Autowired
	TasteInfoDAO tDAO;
	@Autowired
	ReviewDAO rvDAO;
	
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
	public ArrayList<TasteInfoVO> morelist(TasteInfoVO tVO) {
		ArrayList<TasteInfoVO> list = new ArrayList<TasteInfoVO>();
		String type = tVO.getMl_type();
		String tag = tVO.getMl_tag();
		if(tag.length() == 0) {
			list = (ArrayList<TasteInfoVO>)tDAO.moreList(tVO);
		}else {
			list = (ArrayList<TasteInfoVO>)tDAO.tagList(tVO);
		}
		return list;
	}
	
	
	@RequestMapping("info.eat")
	public ModelAndView detailinfo(ModelAndView mv, int ml_no, RedirectView rv) {
		TasteInfoVO tVO = tDAO.tasteInfo(ml_no);
		
		List<ReviewVO> list = rvDAO.getReviewInfo(ml_no);
		int cnt = rvDAO.getReviewCnt(ml_no);
		double avg = 0;
		
		if(cnt != 0) {
			avg = rvDAO.getReviewAvg(ml_no);
		}
		
		List<String> rvimgs = tDAO.reviewImgs(ml_no);
		
		System.out.println(list.size());
		
		mv.addObject("IMGS",rvimgs);
		mv.addObject("AVG", avg);
		mv.addObject("CNT",cnt);
		mv.addObject("RV_LIST",list);
		mv.addObject("TVO", tVO);
		mv.setViewName("ineatlist/detail/detailinfo");
		return mv;
	}
	
	@RequestMapping("map.eat")
	public ModelAndView MapTest(ModelAndView mv) {
		mv.setViewName("ineatlist/detail/modal");
		return mv;
	}
	
	@RequestMapping("mainList.eat")
	public ModelAndView mainList(ModelAndView mv, TasteInfoVO tVO) {
		System.out.println(tVO.getMl_tag());
		ArrayList<TasteInfoVO> list = new ArrayList<TasteInfoVO>();
		String type = tVO.getMl_type();
		String tag = tVO.getMl_tag();
		if(tag.length() == 0) {
			list = (ArrayList<TasteInfoVO>)tDAO.moreList(tVO);
		}else {
			list = (ArrayList<TasteInfoVO>)tDAO.tagList(tVO);
		}
		mv.addObject("LIST",list);
		mv.setViewName("ineatlist/list");
		return mv;
	}
	
}

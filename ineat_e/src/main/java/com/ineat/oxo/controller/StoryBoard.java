package com.ineat.oxo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ineat.oxo.dao.StoryBoardDAO;
import com.ineat.oxo.vo.StoryBoardVO;

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
	@Autowired
	StoryBoardDAO sbDAO;
	
	// sb 출력
	@RequestMapping("storyBoard.eat")
	public ModelAndView storyBoard(ModelAndView mv, HttpSession session) {
		List<StoryBoardVO> list = sbDAO.storyBoard();
		mv.addObject("LIST", list);
		
		String sid = (String) session.getAttribute("SID");
		session.setAttribute("SID", sid);
		System.out.println("%storyBoard.eat: " + sid);
		return mv;
	}

	// sbinfo 출력
	@RequestMapping("storyBoardInfo.eat")
	public ModelAndView storyBoardInfo(ModelAndView mv, HttpSession session, StoryBoardVO sbVO, int bno) {
		sbVO = sbDAO.storyBoardInfo(bno);
		
		mv.addObject("mid", sbVO.getMid());
		mv.addObject("title", sbVO.getTitle());
		mv.addObject("content", sbVO.getContent());
		mv.addObject("wdate", sbVO.getWdate());
		mv.addObject("views", sbVO.getViews());
		
		return mv;
	}
	
	// sbwrite 출력
	@RequestMapping("storyBoardWrite.eat")
	public ModelAndView storyBoardWrite(ModelAndView mv) {
		
		return mv;
	}
	
}

package com.ineat.oxo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.ineat.oxo.dao.MemberDAO;
import com.ineat.oxo.vo.MemberVO;

@Controller
@RequestMapping("/member/")
public class Member {
	@Autowired
	MemberDAO mDAO;

	
	@RequestMapping("loginProc.eat")
	@ResponseBody
	public int login(HttpSession session, MemberVO mVO) {
		int cnt = mDAO.loginProc(mVO);
		if(cnt==1) {
			//로그인 성공
			session.setAttribute("SID", mVO.getId());
		}
		return cnt;
	}
	@RequestMapping("logout.eat")
	public ModelAndView logoutForm(HttpSession session,RedirectView rv, ModelAndView mv) {
		session.setAttribute("SID", null);
		rv.setUrl("/oxo/main.eat");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("join.eat")
	public ModelAndView join(ModelAndView mv) {
		mv.setViewName("member/join");
		return mv;
	}
	/*
	@RequestMapping("joinProc.eat")
	public ModelAndView joinProc(ModelAndView mv, RedirectView rv, HttpSession session, MemberVO vo)
	*/
	

}


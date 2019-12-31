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

	//로그인
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
	//로그아웃
	@RequestMapping("logout.eat")
	public ModelAndView logoutForm(HttpSession session,RedirectView rv, ModelAndView mv) {
		session.setAttribute("SID", null);
		rv.setUrl("/oxo/main.eat");
		mv.setView(rv);
		return mv;
	}
	
	//회원가입
	@RequestMapping("join.eat")
	public ModelAndView join(ModelAndView mv) {
		mv.setViewName("member/join");
		return mv;
	}
	
	@RequestMapping("joinProc.eat")
	public ModelAndView joinProc(ModelAndView mv, RedirectView rv, HttpSession session, MemberVO mVO) {
		int cnt = mDAO.joinProc(mVO);
		if(cnt==1) {
			session.setAttribute("SID", mVO.getId());
			rv.setUrl("/oxo/main.eat");
		}else {
			//실패
			rv.setUrl("oxo/member/join.eat");
		}
		mv.setView(rv);
		return mv;
	}
	
	//아이디체크
	@RequestMapping("idCheck.eat")
	@ResponseBody
	public int idCheck(String id) {
		int cnt = mDAO.idCheck(id);
		return cnt;
	}
	
	//닉네임체크
	@RequestMapping("nnCheck.eat")
	@ResponseBody
	public int nnCheck(String nname) {
		int cnt = mDAO.nnCheck(nname);
		return cnt;
	}
	
	//전화번호체크
	@RequestMapping("telCheck.eat")
	@ResponseBody
	public int telCheck(String tel) {
		int cnt = mDAO.telCheck(tel);
		return cnt;
	}
	
	//이메일체크
	@RequestMapping("eCheck.eat")
	@ResponseBody
	public int eCheck(String email) {
		int cnt = mDAO.eCheck(email);
		return cnt;
	}
	
}


package com.to.cdp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.to.cdp.info.model.InfoMember;
import com.to.cdp.info.service.InfoMemberService;

@Controller
public class LoginController {
	@Autowired
	private InfoMemberService infoMemberService;
	
	// 세션사용 화면
	@RequestMapping("/page1")
	public String page1() {
		return "page1";
	}
	
	// 세션 사용 안하는 화면
	@RequestMapping("/page2")
	public String page2() {
		return "page2";
	}
	
	// 로그인 화면
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("memberLoginInfo", null);
		session.invalidate();
		return "redirect:/login";
	}
	
	// 로그인 처리
	@RequestMapping(value="/loginProcess", method = RequestMethod.POST)
	public String loginProcess(
			InfoMember infoMember, 
			HttpSession session, 
			HttpServletRequest request) {
		infoMember.setInfoMemberId(infoMember.getInfoMemberId());
		infoMember.setInfoMemberPw(infoMember.getInfoMemberPw());
		InfoMember loginMember = infoMemberService.findByUserIdAndPassword(infoMember);
		
		if (loginMember != null) {
			session.setAttribute("memberLoginInfo", loginMember);
		}
		return "redirect:/login";
	}
}

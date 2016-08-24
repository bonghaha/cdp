package com.to.cdp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		session.setAttribute("memberLoginId", null);
		session.invalidate();
		return "redirect:/home";
	}
	
	// 로그인 처리
	@RequestMapping(value="/loginProcess", method = RequestMethod.POST)
	public String loginProcess(
			InfoMember infoMember, 
			HttpSession session, 
			Model model) {
		String loginId = infoMember.getInfoMemberId();
		String loginPw = infoMember.getInfoMemberPw();
		infoMember.setInfoMemberId(loginId);
		infoMember.setInfoMemberPw(loginPw);
		infoMember = infoMemberService.findByUserIdAndPassword(infoMember);
		System.out.println("infoMember LoginController : " + infoMember);

		String result = "";
		if(infoMember == null){
			model.addAttribute("loginHelper", "로그인 실패");
			result = "login";
		}
		if(infoMember != null) {
			session.setAttribute("memberLoginId", loginId);
			model.addAttribute("infoMember", infoMember);
			result = "home";
		}
		return result;
	}
}

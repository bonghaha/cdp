package com.to.cdp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.info.model.InfoMember;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService ;
	
	@RequestMapping(value="/myPage")
	public String myPage(){
		return "myPage/myPage";
	}
	
	@RequestMapping(value="/myInfoManagement", method=RequestMethod.GET)
	public String myInfoManagement(
			Model model,
			InfoMember infoMember,
			HttpSession session){
		
		String infoMemberId = (String) session.getAttribute("memberLoginId");
		
		infoMember.setInfoMemberId(infoMemberId);
		infoMember = myPageService.infoMemberDetail(infoMember);
		System.out.println("infoMember MyPageController : " + infoMember);
		model.addAttribute("infoMember", infoMember);
		return "myPage/myInfoManagement";
	}
	
	@RequestMapping(value="/myInfoMemberUpdate")
	public String myInfoMemberUpdate(
			InfoMember infoMember,
			Model model,
			HttpSession session){
		
		String infoMemberId = (String) session.getAttribute("memberLoginId");
		
		infoMember.setInfoMemberId(infoMemberId);
		myPageService.myInfoMemberUpdate(infoMember);
		model.addAttribute("infoMember", infoMember);
		System.out.println("infoMember MyPageController22222222 : " + infoMember);
		return "/home";
	}
}


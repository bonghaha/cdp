package com.to.cdp.resume.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.to.cdp.resume.model.ResumeDept;
import com.to.cdp.resume.service.ResumeDeptService;

@Controller
public class ResumeDeptController {
	
	@Autowired
	private ResumeDeptService resumeDeptService;
	
	// 이력서 학과정보 저장
	@RequestMapping(value="/resumeDeptInsert")
	public String resumeDeptInsert(
			ResumeDept resumeDept,
			HttpSession session){
		
//		System.out.println("resumeDept /resumeDeptInsert : " + resumeDept);
		resumeDept.setInfoMemberId((String) session.getAttribute("memberLoginId"));
		resumeDeptService.resumeDeptInsert(resumeDept);
		return "redirect:/resumeDetail";
	}
	
	// 이력서 학과정보 수정
	@RequestMapping(value="/resumeDeptUpdate")
	public String resumeDeptUpdate(
			ResumeDept resumeDept,
			HttpSession session){
		
//		System.out.println("resumeDept /resumeDeptUpdate : " + resumeDept);
		resumeDept.setInfoMemberId((String) session.getAttribute("memberLoginId"));
		resumeDeptService.resumeDeptUpdate(resumeDept);
		return "redirect:/resumeDetail";
	}
	
}

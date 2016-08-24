package com.to.cdp.resume.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.to.cdp.resume.model.ResumeSchool;
import com.to.cdp.resume.service.ResumeSchoolService;

@Controller
public class ResumeSchoolController {
	
	@Autowired
	private ResumeSchoolService resumeSchoolService;
	
	// 이력서 학교정보 저장
	@RequestMapping(value="/resumeSchoolInsert")
	public String resumeSchoolInsert(
			ResumeSchool resumeSchool,
			HttpSession session){
		
//		System.out.println("resumeSchool /resumeSchoolInsert : " + resumeSchool);
		resumeSchool.setInfoMemberId((String) session.getAttribute("memberLoginId"));
		resumeSchoolService.resumeSchoolInsert(resumeSchool);
		return "redirect:/resumeDetail";
	}
	
	// 이력서 학교정보 수정
	@RequestMapping(value="/resumeSchoolUpdate")
	public String resumeSchoolUpdate(
			ResumeSchool resumeSchool,
			HttpSession session){
		
//		System.out.println("resumeSchool /resumeSchoolUpdate : " + resumeSchool);
		resumeSchool.setInfoMemberId((String) session.getAttribute("memberLoginId"));
		resumeSchoolService.resumeSchoolUpdate(resumeSchool);
		return "redirect:/resumeDetail";
	}
	
}

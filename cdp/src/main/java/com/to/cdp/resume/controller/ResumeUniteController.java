package com.to.cdp.resume.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.to.cdp.info.model.InfoMember;
import com.to.cdp.resume.model.ResumeCert;
import com.to.cdp.resume.model.ResumeDept;
import com.to.cdp.resume.model.ResumeSchool;
import com.to.cdp.resume.service.ResumeUniteService;

@Controller
public class ResumeUniteController {

	@Autowired
	private ResumeUniteService resumeUniteService;
	
	@RequestMapping(value="/resumeDetail")
	public String resumeDetail(
			InfoMember infoMember,
			ResumeSchool resumeSchool,
			ResumeDept resumeDept,
			ResumeCert resumeCert,
			HttpSession session, 
			Model model){
		
		String infoMemberId = (String) session.getAttribute("memberLoginId");
		
		// 회원기본정보 출력
		infoMember.setInfoMemberId(infoMemberId);
		infoMember = resumeUniteService.resumeMemberDetail(infoMember);
		
		// 최종학력의 학교 출력
		resumeSchool.setInfoMemberId(infoMemberId);
		resumeSchool = resumeUniteService.resumeSchoolDetail(resumeSchool);
		
		// 회종학력의 학과 출력
		resumeDept.setInfoMemberId(infoMemberId);
		resumeDept = resumeUniteService.resumeDeptDetail(resumeDept);
		
		// 자격증 1개 출력  ==>>>> (추후) 복수등록 가능하게 하기
		resumeCert.setInfoMemberId(infoMemberId);
		resumeCert = resumeUniteService.resumeCertDetail(resumeCert);
		
		model.addAttribute("infoMember", infoMember);
		model.addAttribute("resumeSchool", resumeSchool);
		model.addAttribute("resumeDept", resumeDept);
		model.addAttribute("resumeCert", resumeCert);
		return "myPage/resume";
	}
}
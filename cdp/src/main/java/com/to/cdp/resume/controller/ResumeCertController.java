package com.to.cdp.resume.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.to.cdp.resume.model.ResumeCert;
import com.to.cdp.resume.service.ResumeCertService;

@Controller
public class ResumeCertController {
	
	@Autowired
	private ResumeCertService resumeCertService;
	
	// 이력서 자격증정보 저장
	@RequestMapping(value="/resumeCertInsert")
	public String resumeCertInsert(
			ResumeCert resumeCert,
			HttpSession session){
		
		System.out.println("resumeCert /resumeCertInsert : " + resumeCert);
		resumeCert.setInfoMemberId((String) session.getAttribute("memberLoginId"));
		resumeCertService.resumeCertInsert(resumeCert);
		return "redirect:/resumeDetail";
	}
	
	// 이력서 자격증정보 수정
	@RequestMapping(value="/resumeCertUpdate")
	public String resumeCertUpdate(
			ResumeCert resumeCert,
			HttpSession session){
		
		System.out.println("resumeCert /resumeCertUpdate : " + resumeCert);
		resumeCert.setInfoMemberId((String) session.getAttribute("memberLoginId"));
		resumeCertService.resumeCertUpdate(resumeCert);
		return "redirect:/resumeDetail";
	}
	
}

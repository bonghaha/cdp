package com.to.cdp.act.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.act.model.ActCert;
import com.to.cdp.act.service.ActCertService;

@Controller
public class ActCertController {
	@Autowired
	private ActCertService actCertService;
	
	// 1. actCertInsert
	@RequestMapping(value="/actCertInsert", method=RequestMethod.GET)
	public String actCertInsert(){
		return "actCertInsert";
	}
	
	@RequestMapping(value="/actCertInsert", method=RequestMethod.POST)
	public String actCertInsert(ActCert actCert){
		return "actCertDetail";
	}
	
	// 2. actCertUpdate
	@RequestMapping(value="/actCertUpdate", method=RequestMethod.GET)
	public String actCertUpdate(){
		return "actCertUpdate";
	}
	
	@RequestMapping(value="/actCertUpdate", method=RequestMethod.POST)
	public String actCertUpdate(ActCert actCert){
		return "actCertDetail";
	}
	
	// 3. actCertDelete
	@RequestMapping(value="/actCertDelete", method=RequestMethod.GET)
	public String actCertDelete(){
		return "actCertDelete";
	}
	
	@RequestMapping(value="/actCertDelete", method=RequestMethod.POST)
	public String actCertDelete(ActCert actCert){
		return "redirect:/actCertList";
	}
	
	// 4. actCertList
	@RequestMapping(value="/actCertList", method=RequestMethod.GET)
	public String actCertList(){
		return "actCertList";
	}
	
	@RequestMapping(value="/actCertList", method=RequestMethod.POST)
	public String actCertList(ActCert actCert){
		return "actCertList";
	}
	
	// 5. actCertDetail
	@RequestMapping(value="/actCertDetail", method=RequestMethod.GET)
	public String actCertDetail(){
		return "actCertDetail";
	}
	
	@RequestMapping(value="/actCertDetail", method=RequestMethod.POST)
	public String actCertDetail(ActCert actCert){
		return "actCertDetail";
	}
}
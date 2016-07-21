package com.to.cdp.plan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.plan.model.PlanCert;
import com.to.cdp.plan.service.PlanCertService;

@Controller
public class PlanCertController {
	@Autowired
	private PlanCertService planCertService;
	
	// 1. planCertInsert
	@RequestMapping(value="/planCertInsert", method=RequestMethod.GET)
	public String planCertInsert(){
		return "planCertInsert";
	}
	
	@RequestMapping(value="/planCertInsert", method=RequestMethod.POST)
	public String planCertInsert(PlanCert planCert){
		return "planCertDetail";
	}
	
	// 2. planCertUpdate
	@RequestMapping(value="/planCertUpdate", method=RequestMethod.GET)
	public String planCertUpdate(){
		return "planCertUpdate";
	}
	
	@RequestMapping(value="/planCertUpdate", method=RequestMethod.POST)
	public String planCertUpdate(PlanCert planCert){
		return "planCertDetail";
	}
	
	// 3. planCertDelete
	@RequestMapping(value="/planCertDelete", method=RequestMethod.GET)
	public String planCertDelete(){
		return "planCertDelete";
	}
	
	@RequestMapping(value="/planCertDelete", method=RequestMethod.POST)
	public String planCertDelete(PlanCert planCert){
		return "redirect:/planCertList";
	}
	
	// 4. planCertList
	@RequestMapping(value="/planCertList", method=RequestMethod.GET)
	public String planCertList(){
		return "planCertList";
	}
	
	@RequestMapping(value="/planCertList", method=RequestMethod.POST)
	public String planCertList(PlanCert planCert){
		return "planCertList";
	}
	
	// 5. planCertDetail
	@RequestMapping(value="/planCertDetail", method=RequestMethod.GET)
	public String planCertDetail(){
		return "planCertDetail";
	}
	
	@RequestMapping(value="/planCertDetail", method=RequestMethod.POST)
	public String planCertDetail(PlanCert planCert){
		return "planCertDetail";
	}
}
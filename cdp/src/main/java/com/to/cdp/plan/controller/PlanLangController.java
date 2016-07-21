package com.to.cdp.plan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.plan.model.PlanLang;
import com.to.cdp.plan.service.PlanLangService;

@Controller
public class PlanLangController {
	@Autowired
	private PlanLangService planLangService;
	
	// 1. planLangInsert
	@RequestMapping(value="/planLangInsert", method=RequestMethod.GET)
	public String planLangInsert(){
		return "planLangInsert";
	}
	
	@RequestMapping(value="/planLangInsert", method=RequestMethod.POST)
	public String planLangInsert(PlanLang planLang){
		return "planLangDetail";
	}
	
	// 2. planLangUpdate
	@RequestMapping(value="/planLangUpdate", method=RequestMethod.GET)
	public String planLangUpdate(){
		return "planLangUpdate";
	}
	
	@RequestMapping(value="/planLangUpdate", method=RequestMethod.POST)
	public String planLangUpdate(PlanLang planLang){
		return "planLangDetail";
	}
	
	// 3. planLangDelete
	@RequestMapping(value="/planLangDelete", method=RequestMethod.GET)
	public String planLangDelete(){
		return "planLangDelete";
	}
	
	@RequestMapping(value="/planLangDelete", method=RequestMethod.POST)
	public String planLangDelete(PlanLang planLang){
		return "redirect:/planLangList";
	}
	
	// 4. planLangList
	@RequestMapping(value="/planLangList", method=RequestMethod.GET)
	public String planLangList(){
		return "planLangList";
	}
	
	@RequestMapping(value="/planLangList", method=RequestMethod.POST)
	public String planLangList(PlanLang planLang){
		return "planLangList";
	}
	
	// 5. planLangDetail
	@RequestMapping(value="/planLangDetail", method=RequestMethod.GET)
	public String planLangDetail(){
		return "planLangDetail";
	}
	
	@RequestMapping(value="/planLangDetail", method=RequestMethod.POST)
	public String planLangDetail(PlanLang planLang){
		return "planLangDetail";
	}
}
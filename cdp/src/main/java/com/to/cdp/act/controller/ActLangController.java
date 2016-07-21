package com.to.cdp.act.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.act.model.ActLang;
import com.to.cdp.act.service.ActLangService;

@Controller
public class ActLangController {
	@Autowired
	private ActLangService actLangService;
	
	// 1. actLangInsert
	@RequestMapping(value="/actLangInsert", method=RequestMethod.GET)
	public String actLangInsert(){
		return "actLangInsert";
	}
	
	@RequestMapping(value="/actLangInsert", method=RequestMethod.POST)
	public String actLangInsert(ActLang actLang){
		return "actLangDetail";
	}
	
	// 2. actLangUpdate
	@RequestMapping(value="/actLangUpdate", method=RequestMethod.GET)
	public String actLangUpdate(){
		return "actLangUpdate";
	}
	
	@RequestMapping(value="/actLangUpdate", method=RequestMethod.POST)
	public String actLangUpdate(ActLang actLang){
		return "actLangDetail";
	}
	
	// 3. actLangDelete
	@RequestMapping(value="/actLangDelete", method=RequestMethod.GET)
	public String actLangDelete(){
		return "actLangDelete";
	}
	
	@RequestMapping(value="/actLangDelete", method=RequestMethod.POST)
	public String actLangDelete(ActLang actLang){
		return "redirect:/actLangList";
	}
	
	// 4. actLangList
	@RequestMapping(value="/actLangList", method=RequestMethod.GET)
	public String actLangList(){
		return "actLangList";
	}
	
	@RequestMapping(value="/actLangList", method=RequestMethod.POST)
	public String actLangList(ActLang actLang){
		return "actLangList";
	}
	
	// 5. actLangDetail
	@RequestMapping(value="/actLangDetail", method=RequestMethod.GET)
	public String actLangDetail(){
		return "actLangDetail";
	}
	
	@RequestMapping(value="/actLangDetail", method=RequestMethod.POST)
	public String actLangDetail(ActLang actLang){
		return "actLangDetail";
	}
}
package com.to.cdp.rec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.rec.model.RecLang;
import com.to.cdp.rec.service.RecLangService;

@Controller
public class RecLangController {
	@Autowired
	private RecLangService recLangService;
	
	// 1. recLangInsert
	@RequestMapping(value="/recLangInsert", method=RequestMethod.GET)
	public String recLangInsert(){
		return "recLangInsert";
	}
	
	@RequestMapping(value="/recLangInsert", method=RequestMethod.POST)
	public String recLangInsert(RecLang recLang){
		return "recLangDetail";
	}
	
	// 2. recLangUpdate
	@RequestMapping(value="/recLangUpdate", method=RequestMethod.GET)
	public String recLangUpdate(){
		return "recLangUpdate";
	}
	
	@RequestMapping(value="/recLangUpdate", method=RequestMethod.POST)
	public String recLangUpdate(RecLang recLang){
		return "recLangDetail";
	}
	
	// 3. recLangDelete
	@RequestMapping(value="/recLangDelete", method=RequestMethod.GET)
	public String recLangDelete(){
		return "recLangDelete";
	}
	
	@RequestMapping(value="/recLangDelete", method=RequestMethod.POST)
	public String recLangDelete(RecLang recLang){
		return "redirect:/recLangList";
	}
	
	// 4. recLangList
	@RequestMapping(value="/recLangList", method=RequestMethod.GET)
	public String recLangList(){
		return "recLangList";
	}
	
	@RequestMapping(value="/recLangList", method=RequestMethod.POST)
	public String recLangList(RecLang recLang){
		return "recLangList";
	}
	
	// 5. recLangDetail
	@RequestMapping(value="/recLangDetail", method=RequestMethod.GET)
	public String recLangDetail(){
		return "recLangDetail";
	}
	
	@RequestMapping(value="/recLangDetail", method=RequestMethod.POST)
	public String recLangDetail(RecLang recLang){
		return "recLangDetail";
	}
}
package com.to.cdp.act.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.act.model.ActMento;
import com.to.cdp.act.service.ActMentoService;

@Controller
public class ActMentoController {
	@Autowired
	private ActMentoService actMentoService;
	
	// 1. actMentoInsert
	@RequestMapping(value="/actMentoInsert", method=RequestMethod.GET)
	public String actMentoInsert(){
		return "actMentoInsert";
	}
	
	@RequestMapping(value="/actMentoInsert", method=RequestMethod.POST)
	public String actMentoInsert(ActMento actMento){
		return "actMentoDetail";
	}
	
	// 2. actMentoUpdate
	@RequestMapping(value="/actMentoUpdate", method=RequestMethod.GET)
	public String actMentoUpdate(){
		return "actMentoUpdate";
	}
	
	@RequestMapping(value="/actMentoUpdate", method=RequestMethod.POST)
	public String actMentoUpdate(ActMento actMento){
		return "actMentoDetail";
	}
	
	// 3. actMentoDelete
	@RequestMapping(value="/actMentoDelete", method=RequestMethod.GET)
	public String actMentoDelete(){
		return "actMentoDelete";
	}
	
	@RequestMapping(value="/actMentoDelete", method=RequestMethod.POST)
	public String actMentoDelete(ActMento actMento){
		return "redirect:/actMentoList";
	}
	
	// 4. actMentoList
	@RequestMapping(value="/actMentoList", method=RequestMethod.GET)
	public String actMentoList(){
		return "actMentoList";
	}
	
	@RequestMapping(value="/actMentoList", method=RequestMethod.POST)
	public String actMentoList(ActMento actMento){
		return "actMentoList";
	}
	
	// 5. actMentoDetail
	@RequestMapping(value="/actMentoDetail", method=RequestMethod.GET)
	public String actMentoDetail(){
		return "actMentoDetail";
	}
	
	@RequestMapping(value="/actMentoDetail", method=RequestMethod.POST)
	public String actMentoDetail(ActMento actMento){
		return "actMentoDetail";
	}
}
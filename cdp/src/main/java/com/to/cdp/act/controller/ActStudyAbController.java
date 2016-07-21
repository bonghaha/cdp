package com.to.cdp.act.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.act.model.ActStudyAb;
import com.to.cdp.act.service.ActStudyAbService;

@Controller
public class ActStudyAbController {
	@Autowired
	private ActStudyAbService actStudyAbService;
	
	// 1. actStudyAbInsert
	@RequestMapping(value="/actStudyAbInsert", method=RequestMethod.GET)
	public String actStudyAbInsert(){
		return "actStudyAbInsert";
	}
	
	@RequestMapping(value="/actStudyAbInsert", method=RequestMethod.POST)
	public String actStudyAbInsert(ActStudyAb actStudyAb){
		return "actStudyAbDetail";
	}
	
	// 2. actStudyAbUpdate
	@RequestMapping(value="/actStudyAbUpdate", method=RequestMethod.GET)
	public String actStudyAbUpdate(){
		return "actStudyAbUpdate";
	}
	
	@RequestMapping(value="/actStudyAbUpdate", method=RequestMethod.POST)
	public String actStudyAbUpdate(ActStudyAb actStudyAb){
		return "actStudyAbDetail";
	}
	
	// 3. actStudyAbDelete
	@RequestMapping(value="/actStudyAbDelete", method=RequestMethod.GET)
	public String actStudyAbDelete(){
		return "actStudyAbDelete";
	}
	
	@RequestMapping(value="/actStudyAbDelete", method=RequestMethod.POST)
	public String actStudyAbDelete(ActStudyAb actStudyAb){
		return "redirect:/actStudyAbList";
	}
	
	// 4. actStudyAbList
	@RequestMapping(value="/actStudyAbList", method=RequestMethod.GET)
	public String actStudyAbList(){
		return "actStudyAbList";
	}
	
	@RequestMapping(value="/actStudyAbList", method=RequestMethod.POST)
	public String actStudyAbList(ActStudyAb actStudyAb){
		return "actStudyAbList";
	}
	
	// 5. actStudyAbDetail
	@RequestMapping(value="/actStudyAbDetail", method=RequestMethod.GET)
	public String actStudyAbDetail(){
		return "actStudyAbDetail";
	}
	
	@RequestMapping(value="/actStudyAbDetail", method=RequestMethod.POST)
	public String actStudyAbDetail(ActStudyAb actStudyAb){
		return "actStudyAbDetail";
	}
}
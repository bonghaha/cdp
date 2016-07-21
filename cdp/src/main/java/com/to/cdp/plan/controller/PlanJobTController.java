package com.to.cdp.plan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.plan.model.PlanJobT;
import com.to.cdp.plan.service.PlanJobTService;

@Controller
public class PlanJobTController {
	@Autowired
	private PlanJobTService planJobTService;
	
	// 1. planJobTInsert
	@RequestMapping(value="/planJobTInsert", method=RequestMethod.GET)
	public String planJobTInsert(){
		return "planJobTInsert";
	}
	
	@RequestMapping(value="/planJobTInsert", method=RequestMethod.POST)
	public String planJobTInsert(PlanJobT planJobT){
		return "planJobTDetail";
	}
	
	// 2. planJobTUpdate
	@RequestMapping(value="/planJobTUpdate", method=RequestMethod.GET)
	public String planJobTUpdate(){
		return "planJobTUpdate";
	}
	
	@RequestMapping(value="/planJobTUpdate", method=RequestMethod.POST)
	public String planJobTUpdate(PlanJobT planJobT){
		return "planJobTDetail";
	}
	
	// 3. planJobTDelete
	@RequestMapping(value="/planJobTDelete", method=RequestMethod.GET)
	public String planJobTDelete(){
		return "planJobTDelete";
	}
	
	@RequestMapping(value="/planJobTDelete", method=RequestMethod.POST)
	public String planJobTDelete(PlanJobT planJobT){
		return "redirect:/planJobTList";
	}
	
	// 4. planJobTList
	@RequestMapping(value="/planJobTList", method=RequestMethod.GET)
	public String planJobTList(){
		return "planJobTList";
	}
	
	@RequestMapping(value="/planJobTList", method=RequestMethod.POST)
	public String planJobTList(PlanJobT planJobT){
		return "planJobTList";
	}
	
	// 5. planJobTDetail
	@RequestMapping(value="/planJobTDetail", method=RequestMethod.GET)
	public String planJobTDetail(){
		return "planJobTDetail";
	}
	
	@RequestMapping(value="/planJobTDetail", method=RequestMethod.POST)
	public String planJobTDetail(PlanJobT planJobT){
		return "planJobTDetail";
	}
}
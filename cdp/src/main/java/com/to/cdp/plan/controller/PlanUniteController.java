package com.to.cdp.plan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.plan.service.PlanUniteService;

@Controller
public class PlanUniteController {
	@Autowired
	private PlanUniteService planUniteService;
	
	// 1. planUniteInsert
	@RequestMapping(value="/planUniteInsert", method=RequestMethod.GET)
	public String planUniteInsert(){
		return "planUniteInsert";
	}
	
	@RequestMapping(value="/planUniteInsert", method=RequestMethod.POST)
	public String planUniteInsert(PlanUnite planUnite){
		return "planUniteDetail";
	}
	
	// 2. planUniteUpdate
	@RequestMapping(value="/planUniteUpdate", method=RequestMethod.GET)
	public String planUniteUpdate(){
		return "planUniteUpdate";
	}
	
	@RequestMapping(value="/planUniteUpdate", method=RequestMethod.POST)
	public String planUniteUpdate(PlanUnite planUnite){
		return "planUniteDetail";
	}
	
	// 3. planUniteDelete
	@RequestMapping(value="/planUniteDelete", method=RequestMethod.GET)
	public String planUniteDelete(){
		return "planUniteDelete";
	}
	
	@RequestMapping(value="/planUniteDelete", method=RequestMethod.POST)
	public String planUniteDelete(PlanUnite planUnite){
		return "redirect:/planUniteList";
	}
	
	// 4. planUniteList
	@RequestMapping(value="/planUniteList", method=RequestMethod.GET)
	public String planUniteList(){
		return "planUniteList";
	}
	
	@RequestMapping(value="/planUniteList", method=RequestMethod.POST)
	public String planUniteList(PlanUnite planUnite){
		return "planUniteList";
	}
	
	// 5. planUniteDetail
	@RequestMapping(value="/planUniteDetail", method=RequestMethod.GET)
	public String planUniteDetail(){
		return "planUniteDetail";
	}
	
	@RequestMapping(value="/planUniteDetail", method=RequestMethod.POST)
	public String planUniteDetail(PlanUnite planUnite){
		return "planUniteDetail";
	}
}
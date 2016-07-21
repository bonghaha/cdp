package com.to.cdp.plan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.plan.model.PlanStudyAb;
import com.to.cdp.plan.service.PlanStudyAbService;

@Controller
public class PlanStudyAbController {
	@Autowired
	private PlanStudyAbService planStudyAbService;
	
	// 1. planStudyAbInsert
	@RequestMapping(value="/planStudyAbInsert", method=RequestMethod.GET)
	public String planStudyAbInsert(){
		return "planStudyAbInsert";
	}
	
	@RequestMapping(value="/planStudyAbInsert", method=RequestMethod.POST)
	public String planStudyAbInsert(PlanStudyAb planStudyAb){
		return "planStudyAbDetail";
	}
	
	// 2. planStudyAbUpdate
	@RequestMapping(value="/planStudyAbUpdate", method=RequestMethod.GET)
	public String planStudyAbUpdate(){
		return "planStudyAbUpdate";
	}
	
	@RequestMapping(value="/planStudyAbUpdate", method=RequestMethod.POST)
	public String planStudyAbUpdate(PlanStudyAb planStudyAb){
		return "planStudyAbDetail";
	}
	
	// 3. planStudyAbDelete
	@RequestMapping(value="/planStudyAbDelete", method=RequestMethod.GET)
	public String planStudyAbDelete(){
		return "planStudyAbDelete";
	}
	
	@RequestMapping(value="/planStudyAbDelete", method=RequestMethod.POST)
	public String planStudyAbDelete(PlanStudyAb planStudyAb){
		return "redirect:/planStudyAbList";
	}
	
	// 4. planStudyAbList
	@RequestMapping(value="/planStudyAbList", method=RequestMethod.GET)
	public String planStudyAbList(){
		return "planStudyAbList";
	}
	
	@RequestMapping(value="/planStudyAbList", method=RequestMethod.POST)
	public String planStudyAbList(PlanStudyAb planStudyAb){
		return "planStudyAbList";
	}
	
	// 5. planStudyAbDetail
	@RequestMapping(value="/planStudyAbDetail", method=RequestMethod.GET)
	public String planStudyAbDetail(){
		return "planStudyAbDetail";
	}
	
	@RequestMapping(value="/planStudyAbDetail", method=RequestMethod.POST)
	public String planStudyAbDetail(PlanStudyAb planStudyAb){
		return "planStudyAbDetail";
	}
}
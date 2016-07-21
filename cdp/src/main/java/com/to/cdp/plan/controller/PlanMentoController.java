package com.to.cdp.plan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.plan.model.PlanMento;
import com.to.cdp.plan.service.PlanBookService;


@Controller
public class PlanMentoController {
	@Autowired
	private PlanBookService planMentoService;
	
	// 1. planMentoInsert
	@RequestMapping(value="/planMentoInsert", method=RequestMethod.GET)
	public String planMentoInsert(){
		return "planMentoInsert";
	}
	
	@RequestMapping(value="/planMentoInsert", method=RequestMethod.POST)
	public String planMentoInsert(PlanMento planMento){
		return "planMentoDetail";
	}
	
	// 2. planMentoUpdate
	@RequestMapping(value="/planMentoUpdate", method=RequestMethod.GET)
	public String planMentoUpdate(){
		return "planMentoUpdate";
	}
	
	@RequestMapping(value="/planMentoUpdate", method=RequestMethod.POST)
	public String planMentoUpdate(PlanMento planMento){
		return "planMentoDetail";
	}
	
	// 3. planMentoDelete
	@RequestMapping(value="/planMentoDelete", method=RequestMethod.GET)
	public String planMentoDelete(){
		return "planMentoDelete";
	}
	
	@RequestMapping(value="/planMentoDelete", method=RequestMethod.POST)
	public String planMentoDelete(PlanMento planMento){
		return "redirect:/planMentoList";
	}
	
	// 4. planMentoList
	@RequestMapping(value="/planMentoList", method=RequestMethod.GET)
	public String planMentoList(){
		return "planMentoList";
	}
	
	@RequestMapping(value="/planMentoList", method=RequestMethod.POST)
	public String planMentoList(PlanMento planMento){
		return "planMentoList";
	}
	
	// 5. planMentoDetail
	@RequestMapping(value="/planMentoDetail", method=RequestMethod.GET)
	public String planMentoDetail(){
		return "planMentoDetail";
	}
	
	@RequestMapping(value="/planMentoDetail", method=RequestMethod.POST)
	public String planMentoDetail(PlanMento planMento){
		return "planMentoDetail";
	}
}
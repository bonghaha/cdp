package com.to.cdp.plan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.plan.model.PlanVolun;
import com.to.cdp.plan.service.PlanVolunService;

@Controller
public class PlanVolunController {
	@Autowired
	private PlanVolunService planVolunService;
	
	// 1. planVolunInsert
	@RequestMapping(value="/planVolunInsert", method=RequestMethod.GET)
	public String planVolunInsert(){
		return "planVolunInsert";
	}
	
	@RequestMapping(value="/planVolunInsert", method=RequestMethod.POST)
	public String planVolunInsert(PlanVolun planVolun){
		return "planVolunDetail";
	}
	
	// 2. planVolunUpdate
	@RequestMapping(value="/planVolunUpdate", method=RequestMethod.GET)
	public String planVolunUpdate(){
		return "planVolunUpdate";
	}
	
	@RequestMapping(value="/planVolunUpdate", method=RequestMethod.POST)
	public String planVolunUpdate(PlanVolun planVolun){
		return "planVolunDetail";
	}
	
	// 3. planVolunDelete
	@RequestMapping(value="/planVolunDelete", method=RequestMethod.GET)
	public String planVolunDelete(){
		return "planVolunDelete";
	}
	
	@RequestMapping(value="/planVolunDelete", method=RequestMethod.POST)
	public String planVolunDelete(PlanVolun planVolun){
		return "redirect:/planVolunList";
	}
	
	// 4. planVolunList
	@RequestMapping(value="/planVolunList", method=RequestMethod.GET)
	public String planVolunList(){
		return "planVolunList";
	}
	
	@RequestMapping(value="/planVolunList", method=RequestMethod.POST)
	public String planVolunList(PlanVolun planVolun){
		return "planVolunList";
	}
	
	// 5. planVolunDetail
	@RequestMapping(value="/planVolunDetail", method=RequestMethod.GET)
	public String planVolunDetail(){
		return "planVolunDetail";
	}
	
	@RequestMapping(value="/planVolunDetail", method=RequestMethod.POST)
	public String planVolunDetail(PlanVolun planVolun){
		return "planVolunDetail";
	}
}
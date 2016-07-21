package com.to.cdp.plan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.plan.model.PlanDept;
import com.to.cdp.plan.service.PlanDeptService;

@Controller
public class PlanDeptController {
	@Autowired
	private PlanDeptService planDeptService;
	
	// 1. planDeptInsert
	@RequestMapping(value="/planDeptInsert", method=RequestMethod.GET)
	public String planDeptInsert(){
		return "planDeptInsert";
	}
	
	@RequestMapping(value="/planDeptInsert", method=RequestMethod.POST)
	public String planDeptInsert(PlanDept planDept){
		return "planDeptDetail";
	}
	
	// 2. planDeptUpdate
	@RequestMapping(value="/planDeptUpdate", method=RequestMethod.GET)
	public String planDeptUpdate(){
		return "planDeptUpdate";
	}
	
	@RequestMapping(value="/planDeptUpdate", method=RequestMethod.POST)
	public String planDeptUpdate(PlanDept planDept){
		return "planDeptDetail";
	}
	
	// 3. planDeptDelete
	@RequestMapping(value="/planDeptDelete", method=RequestMethod.GET)
	public String planDeptDelete(){
		return "planDeptDelete";
	}
	
	@RequestMapping(value="/planDeptDelete", method=RequestMethod.POST)
	public String planDeptDelete(PlanDept planDept){
		return "redirect:/planDeptList";
	}
	
	// 4. planDeptList
	@RequestMapping(value="/planDeptList", method=RequestMethod.GET)
	public String planDeptList(){
		return "planDeptList";
	}
	
	@RequestMapping(value="/planDeptList", method=RequestMethod.POST)
	public String planDeptList(PlanDept planDept){
		return "planDeptList";
	}
	
	// 5. planDeptDetail
	@RequestMapping(value="/planDeptDetail", method=RequestMethod.GET)
	public String planDeptDetail(){
		return "planDeptDetail";
	}
	
	@RequestMapping(value="/planDeptDetail", method=RequestMethod.POST)
	public String planDeptDetail(PlanDept planDept){
		return "planDeptDetail";
	}
}
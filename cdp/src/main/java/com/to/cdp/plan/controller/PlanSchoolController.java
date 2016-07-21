package com.to.cdp.plan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.plan.model.PlanSchool;
import com.to.cdp.plan.service.PlanSchoolService;

@Controller
public class PlanSchoolController {
	@Autowired
	private PlanSchoolService planSchoolService;
	
	// 1. planSchoolInsert
	@RequestMapping(value="/planSchoolInsert", method=RequestMethod.GET)
	public String planSchoolInsert(){
		return "planSchoolInsert";
	}
	
	@RequestMapping(value="/planSchoolInsert", method=RequestMethod.POST)
	public String planSchoolInsert(PlanSchool planSchool){
		return "planSchoolDetail";
	}
	
	// 2. planSchoolUpdate
	@RequestMapping(value="/planSchoolUpdate", method=RequestMethod.GET)
	public String planSchoolUpdate(){
		return "planSchoolUpdate";
	}
	
	@RequestMapping(value="/planSchoolUpdate", method=RequestMethod.POST)
	public String planSchoolUpdate(PlanSchool planSchool){
		return "planSchoolDetail";
	}
	
	// 3. planSchoolDelete
	@RequestMapping(value="/planSchoolDelete", method=RequestMethod.GET)
	public String planSchoolDelete(){
		return "planSchoolDelete";
	}
	
	@RequestMapping(value="/planSchoolDelete", method=RequestMethod.POST)
	public String planSchoolDelete(PlanSchool planSchool){
		return "redirect:/planSchoolList";
	}
	
	// 4. planSchoolList
	@RequestMapping(value="/planSchoolList", method=RequestMethod.GET)
	public String planSchoolList(){
		return "planSchoolList";
	}
	
	@RequestMapping(value="/planSchoolList", method=RequestMethod.POST)
	public String planSchoolList(PlanSchool planSchool){
		return "planSchoolList";
	}
	
	// 5. planSchoolDetail
	@RequestMapping(value="/planSchoolDetail", method=RequestMethod.GET)
	public String planSchoolDetail(){
		return "planSchoolDetail";
	}
	
	@RequestMapping(value="/planSchoolDetail", method=RequestMethod.POST)
	public String planSchoolDetail(PlanSchool planSchool){
		return "planSchoolDetail";
	}
}
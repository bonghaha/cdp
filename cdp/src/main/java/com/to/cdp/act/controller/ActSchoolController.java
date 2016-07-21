package com.to.cdp.act.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.act.model.ActSchool;
import com.to.cdp.act.service.ActSchoolService;

@Controller
public class ActSchoolController {
	@Autowired
	private ActSchoolService actSchoolService;
	
	// 1. actSchoolInsert
	@RequestMapping(value="/actSchoolInsert", method=RequestMethod.GET)
	public String actSchoolInsert(){
		return "actSchoolInsert";
	}
	
	@RequestMapping(value="/actSchoolInsert", method=RequestMethod.POST)
	public String actSchoolInsert(ActSchool actSchool){
		return "actSchoolDetail";
	}
	
	// 2. actSchoolUpdate
	@RequestMapping(value="/actSchoolUpdate", method=RequestMethod.GET)
	public String actSchoolUpdate(){
		return "actSchoolUpdate";
	}
	
	@RequestMapping(value="/actSchoolUpdate", method=RequestMethod.POST)
	public String actSchoolUpdate(ActSchool actSchool){
		return "actSchoolDetail";
	}
	
	// 3. actSchoolDelete
	@RequestMapping(value="/actSchoolDelete", method=RequestMethod.GET)
	public String actSchoolDelete(){
		return "actSchoolDelete";
	}
	
	@RequestMapping(value="/actSchoolDelete", method=RequestMethod.POST)
	public String actSchoolDelete(ActSchool actSchool){
		return "redirect:/actSchoolList";
	}
	
	// 4. actSchoolList
	@RequestMapping(value="/actSchoolList", method=RequestMethod.GET)
	public String actSchoolList(){
		return "actSchoolList";
	}
	
	@RequestMapping(value="/actSchoolList", method=RequestMethod.POST)
	public String actSchoolList(ActSchool actSchool){
		return "actSchoolList";
	}
	
	// 5. actSchoolDetail
	@RequestMapping(value="/actSchoolDetail", method=RequestMethod.GET)
	public String actSchoolDetail(){
		return "actSchoolDetail";
	}
	
	@RequestMapping(value="/actSchoolDetail", method=RequestMethod.POST)
	public String actSchoolDetail(ActSchool actSchool){
		return "actSchoolDetail";
	}
}
package com.to.cdp.rec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.rec.model.RecSchool;
import com.to.cdp.rec.service.RecSchoolService;

@Controller
public class RecSchoolController {
	@Autowired
	private RecSchoolService recSchoolService;
	
	// 1. recSchoolInsert
	@RequestMapping(value="/recSchoolInsert", method=RequestMethod.GET)
	public String recSchoolInsert(){
		return "recSchoolInsert";
	}
	
	@RequestMapping(value="/recSchoolInsert", method=RequestMethod.POST)
	public String recSchoolInsert(RecSchool recSchool){
		return "recSchoolDetail";
	}
	
	// 2. recSchoolUpdate
	@RequestMapping(value="/recSchoolUpdate", method=RequestMethod.GET)
	public String recSchoolUpdate(){
		return "recSchoolUpdate";
	}
	
	@RequestMapping(value="/recSchoolUpdate", method=RequestMethod.POST)
	public String recSchoolUpdate(RecSchool recSchool){
		return "recSchoolDetail";
	}
	
	// 3. recSchoolDelete
	@RequestMapping(value="/recSchoolDelete", method=RequestMethod.GET)
	public String recSchoolDelete(){
		return "recSchoolDelete";
	}
	
	@RequestMapping(value="/recSchoolDelete", method=RequestMethod.POST)
	public String recSchoolDelete(RecSchool recSchool){
		return "redirect:/recSchoolList";
	}
	
	// 4. recSchoolList
	@RequestMapping(value="/recSchoolList", method=RequestMethod.GET)
	public String recSchoolList(){
		return "recSchoolList";
	}
	
	@RequestMapping(value="/recSchoolList", method=RequestMethod.POST)
	public String recSchoolList(RecSchool recSchool){
		return "recSchoolList";
	}
	
	// 5. recSchoolDetail
	@RequestMapping(value="/recSchoolDetail", method=RequestMethod.GET)
	public String recSchoolDetail(){
		return "recSchoolDetail";
	}
	
	@RequestMapping(value="/recSchoolDetail", method=RequestMethod.POST)
	public String recSchoolDetail(RecSchool recSchool){
		return "recSchoolDetail";
	}
}
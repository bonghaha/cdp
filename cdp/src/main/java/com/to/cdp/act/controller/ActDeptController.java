package com.to.cdp.act.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.act.model.ActDept;
import com.to.cdp.act.service.ActDeptService;

@Controller
public class ActDeptController {
	@Autowired
	private ActDeptService actDeptService;
	
	// 1. actDeptInsert
	@RequestMapping(value="/actDeptInsert", method=RequestMethod.GET)
	public String actDeptInsert(){
		return "actDeptInsert";
	}
	
	@RequestMapping(value="/actDeptInsert", method=RequestMethod.POST)
	public String actDeptInsert(ActDept actDept){
		return "actDeptDetail";
	}
	
	// 2. actDeptUpdate
	@RequestMapping(value="/actDeptUpdate", method=RequestMethod.GET)
	public String actDeptUpdate(){
		return "actDeptUpdate";
	}
	
	@RequestMapping(value="/actDeptUpdate", method=RequestMethod.POST)
	public String actDeptUpdate(ActDept actDept){
		return "actDeptDetail";
	}
	
	// 3. actDeptDelete
	@RequestMapping(value="/actDeptDelete", method=RequestMethod.GET)
	public String actDeptDelete(){
		return "actDeptDelete";
	}
	
	@RequestMapping(value="/actDeptDelete", method=RequestMethod.POST)
	public String actDeptDelete(ActDept actDept){
		return "redirect:/actDeptList";
	}
	
	// 4. actDeptList
	@RequestMapping(value="/actDeptList", method=RequestMethod.GET)
	public String actDeptList(){
		return "actDeptList";
	}
	
	@RequestMapping(value="/actDeptList", method=RequestMethod.POST)
	public String actDeptList(ActDept actDept){
		return "actDeptList";
	}
	
	// 5. actDeptDetail
	@RequestMapping(value="/actDeptDetail", method=RequestMethod.GET)
	public String actDeptDetail(){
		return "actDeptDetail";
	}
	
	@RequestMapping(value="/actDeptDetail", method=RequestMethod.POST)
	public String actDeptDetail(ActDept actDept){
		return "actDeptDetail";
	}
}
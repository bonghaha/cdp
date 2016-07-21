package com.to.cdp.rec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.rec.model.RecDept;
import com.to.cdp.rec.service.RecDeptService;

@Controller
public class RecDeptController {
	@Autowired
	private RecDeptService recDeptService;
	
	// 1. recDeptInsert
	@RequestMapping(value="/recDeptInsert", method=RequestMethod.GET)
	public String recDeptInsert(){
		return "recDeptInsert";
	}
	
	@RequestMapping(value="/recDeptInsert", method=RequestMethod.POST)
	public String recDeptInsert(RecDept recDept){
		return "recDeptDetail";
	}
	
	// 2. recDeptUpdate
	@RequestMapping(value="/recDeptUpdate", method=RequestMethod.GET)
	public String recDeptUpdate(){
		return "recDeptUpdate";
	}
	
	@RequestMapping(value="/recDeptUpdate", method=RequestMethod.POST)
	public String recDeptUpdate(RecDept recDept){
		return "recDeptDetail";
	}
	
	// 3. recDeptDelete
	@RequestMapping(value="/recDeptDelete", method=RequestMethod.GET)
	public String recDeptDelete(){
		return "recDeptDelete";
	}
	
	@RequestMapping(value="/recDeptDelete", method=RequestMethod.POST)
	public String recDeptDelete(RecDept recDept){
		return "redirect:/recDeptList";
	}
	
	// 4. recDeptList
	@RequestMapping(value="/recDeptList", method=RequestMethod.GET)
	public String recDeptList(){
		return "recDeptList";
	}
	
	@RequestMapping(value="/recDeptList", method=RequestMethod.POST)
	public String recDeptList(RecDept recDept){
		return "recDeptList";
	}
	
	// 5. recDeptDetail
	@RequestMapping(value="/recDeptDetail", method=RequestMethod.GET)
	public String recDeptDetail(){
		return "recDeptDetail";
	}
	
	@RequestMapping(value="/recDeptDetail", method=RequestMethod.POST)
	public String recDeptDetail(RecDept recDept){
		return "recDeptDetail";
	}
}
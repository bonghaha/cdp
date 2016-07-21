package com.to.cdp.act.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.act.model.ActJobT;
import com.to.cdp.act.service.ActJobTService;

@Controller
public class ActJobTController {
	@Autowired
	private ActJobTService actJobTService;
	
	// 1. actJobTInsert
	@RequestMapping(value="/actJobTInsert", method=RequestMethod.GET)
	public String actJobTInsert(){
		return "actJobTInsert";
	}
	
	@RequestMapping(value="/actJobTInsert", method=RequestMethod.POST)
	public String actJobTInsert(ActJobT actJobT){
		return "actJobTDetail";
	}
	
	// 2. actJobTUpdate
	@RequestMapping(value="/actJobTUpdate", method=RequestMethod.GET)
	public String actJobTUpdate(){
		return "actJobTUpdate";
	}
	
	@RequestMapping(value="/actJobTUpdate", method=RequestMethod.POST)
	public String actJobTUpdate(ActJobT actJobT){
		return "actJobTDetail";
	}
	
	// 3. actJobTDelete
	@RequestMapping(value="/actJobTDelete", method=RequestMethod.GET)
	public String actJobTDelete(){
		return "actJobTDelete";
	}
	
	@RequestMapping(value="/actJobTDelete", method=RequestMethod.POST)
	public String actJobTDelete(ActJobT actJobT){
		return "redirect:/actJobTList";
	}
	
	// 4. actJobTList
	@RequestMapping(value="/actJobTList", method=RequestMethod.GET)
	public String actJobTList(){
		return "actJobTList";
	}
	
	@RequestMapping(value="/actJobTList", method=RequestMethod.POST)
	public String actJobTList(ActJobT actJobT){
		return "actJobTList";
	}
	
	// 5. actJobTDetail
	@RequestMapping(value="/actJobTDetail", method=RequestMethod.GET)
	public String actJobTDetail(){
		return "actJobTDetail";
	}
	
	@RequestMapping(value="/actJobTDetail", method=RequestMethod.POST)
	public String actJobTDetail(ActJobT actJobT){
		return "actJobTDetail";
	}
}
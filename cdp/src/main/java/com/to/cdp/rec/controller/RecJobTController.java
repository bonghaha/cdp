package com.to.cdp.rec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.rec.model.RecJobT;
import com.to.cdp.rec.service.RecJobTService;

@Controller
public class RecJobTController {
	@Autowired
	private RecJobTService recJobTService;
	
	// 1. recJobTInsert
	@RequestMapping(value="/recJobTInsert", method=RequestMethod.GET)
	public String recJobTInsert(){
		return "recJobTInsert";
	}
	
	@RequestMapping(value="/recJobTInsert", method=RequestMethod.POST)
	public String recJobTInsert(RecJobT recJobT){
		return "recJobTDetail";
	}
	
	// 2. recJobTUpdate
	@RequestMapping(value="/recJobTUpdate", method=RequestMethod.GET)
	public String recJobTUpdate(){
		return "recJobTUpdate";
	}
	
	@RequestMapping(value="/recJobTUpdate", method=RequestMethod.POST)
	public String recJobTUpdate(RecJobT recJobT){
		return "recJobTDetail";
	}
	
	// 3. recJobTDelete
	@RequestMapping(value="/recJobTDelete", method=RequestMethod.GET)
	public String recJobTDelete(){
		return "recJobTDelete";
	}
	
	@RequestMapping(value="/recJobTDelete", method=RequestMethod.POST)
	public String recJobTDelete(RecJobT recJobT){
		return "redirect:/recJobTList";
	}
	
	// 4. recJobTList
	@RequestMapping(value="/recJobTList", method=RequestMethod.GET)
	public String recJobTList(){
		return "recJobTList";
	}
	
	@RequestMapping(value="/recJobTList", method=RequestMethod.POST)
	public String recJobTList(RecJobT recJobT){
		return "recJobTList";
	}
	
	// 5. recJobTDetail
	@RequestMapping(value="/recJobTDetail", method=RequestMethod.GET)
	public String recJobTDetail(){
		return "recJobTDetail";
	}
	
	@RequestMapping(value="/recJobTDetail", method=RequestMethod.POST)
	public String recJobTDetail(RecJobT recJobT){
		return "recJobTDetail";
	}
}
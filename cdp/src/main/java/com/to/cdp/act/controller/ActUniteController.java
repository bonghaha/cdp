package com.to.cdp.act.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.act.model.ActUnite;
import com.to.cdp.act.service.ActUniteService;

@Controller
public class ActUniteController {
	@Autowired
	private ActUniteService actUniteService;
	
	// 1. actUniteInsert
	@RequestMapping(value="/actUniteInsert", method=RequestMethod.GET)
	public String actUniteInsert(){
		return "actUniteInsert";
	}
	
	@RequestMapping(value="/actUniteInsert", method=RequestMethod.POST)
	public String actUniteInsert(ActUnite actUnite){
		return "actUniteDetail";
	}
	
	// 2. actUniteUpdate
	@RequestMapping(value="/actUniteUpdate", method=RequestMethod.GET)
	public String actUniteUpdate(){
		return "actUniteUpdate";
	}
	
	@RequestMapping(value="/actUniteUpdate", method=RequestMethod.POST)
	public String actUniteUpdate(ActUnite actUnite){
		return "actUniteDetail";
	}
	
	// 3. actUniteDelete
	@RequestMapping(value="/actUniteDelete", method=RequestMethod.GET)
	public String actUniteDelete(){
		return "actUniteDelete";
	}
	
	@RequestMapping(value="/actUniteDelete", method=RequestMethod.POST)
	public String actUniteDelete(ActUnite actUnite){
		return "redirect:/actUniteList";
	}
	
	// 4. actUniteList
	@RequestMapping(value="/actUniteList", method=RequestMethod.GET)
	public String actUniteList(){
		return "actUniteList";
	}
	
	@RequestMapping(value="/actUniteList", method=RequestMethod.POST)
	public String actUniteList(ActUnite actUnite){
		return "actUniteList";
	}
	
	// 5. actUniteDetail
	@RequestMapping(value="/actUniteDetail", method=RequestMethod.GET)
	public String actUniteDetail(){
		return "actUniteDetail";
	}
	
	@RequestMapping(value="/actUniteDetail", method=RequestMethod.POST)
	public String actUniteDetail(ActUnite actUnite){
		return "actUniteDetail";
	}
}
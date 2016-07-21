package com.to.cdp.act.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.act.model.ActVolun;
import com.to.cdp.act.service.ActVolunService;

@Controller
public class ActVolunController {
	@Autowired
	private ActVolunService actVolunService;
	
	// 1. actVolunInsert
	@RequestMapping(value="/actVolunInsert", method=RequestMethod.GET)
	public String actVolunInsert(){
		return "actVolunInsert";
	}
	
	@RequestMapping(value="/actVolunInsert", method=RequestMethod.POST)
	public String actVolunInsert(ActVolun actVolun){
		return "actVolunDetail";
	}
	
	// 2. actVolunUpdate
	@RequestMapping(value="/actVolunUpdate", method=RequestMethod.GET)
	public String actVolunUpdate(){
		return "actVolunUpdate";
	}
	
	@RequestMapping(value="/actVolunUpdate", method=RequestMethod.POST)
	public String actVolunUpdate(ActVolun actVolun){
		return "actVolunDetail";
	}
	
	// 3. actVolunDelete
	@RequestMapping(value="/actVolunDelete", method=RequestMethod.GET)
	public String actVolunDelete(){
		return "actVolunDelete";
	}
	
	@RequestMapping(value="/actVolunDelete", method=RequestMethod.POST)
	public String actVolunDelete(ActVolun actVolun){
		return "redirect:/actVolunList";
	}
	
	// 4. actVolunList
	@RequestMapping(value="/actVolunList", method=RequestMethod.GET)
	public String actVolunList(){
		return "actVolunList";
	}
	
	@RequestMapping(value="/actVolunList", method=RequestMethod.POST)
	public String actVolunList(ActVolun actVolun){
		return "actVolunList";
	}
	
	// 5. actVolunDetail
	@RequestMapping(value="/actVolunDetail", method=RequestMethod.GET)
	public String actVolunDetail(){
		return "actVolunDetail";
	}
	
	@RequestMapping(value="/actVolunDetail", method=RequestMethod.POST)
	public String actVolunDetail(ActVolun actVolun){
		return "actVolunDetail";
	}
}
package com.to.cdp.rec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.rec.model.RecVolun;
import com.to.cdp.rec.service.RecVolunService;

@Controller
public class RecVolunController {
	@Autowired
	private RecVolunService recVolunService;
	
	// 1. recVolunInsert
	@RequestMapping(value="/recVolunInsert", method=RequestMethod.GET)
	public String recVolunInsert(){
		return "recVolunInsert";
	}
	
	@RequestMapping(value="/recVolunInsert", method=RequestMethod.POST)
	public String recVolunInsert(RecVolun recVolun){
		return "recVolunDetail";
	}
	
	// 2. recVolunUpdate
	@RequestMapping(value="/recVolunUpdate", method=RequestMethod.GET)
	public String recVolunUpdate(){
		return "recVolunUpdate";
	}
	
	@RequestMapping(value="/recVolunUpdate", method=RequestMethod.POST)
	public String recVolunUpdate(RecVolun recVolun){
		return "recVolunDetail";
	}
	
	// 3. recVolunDelete
	@RequestMapping(value="/recVolunDelete", method=RequestMethod.GET)
	public String recVolunDelete(){
		return "recVolunDelete";
	}
	
	@RequestMapping(value="/recVolunDelete", method=RequestMethod.POST)
	public String recVolunDelete(RecVolun recVolun){
		return "redirect:/recVolunList";
	}
	
	// 4. recVolunList
	@RequestMapping(value="/recVolunList", method=RequestMethod.GET)
	public String recVolunList(){
		return "recVolunList";
	}
	
	@RequestMapping(value="/recVolunList", method=RequestMethod.POST)
	public String recVolunList(RecVolun recVolun){
		return "recVolunList";
	}
	
	// 5. recVolunDetail
	@RequestMapping(value="/recVolunDetail", method=RequestMethod.GET)
	public String recVolunDetail(){
		return "recVolunDetail";
	}
	
	@RequestMapping(value="/recVolunDetail", method=RequestMethod.POST)
	public String recVolunDetail(RecVolun recVolun){
		return "recVolunDetail";
	}
}
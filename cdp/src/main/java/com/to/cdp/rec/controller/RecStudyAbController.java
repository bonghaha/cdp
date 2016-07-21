package com.to.cdp.rec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.rec.model.RecStudyAb;
import com.to.cdp.rec.service.RecStudyAbService;

@Controller
public class RecStudyAbController {
	@Autowired
	private RecStudyAbService recStudyAbService;
	
	// 1. recStudyAbInsert
	@RequestMapping(value="/recStudyAbInsert", method=RequestMethod.GET)
	public String recStudyAbInsert(){
		return "recStudyAbInsert";
	}
	
	@RequestMapping(value="/recStudyAbInsert", method=RequestMethod.POST)
	public String recStudyAbInsert(RecStudyAb recStudyAb){
		return "recStudyAbDetail";
	}
	
	// 2. recStudyAbUpdate
	@RequestMapping(value="/recStudyAbUpdate", method=RequestMethod.GET)
	public String recStudyAbUpdate(){
		return "recStudyAbUpdate";
	}
	
	@RequestMapping(value="/recStudyAbUpdate", method=RequestMethod.POST)
	public String recStudyAbUpdate(RecStudyAb recStudyAb){
		return "recStudyAbDetail";
	}
	
	// 3. recStudyAbDelete
	@RequestMapping(value="/recStudyAbDelete", method=RequestMethod.GET)
	public String recStudyAbDelete(){
		return "recStudyAbDelete";
	}
	
	@RequestMapping(value="/recStudyAbDelete", method=RequestMethod.POST)
	public String recStudyAbDelete(RecStudyAb recStudyAb){
		return "redirect:/recStudyAbList";
	}
	
	// 4. recStudyAbList
	@RequestMapping(value="/recStudyAbList", method=RequestMethod.GET)
	public String recStudyAbList(){
		return "recStudyAbList";
	}
	
	@RequestMapping(value="/recStudyAbList", method=RequestMethod.POST)
	public String recStudyAbList(RecStudyAb recStudyAb){
		return "recStudyAbList";
	}
	
	// 5. recStudyAbDetail
	@RequestMapping(value="/recStudyAbDetail", method=RequestMethod.GET)
	public String recStudyAbDetail(){
		return "recStudyAbDetail";
	}
	
	@RequestMapping(value="/recStudyAbDetail", method=RequestMethod.POST)
	public String recStudyAbDetail(RecStudyAb recStudyAb){
		return "recStudyAbDetail";
	}
}
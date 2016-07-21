package com.to.cdp.plan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.plan.model.PlanBook;
import com.to.cdp.plan.service.PlanBookService;

@Controller
public class PlanBookController {
	@Autowired
	private PlanBookService planBookService;
	
	// 1. planBookInsert
	@RequestMapping(value="/planBookInsert", method=RequestMethod.GET)
	public String planBookInsert(){
		return "planBookInsert";
	}
	
	@RequestMapping(value="/planBookInsert", method=RequestMethod.POST)
	public String planBookInsert(PlanBook planBook){
		return "planBookDetail";
	}
	
	// 2. planBookUpdate
	@RequestMapping(value="/planBookUpdate", method=RequestMethod.GET)
	public String planBookUpdate(){
		return "planBookUpdate";
	}
	
	@RequestMapping(value="/planBookUpdate", method=RequestMethod.POST)
	public String planBookUpdate(PlanBook planBook){
		return "planBookDetail";
	}
	
	// 3. planBookDelete
	@RequestMapping(value="/planBookDelete", method=RequestMethod.GET)
	public String planBookDelete(){
		return "planBookDelete";
	}
	
	@RequestMapping(value="/planBookDelete", method=RequestMethod.POST)
	public String planBookDelete(PlanBook planBook){
		return "redirect:/planBookList";
	}
	
	// 4. planBookList
	@RequestMapping(value="/planBookList", method=RequestMethod.GET)
	public String planBookList(){
		return "planBookList";
	}
	
	@RequestMapping(value="/planBookList", method=RequestMethod.POST)
	public String planBookList(PlanBook planBook){
		return "planBookList";
	}
	
	// 5. planBookDetail
	@RequestMapping(value="/planBookDetail", method=RequestMethod.GET)
	public String planBookDetail(){
		return "planBookDetail";
	}
	
	@RequestMapping(value="/planBookDetail", method=RequestMethod.POST)
	public String planBookDetail(PlanBook planBook){
		return "planBookDetail";
	}
}
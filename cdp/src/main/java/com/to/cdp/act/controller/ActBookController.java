package com.to.cdp.act.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.act.model.ActBook;
import com.to.cdp.act.service.ActBookService;

@Controller
public class ActBookController {
	@Autowired
	private ActBookService actBookService;
	
	// 1. actBookInsert
	@RequestMapping(value="/actBookInsert", method=RequestMethod.GET)
	public String actBookInsert(){
		return "actBookInsert";
	}
	
	@RequestMapping(value="/actBookInsert", method=RequestMethod.POST)
	public String actBookInsert(ActBook actBook){
		return "actBookDetail";
	}
	
	// 2. actBookUpdate
	@RequestMapping(value="/actBookUpdate", method=RequestMethod.GET)
	public String actBookUpdate(){
		return "actBookUpdate";
	}
	
	@RequestMapping(value="/actBookUpdate", method=RequestMethod.POST)
	public String actBookUpdate(ActBook actBook){
		return "actBookDetail";
	}
	
	// 3. actBookDelete
	@RequestMapping(value="/actBookDelete", method=RequestMethod.GET)
	public String actBookDelete(){
		return "actBookDelete";
	}
	
	@RequestMapping(value="/actBookDelete", method=RequestMethod.POST)
	public String actBookDelete(ActBook actBook){
		return "redirect:/actBookList";
	}
	
	// 4. actBookList
	@RequestMapping(value="/actBookList", method=RequestMethod.GET)
	public String actBookList(){
		return "actBookList";
	}
	
	@RequestMapping(value="/actBookList", method=RequestMethod.POST)
	public String actBookList(ActBook actBook){
		return "actBookList";
	}
	
	// 5. actBookDetail
	@RequestMapping(value="/actBookDetail", method=RequestMethod.GET)
	public String actBookDetail(){
		return "actBookDetail";
	}
	
	@RequestMapping(value="/actBookDetail", method=RequestMethod.POST)
	public String actBookDetail(ActBook actBook){
		return "actBookDetail";
	}
}
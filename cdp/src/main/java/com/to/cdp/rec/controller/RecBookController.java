package com.to.cdp.rec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.rec.model.RecBook;
import com.to.cdp.rec.service.RecBookService;

@Controller
public class RecBookController {
	@Autowired
	private RecBookService recBookService;
	
	// 1. recBookInsert
	@RequestMapping(value="/recBookInsert", method=RequestMethod.GET)
	public String recBookInsert(){
		return "recBookInsert";
	}
	
	@RequestMapping(value="/recBookInsert", method=RequestMethod.POST)
	public String recBookInsert(RecBook recBook){
		return "recBookDetail";
	}
	
	// 2. recBookUpdate
	@RequestMapping(value="/recBookUpdate", method=RequestMethod.GET)
	public String recBookUpdate(){
		return "recBookUpdate";
	}
	
	@RequestMapping(value="/recBookUpdate", method=RequestMethod.POST)
	public String recBookUpdate(RecBook recBook){
		return "recBookDetail";
	}
	
	// 3. recBookDelete
	@RequestMapping(value="/recBookDelete", method=RequestMethod.GET)
	public String recBookDelete(){
		return "recBookDelete";
	}
	
	@RequestMapping(value="/recBookDelete", method=RequestMethod.POST)
	public String recBookDelete(RecBook recBook){
		return "redirect:/recBookList";
	}
	
	// 4. recBookList
	@RequestMapping(value="/recBookList", method=RequestMethod.GET)
	public String recBookList(){
		return "recBookList";
	}
	
	@RequestMapping(value="/recBookList", method=RequestMethod.POST)
	public String recBookList(RecBook recBook){
		return "recBookList";
	}
	
	// 5. recBookDetail
	@RequestMapping(value="/recBookDetail", method=RequestMethod.GET)
	public String recBookDetail(){
		return "recBookDetail";
	}
	
	@RequestMapping(value="/recBookDetail", method=RequestMethod.POST)
	public String recBookDetail(RecBook recBook){
		return "recBookDetail";
	}
}
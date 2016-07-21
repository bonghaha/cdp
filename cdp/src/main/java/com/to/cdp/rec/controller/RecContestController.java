package com.to.cdp.rec.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.rec.model.RecContest;
import com.to.cdp.rec.service.RecContestService;

@Controller
public class RecContestController {
	@Autowired
	private RecContestService recContestService;
	
	// 1. recContestInsert
	@RequestMapping(value="/recContestInsert", method=RequestMethod.GET)
	public String recContestInsert(){
		return "recContestInsert";
	}
	
	@RequestMapping(value="/recContestInsert", method=RequestMethod.POST)
	public String recContestInsert(RecContest recContest){
		return "recContestDetail";
	}
	
	// 2. recContestUpdate
	@RequestMapping(value="/recContestUpdate", method=RequestMethod.GET)
	public String recContestUpdate(){
		return "recContestUpdate";
	}
	
	@RequestMapping(value="/recContestUpdate", method=RequestMethod.POST)
	public String recContestUpdate(RecContest recContest){
		return "recContestDetail";
	}
	
	// 3. recContestDelete
	@RequestMapping(value="/recContestDelete", method=RequestMethod.GET)
	public String recContestDelete(){
		return "recContestDelete";
	}
	
	@RequestMapping(value="/recContestDelete", method=RequestMethod.POST)
	public String recContestDelete(RecContest recContest){
		return "redirect:/recContestList";
	}
	
	// 4. recContestList
	@RequestMapping(value="/recContestList", method=RequestMethod.GET)
	public String recContestList(){
		return "recContestList";
	}
	
	@RequestMapping(value="/recContestList", method=RequestMethod.POST)
	public String recContestList(RecContest recContest){
		return "recContestList";
	}
	
	// 5. recContestDetail
	@RequestMapping(value="/recContestDetail", method=RequestMethod.GET)
	public String recContestDetail(){
		return "recContestDetail";
	}
	
	@RequestMapping(value="/recContestDetail", method=RequestMethod.POST)
	public String recContestDetail(RecContest recContest){
		return "recContestDetail";
	}
}
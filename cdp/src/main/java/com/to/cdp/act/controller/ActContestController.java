package com.to.cdp.act.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.act.model.ActContest;
import com.to.cdp.act.service.ActContestService;

@Controller
public class ActContestController {
	@Autowired
	private ActContestService actContestService;
	
	// 1. actContestInsert
	@RequestMapping(value="/actContestInsert", method=RequestMethod.GET)
	public String actContestInsert(){
		return "actContestInsert";
	}
	
	@RequestMapping(value="/actContestInsert", method=RequestMethod.POST)
	public String actContestInsert(ActContest actContest){
		return "actContestDetail";
	}
	
	// 2. actContestUpdate
	@RequestMapping(value="/actContestUpdate", method=RequestMethod.GET)
	public String actContestUpdate(){
		return "actContestUpdate";
	}
	
	@RequestMapping(value="/actContestUpdate", method=RequestMethod.POST)
	public String actContestUpdate(ActContest actContest){
		return "actContestDetail";
	}
	
	// 3. actContestDelete
	@RequestMapping(value="/actContestDelete", method=RequestMethod.GET)
	public String actContestDelete(){
		return "actContestDelete";
	}
	
	@RequestMapping(value="/actContestDelete", method=RequestMethod.POST)
	public String actContestDelete(ActContest actContest){
		return "redirect:/actContestList";
	}
	
	// 4. actContestList
	@RequestMapping(value="/actContestList", method=RequestMethod.GET)
	public String actContestList(){
		return "actContestList";
	}
	
	@RequestMapping(value="/actContestList", method=RequestMethod.POST)
	public String actContestList(ActContest actContest){
		return "actContestList";
	}
	
	// 5. actContestDetail
	@RequestMapping(value="/actContestDetail", method=RequestMethod.GET)
	public String actContestDetail(){
		return "actContestDetail";
	}
	
	@RequestMapping(value="/actContestDetail", method=RequestMethod.POST)
	public String actContestDetail(ActContest actContest){
		return "actContestDetail";
	}
}
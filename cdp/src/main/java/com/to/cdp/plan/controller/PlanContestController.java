package com.to.cdp.plan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.plan.model.PlanContest;
import com.to.cdp.plan.service.PlanContestService;

@Controller
public class PlanContestController {
	@Autowired
	private PlanContestService planContestService;
	
	// 1. planContestInsert
	@RequestMapping(value="/planContestInsert", method=RequestMethod.GET)
	public String planContestInsert(){
		return "planContestInsert";
	}
	
	@RequestMapping(value="/planContestInsert", method=RequestMethod.POST)
	public String planContestInsert(PlanContest planContest){
		return "planContestDetail";
	}
	
	// 2. planContestUpdate
	@RequestMapping(value="/planContestUpdate", method=RequestMethod.GET)
	public String planContestUpdate(){
		return "planContestUpdate";
	}
	
	@RequestMapping(value="/planContestUpdate", method=RequestMethod.POST)
	public String planContestUpdate(PlanContest planContest){
		return "planContestDetail";
	}
	
	// 3. planContestDelete
	@RequestMapping(value="/planContestDelete", method=RequestMethod.GET)
	public String planContestDelete(){
		return "planContestDelete";
	}
	
	@RequestMapping(value="/planContestDelete", method=RequestMethod.POST)
	public String planContestDelete(PlanContest planContest){
		return "redirect:/planContestList";
	}
	
	// 4. planContestList
	@RequestMapping(value="/planContestList", method=RequestMethod.GET)
	public String planContestList(){
		return "planContestList";
	}
	
	@RequestMapping(value="/planContestList", method=RequestMethod.POST)
	public String planContestList(PlanContest planContest){
		return "planContestList";
	}
	
	// 5. planContestDetail
	@RequestMapping(value="/planContestDetail", method=RequestMethod.GET)
	public String planContestDetail(){
		return "planContestDetail";
	}
	
	@RequestMapping(value="/planContestDetail", method=RequestMethod.POST)
	public String planContestDetail(PlanContest planContest){
		return "planContestDetail";
	}
}
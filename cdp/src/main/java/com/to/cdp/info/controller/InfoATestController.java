package com.to.cdp.info.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.to.cdp.info.model.InfoATest;
import com.to.cdp.info.service.InfoATestService;

@Controller
public class InfoATestController {
	@Autowired
	private InfoATestService infoATestService;
	
	// 1. infoATestInsert
	@RequestMapping(value="/infoATestInsert", method=RequestMethod.GET)
	public String infoATestInsert(){
		return "infoATestInsert";
	}
	
	@RequestMapping(value="/infoATestInsert", method=RequestMethod.POST)
	public String infoATestInsert(InfoATest infoATest){
		return "infoATestDetail";
	}
	
	// 2. infoATestUpdate
	@RequestMapping(value="/infoATestUpdate", method=RequestMethod.GET)
	public String infoATestUpdate(){
		return "infoATestUpdate";
	}
	
	@RequestMapping(value="/infoATestUpdate", method=RequestMethod.POST)
	public String infoATestUpdate(InfoATest infoATest){
		return "infoATestDetail";
	}
	
	// 3. infoATestDelete
	@RequestMapping(value="/infoATestDelete", method=RequestMethod.GET)
	public String infoATestDelete(){
		return "infoATestDelete";
	}
	
	@RequestMapping(value="/infoATestDelete", method=RequestMethod.POST)
	public String infoATestDelete(InfoATest infoATest){
		return "redirect:/infoATestList";
	}
	
	// 4. infoATestList
	@RequestMapping(value="/infoATestList", method=RequestMethod.GET)
	public String infoATestList(){
		return "infoATestList";
	}
	
	@RequestMapping(value="/infoATestList", method=RequestMethod.POST)
	public String infoATestList(InfoATest infoATest){
		return "infoATestList";
	}
	
	// 5. infoATestDetail
	@RequestMapping(value="/infoATestDetail", method=RequestMethod.GET)
	public String infoATestDetail(){
		return "infoATestDetail";
	}
	
	@RequestMapping(value="/infoATestDetail", method=RequestMethod.POST)
	public String infoATestDetail(InfoATest infoATest){
		return "infoATestDetail";
	}
}
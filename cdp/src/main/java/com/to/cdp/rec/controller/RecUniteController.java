package com.to.cdp.rec.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.to.cdp.PageHelper;
import com.to.cdp.rec.model.RecUnite;
import com.to.cdp.rec.service.RecUniteService;

@Controller
public class RecUniteController {
	@Autowired
	private RecUniteService recUniteService;
	
	// 1. recUniteInsert
	@RequestMapping(value="/recUniteInsert", method=RequestMethod.GET)
	public String recUniteInsert(){
		return "recUniteInsert";
	}
	
	@RequestMapping(value="/recUniteInsert", method=RequestMethod.POST)
	public String recUniteInsert(RecUnite recUnite){
		return "recUniteDetail";
	}
	
	// 2. recUniteUpdate
	@RequestMapping(value="/recUniteUpdate", method=RequestMethod.GET)
	public String recUniteUpdate(){
		return "recUniteUpdate";
	}
	
	@RequestMapping(value="/recUniteUpdate", method=RequestMethod.POST)
	public String recUniteUpdate(RecUnite recUnite){
		return "recUniteDetail";
	}
	
	// 3. recUniteDelete
	@RequestMapping(value="/recUniteDelete", method=RequestMethod.GET)
	public String recUniteDelete(){
		return "recUniteDelete";
	}
	
	@RequestMapping(value="/recUniteDelete", method=RequestMethod.POST)
	public String recUniteDelete(RecUnite recUnite){
		return "redirect:/recUniteList";
	}
	
	// 4. recUniteList
	@RequestMapping(value="/recUniteList", method=RequestMethod.GET)
	public String recUniteList(
			Model model,
			Map<String, Object> map,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "10")  int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		
		
		return "recUniteList";
	}
	
	@RequestMapping(value="/recUniteList", method=RequestMethod.POST)
	public String recUniteList(RecUnite recUnite){
		return "recUniteList";
	}
	
	// 5. recUniteDetail
	@RequestMapping(value="/recUniteDetail", method=RequestMethod.GET)
	public String recUniteDetail(){
		return "recUniteDetail";
	}
	
	@RequestMapping(value="/recUniteDetail", method=RequestMethod.POST)
	public String recUniteDetail(RecUnite recUnite){
		return "recUniteDetail";
	}
}
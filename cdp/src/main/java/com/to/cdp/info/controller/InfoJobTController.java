package com.to.cdp.info.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.to.cdp.PageHelper;
import com.to.cdp.info.model.InfoJobT;
import com.to.cdp.info.service.InfoJobTService;

@Controller
public class InfoJobTController {
	@Autowired
	private InfoJobTService infoJobTService;
	
	// 1. infoJobTInsert
	@RequestMapping(value="/infoJobTInsert", method=RequestMethod.GET)
	public String infoJobTInsert(){
		return "info/jobT/jobTInsert";
	}
	
	@RequestMapping(value="/infoJobTInsert", method=RequestMethod.POST)
	public String infoJobTInsert(InfoJobT infoJobT){
		infoJobTService.infoJobTInsert(infoJobT);
		return "redirect:/infoJobTList";
	}
	
	// 2. infoJobTUpdate
	@RequestMapping(value="/infoJobTUpdate", method=RequestMethod.GET)
	public String infoJobTUpdate(){
		return "infoJobTUpdate";
	}
	
	@RequestMapping(value="/infoJobTUpdate", method=RequestMethod.POST)
	public String infoJobTUpdate(InfoJobT infoJobT){
		return "infoJobTDetail";
	}
	
	// 3. infoJobTDelete
	@RequestMapping(value="/infoJobTDelete", method=RequestMethod.GET)
	public String infoJobTDelete(){
		return "infoJobTDelete";
	}
	
	@RequestMapping(value="/infoJobTDelete", method=RequestMethod.POST)
	public String infoJobTDelete(InfoJobT infoJobT){
		return "redirect:/infoJobTList";
	}
	
	// 4. infoJobTList
	@RequestMapping(value="/infoJobTList", method=RequestMethod.GET)
	public String infoJobTList(
			Model model, 
			Map<String,Object> map,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "10")  int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		
		int totalCount = infoJobTService.infoJobTCountBySearch(map);	// totalCount 구하기
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	//페이지 셋팅하기
		System.out.println("pageHelper infoJobTController :" + pageHelper);
		map.put("pageHelper", pageHelper);
		
		List<InfoJobT> infoJobTList = infoJobTService.infoJobTList(map);
		model.addAttribute("infoJobTList", infoJobTList);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/jobT/jobTList";
	}
	
	@RequestMapping(value="/infoJobTList", method=RequestMethod.POST)
	public String infoJobTList(InfoJobT infoJobT){
		return "info/jobT/jobTList";
	}	
	
	// 5. infoJobTDetail
	@RequestMapping(value="/infoJobTDetail", method=RequestMethod.GET)
	public String infoJobTDetail(
			InfoJobT infoJobT, 
			Model model,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		infoJobT = infoJobTService.infoJobTDetail(infoJobT);
		model.addAttribute("infoJobT", infoJobT);	
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/jobT/jobTDetail";
	}
	
	@RequestMapping(value="/infoJobTDetail", method=RequestMethod.POST)
	public String infoJobTDetail(InfoJobT infoJobT){
		return "infoJobTDetail";
	}
}
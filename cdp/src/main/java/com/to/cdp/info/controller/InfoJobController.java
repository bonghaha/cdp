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
import com.to.cdp.info.model.InfoJob;
import com.to.cdp.info.service.InfoJobService;

@Controller
public class InfoJobController {
	@Autowired
	private InfoJobService infoJobService;
	
	// 1. infoJobInsert
	@RequestMapping(value="/infoJobInsert", method=RequestMethod.GET)
	public String infoJobInsert(){
		return "info/job/jobInsert";
	}
	
	@RequestMapping(value="/infoJobInsert", method=RequestMethod.POST)
	public String infoJobInsert(InfoJob infoJob){
		infoJobService.infoJobInsert(infoJob);
		return "redirect:/infoJobList";
	}
	
	// 2. infoJobUpdate
	@RequestMapping(value="/infoJobUpdate", method=RequestMethod.GET)
	public String infoJobUpdate(){
		return "infoJobUpdate";
	}
	
	@RequestMapping(value="/infoJobUpdate", method=RequestMethod.POST)
	public String infoJobUpdate(InfoJob infoJob){
		return "infoJobDetail";
	}
	
	// 3. infoJobDelete
	@RequestMapping(value="/infoJobDelete", method=RequestMethod.GET)
	public String infoJobDelete(){
		return "infoJobDelete";
	}
	
	@RequestMapping(value="/infoJobDelete", method=RequestMethod.POST)
	public String infoJobDelete(InfoJob infoJob){
		return "redirect:/infoJobList";
	}
	
	// 4. infoJobList
	@RequestMapping(value="/infoJobList", method=RequestMethod.GET)
	public String infoJobList(
			Model model,
			Map<String,Object> map,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "10") int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		
		int totalCount = infoJobService.infoJobCountBySearch(map);	// totalCount 구하기
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	//페이지 셋팅하기
		System.out.println("pageHelper infoJobController :" + pageHelper);
		map.put("pageHelper", pageHelper);
		
		List<InfoJob> infoJobList = infoJobService.infoJobList(map);
		model.addAttribute("infoJobList", infoJobList);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/job/jobList";
	}
	
	@RequestMapping(value="/infoJobList", method=RequestMethod.POST)
	public String infoJobList(){
		return "info/job/jobList";
	}
	
	// 5. infoJobDetail
	@RequestMapping(value="/infoJobDetail", method=RequestMethod.GET)
	public String infoJobDetail(
			InfoJob infoJob, 
			Model model,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
	infoJob = infoJobService.infoJobDetail(infoJob);
	model.addAttribute("infoJob", infoJob);
	model.addAttribute("searchType", searchType);
	model.addAttribute("searchWord", searchWord);
		return "info/job/jobDetail";
	}
	
	@RequestMapping(value="/infoJobDetail", method=RequestMethod.POST)
	public String infoJobDetail(InfoJob infoJob){
		return "info/job/jobDetail";
	}
}
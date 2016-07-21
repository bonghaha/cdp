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
import com.to.cdp.info.model.InfoContest;
import com.to.cdp.info.service.InfoContestService;

@Controller
public class InfoContestController {
	@Autowired
	private InfoContestService infoContestService;
	
	// 1. infoContestInsert
	@RequestMapping(value="/infoContestInsert", method=RequestMethod.GET)
	public String infoContestInsert(){
		return "info/contest/contestInsert";
	}
	
	@RequestMapping(value="/infoContestInsert", method=RequestMethod.POST)
	public String infoContestInsert(InfoContest infoContest){
		infoContestService.infoContestInsert(infoContest);
		return "redirect:/infoContestList";
	}
	
	// 2. infoContestUpdate
	@RequestMapping(value="/infoContestUpdate", method=RequestMethod.GET)
	public String infoContestUpdate(){
		return "infoContestUpdate";
	}
	
	@RequestMapping(value="/infoContestUpdate", method=RequestMethod.POST)
	public String infoContestUpdate(InfoContest infoContest){
		return "infoContestDetail";
	}
	
	// 3. infoContestDelete
	@RequestMapping(value="/infoContestDelete", method=RequestMethod.GET)
	public String infoContestDelete(){
		return "infoContestDelete";
	}
	
	@RequestMapping(value="/infoContestDelete", method=RequestMethod.POST)
	public String infoContestDelete(InfoContest infoContest){
		return "redirect:/infoContestList";
	}
	
	// 4. infoContestList
	@RequestMapping(value="/infoContestList", method=RequestMethod.GET)
	public String infoContestList(
			Model model,
			Map<String, Object> map,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "10")  int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
			map = new HashMap<>();
			map.put("searchType", searchType);
			map.put("searchWord", searchWord);
			
			int totalCount = infoContestService.infoContestCountBySearch(map);	// totalCount 구하기
			pageHelper.pageSet(totalCount, linePerPage, clickPage,blockSize);	//페이지 셋팅하기
			System.out.println("pageHelper InfoContestController :" + pageHelper);
			map.put("pageHelper", pageHelper);
			
			List<InfoContest> infoContestList = infoContestService.infoContestList(map);
			model.addAttribute("infoContestList", infoContestList);
			model.addAttribute("pageHelper", pageHelper);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
			return "info/contest/contestList";
	}
	
	@RequestMapping(value="/infoContestList", method=RequestMethod.POST)
	public String infoContestList(InfoContest infoContest){
		return "info/contest/contestList";
	}
	
	// 5. infoContestDetail
	@RequestMapping(value="/infoContestDetail", method=RequestMethod.GET)
	public String infoContestDetail(
			InfoContest infoContest, 
			Model model,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		infoContest = infoContestService.infoContestDetail(infoContest);
		model.addAttribute("infoContest", infoContest);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/contest/contestDetail";
	}
	
	@RequestMapping(value="/infoContestDetail", method=RequestMethod.POST)
	public String infoContestDetail(){
		return "info/contest/contestDetail";
	}
}
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
import com.to.cdp.info.model.InfoStudyAb;
import com.to.cdp.info.service.InfoStudyAbService;

@Controller
public class InfoStudyAbController {
	@Autowired
	private InfoStudyAbService infoStudyAbService;
	
	// 1. infoStudyAbInsert
	@RequestMapping(value="/infoStudyAbInsert", method=RequestMethod.GET)
	public String infoStudyAbInsert(){
		return "info/studyAb/studyAbInsert";
	}
	
	@RequestMapping(value="/infoStudyAbInsert", method=RequestMethod.POST)
	public String infoStudyAbInsert(InfoStudyAb infoStudyAb){
		infoStudyAbService.infoStudyAbInsert(infoStudyAb);
		return "redirect:/infoStudyAbList";
	}
	
	// 2. infoStudyAbUpdate
	@RequestMapping(value="/infoStudyAbUpdate", method=RequestMethod.GET)
	public String infoStudyAbUpdate(){
		return "infoStudyAbUpdate";
	}
	
	@RequestMapping(value="/infoStudyAbUpdate", method=RequestMethod.POST)
	public String infoStudyAbUpdate(InfoStudyAb infoStudyAb){
		return "infoStudyAbDetail";
	}
	
	// 3. infoStudyAbDelete
	@RequestMapping(value="/infoStudyAbDelete", method=RequestMethod.GET)
	public String infoStudyAbDelete(){
		return "infoStudyAbDelete";
	}
	
	@RequestMapping(value="/infoStudyAbDelete", method=RequestMethod.POST)
	public String infoStudyAbDelete(InfoStudyAb infoStudyAb){
		return "redirect:/infoStudyAbList";
	}
	
	// 4. infoStudyAbList
	@RequestMapping(value="/infoStudyAbList", method=RequestMethod.GET)
	public String infoStudyAbList(
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
		
		int totalCount = infoStudyAbService.infoStudyAbCountBySearch(map);	// totalCount 구하기
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	//페이지 셋팅하기
		System.out.println("pageHelper infoStudyAbController :" + pageHelper);
		map.put("pageHelper", pageHelper);
		
		List<InfoStudyAb> infoStudyAbList = infoStudyAbService.infoStudyAbList(map);
		model.addAttribute("infoStudyAbList", infoStudyAbList);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/studyAb/studyAbList";
	}
	
	@RequestMapping(value="/infoStudyAbList", method=RequestMethod.POST)
	public String infoStudyAbList(InfoStudyAb infoStudyAb){
		return "info/studyAb/studyAbList";
	}
	
	// 5. infoStudyAbDetail
	@RequestMapping(value="/infoStudyAbDetail", method=RequestMethod.GET)
	public String infoStudyAbDetail(
			InfoStudyAb infoStudyAb, 
			Model model,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		infoStudyAb = infoStudyAbService.infoStudyAbDetail(infoStudyAb);
		model.addAttribute("infoStudyAb", infoStudyAb);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/studyAb/studyAbDetail";
	}
	
	@RequestMapping(value="/infoStudyAbDetail", method=RequestMethod.POST)
	public String infoStudyAbDetail(InfoStudyAb infoStudyAb){
		return "infoStudyAbDetail";
	}
}
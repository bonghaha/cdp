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
import com.to.cdp.info.model.InfoSchool;
import com.to.cdp.info.service.InfoSchoolService;

@Controller
public class InfoSchoolController {
	@Autowired
	private InfoSchoolService infoSchoolService;
	
	// 1. infoSchoolInsert
	@RequestMapping(value="/infoSchoolInsert", method=RequestMethod.GET)
	public String infoSchoolInsert(){
		return "info/school/schoolInsert";
	}
	
	@RequestMapping(value="/infoSchoolInsert", method=RequestMethod.POST)
	public String infoSchoolInsert(InfoSchool infoSchool){
		infoSchoolService.infoSchoolInsert(infoSchool);
		return "redirect:/infoSchoolList";
	}
	
	// 2. infoSchoolUpdate
	@RequestMapping(value="/infoSchoolUpdate", method=RequestMethod.GET)
	public String infoSchoolUpdate(){
		return "infoSchoolUpdate";
	}
	
	@RequestMapping(value="/infoSchoolUpdate", method=RequestMethod.POST)
	public String infoSchoolUpdate(InfoSchool infoSchool){
		return "infoSchoolDetail";
	}
	
	// 3. infoSchoolDelete
	@RequestMapping(value="/infoSchoolDelete", method=RequestMethod.GET)
	public String infoSchoolDelete(){
		return "infoSchoolDelete";
	}
	
	@RequestMapping(value="/infoSchoolDelete", method=RequestMethod.POST)
	public String infoSchoolDelete(InfoSchool infoSchool){
		return "redirect:/infoSchoolList";
	}
	
	// 4. infoSchoolList
	@RequestMapping(value="/infoSchoolList", method=RequestMethod.GET)
	public String infoSchoolList(
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
		
		int totalCount = infoSchoolService.infoSchoolCountBySearch(map);	// totalCount 구하기
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	//페이지 셋팅하기
		System.out.println("pageHelper InfoSchoolController :" + pageHelper);
		map.put("pageHelper", pageHelper);
		
		List<InfoSchool> infoSchoolList = infoSchoolService.infoSchoolList(map);
		model.addAttribute("infoSchoolList", infoSchoolList);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/school/schoolList";
	}
	
	@RequestMapping(value="/infoSchoolList", method=RequestMethod.POST)
	public String infoSchoolList(InfoSchool infoSchool){
		return "infoSchoolList";
	}
	
	// 5. infoSchoolDetail
	@RequestMapping(value="/infoSchoolDetail", method=RequestMethod.GET)
	public String infoSchoolDetail(
			InfoSchool infoSchool, 
			Model model,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		
		infoSchool = infoSchoolService.infoSchoolDetail(infoSchool);
		model.addAttribute("infoSchool", infoSchool);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/school/schoolDetail";
	}
	
	@RequestMapping(value="/infoSchoolDetail", method=RequestMethod.POST)
	public String infoSchoolDetail(){
		return "infoSchoolDetail";
	}
}
package com.to.cdp.info.controller;

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
		
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		List<InfoSchool> infoSchoolList = infoSchoolService.infoSchoolList(map);	// 파싱한 값들(list) List에 넣기
		
		pageHelper.pageSet(infoSchoolList.size(), linePerPage, clickPage, blockSize);	// 페이지 셋팅
		System.out.println("pageHelper InfoSchoolController :" + pageHelper);
		
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
			@RequestParam(value="seq") String seq,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		
		System.out.println("seq InfoSchoolController : " + seq);
		infoSchool = infoSchoolService.infoSchoolDetail(seq);
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
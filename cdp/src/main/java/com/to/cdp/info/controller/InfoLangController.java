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
import com.to.cdp.info.model.InfoLang;
import com.to.cdp.info.service.InfoLangService;

@Controller
public class InfoLangController {
	@Autowired
	private InfoLangService infoLangService;
	
	// 1. infoLangInsert
	@RequestMapping(value="/infoLangInsert", method=RequestMethod.GET)
	public String infoLangInsert(){
		return "info/lang/langInsert";
	}
	
	@RequestMapping(value="/infoLangInsert", method=RequestMethod.POST)
	public String infoLangInsert(InfoLang infoLang){
		infoLangService.infoLangInsert(infoLang);
		return "redirect:/infoLangList";
	}
	
	// 2. infoLangUpdate
	@RequestMapping(value="/infoLangUpdate", method=RequestMethod.GET)
	public String infoLangUpdate(){
		return "infoLangUpdate";
	}
	
	@RequestMapping(value="/infoLangUpdate", method=RequestMethod.POST)
	public String infoLangUpdate(InfoLang infoLang){
		return "infoLangDetail";
	}
	
	// 3. infoLangDelete
	@RequestMapping(value="/infoLangDelete", method=RequestMethod.GET)
	public String infoLangDelete(){
		return "infoLangDelete";
	}
	
	@RequestMapping(value="/infoLangDelete", method=RequestMethod.POST)
	public String infoLangDelete(InfoLang infoLang){
		return "redirect:/infoLangList";
	}
	
	// 4. infoLangList
	@RequestMapping(value="/infoLangList", method=RequestMethod.GET)
	public String infoLangList(
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
		
		int totalCount = infoLangService.infoLangCountBySearch(map);	// totalCount 구하기
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	//페이지 셋팅하기
		System.out.println("pageHelper infoLangController :" + pageHelper);
		map.put("pageHelper", pageHelper);
		
		List<InfoLang> infoLangList = infoLangService.infoLangList(map);
		model.addAttribute("infoLangList", infoLangList);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/lang/langList";
	}
	
	@RequestMapping(value="/infoLangList", method=RequestMethod.POST)
	public String infoLangList(InfoLang infoLang){
		return "info/lang/langList";
	}
	
	// 5. infoLangDetail
	@RequestMapping(value="/infoLangDetail", method=RequestMethod.GET)
	public String infoLangDetail(
			InfoLang infoLang, 
			Model model,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		infoLang = infoLangService.infoLangDetail(infoLang);
		model.addAttribute("infoLang", infoLang);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/lang/langDetail";
	}
	
	@RequestMapping(value="/infoLangDetail", method=RequestMethod.POST)
	public String infoLangDetail(InfoLang infoLang){
		return "infoLangDetail";
	}
}
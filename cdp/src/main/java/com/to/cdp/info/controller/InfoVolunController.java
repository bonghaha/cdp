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
import com.to.cdp.info.model.InfoVolun;
import com.to.cdp.info.service.InfoVolunService;

@Controller
public class InfoVolunController {
	@Autowired
	private InfoVolunService infoVolunService;

	// 1. infoVolunInsert
	@RequestMapping(value="/infoVolunInsert", method=RequestMethod.GET)
	public String infoVolunInsert(){
		return "info/volun/volunInsert";
	}
	
	@RequestMapping(value="/infoVolunInsert", method=RequestMethod.POST)
	public String infoVolunInsert(InfoVolun infoVolun){
		infoVolunService.infoVolunInsert(infoVolun);
		return "redirect:/infoVolunList";
	}
	
	// 2. infoVolunUpdate
	@RequestMapping(value="/infoVolunUpdate", method=RequestMethod.GET)
	public String infoVolunUpdate(){
		return "info/volun/volunUpdate";
	}
	
	@RequestMapping(value="/infoVolunUpdate", method=RequestMethod.POST)
	public String infoVolunUpdate(InfoVolun infoVolun){
		return "info/volun/volunDetail";
	}
	
	// 3. infoVolunDelete
	@RequestMapping(value="/infoVolunDelete", method=RequestMethod.GET)
	public String infoVolunDelete(){
		return "info/volun/volunDelete";
	}
	
	@RequestMapping(value="/infoVolunDelete", method=RequestMethod.POST)
	public String infoVolunDelete(InfoVolun infoVolun){
		return "redirect:/infoVolunList";
	}
	
	// 4. infoVolunList
	@RequestMapping(value="/infoVolunList", method=RequestMethod.GET)
	public String infoVolunList(
			Model model,
			Map<String, Object> map,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "10")  int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="searchWord", required=false, defaultValue="") String searchWord){
		map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		
		int totalCount = infoVolunService.infoVolunCountBySearch(map);
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);
		map.put("pageHelper", pageHelper);
		List<InfoVolun> infoVolunList = infoVolunService.infoVolunList(map);
		
		model.addAttribute("infoVolunList", infoVolunList);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/volun/volunList";
	}
	
	@RequestMapping(value="/infoVolunList", method=RequestMethod.POST)
	public String infoVolunList(InfoVolun infoVolun){
		return "info/volun/volunList";
	}
	
	// 5. infoVolunDetail
	@RequestMapping(value="/infoVolunDetail", method=RequestMethod.GET)
	public String infoVolunDetail(
			InfoVolun infoVolun, 
			Model model,
			@RequestParam(value="searchType", required=false, defaultValue="") String searchType,
			@RequestParam(value="searchWord", required=false, defaultValue="") String searchWord){
		infoVolun = infoVolunService.infoVolunDetail(infoVolun);
		model.addAttribute("infoVolun", infoVolun);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/volun/volunDetail";
	}
	
	@RequestMapping(value="/infoVolunDetail", method=RequestMethod.POST)
	public String infoVolunDetail(){
		return "info/volun/volunDetail";
	}
}
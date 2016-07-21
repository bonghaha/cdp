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
import com.to.cdp.info.model.InfoDept;
import com.to.cdp.info.service.InfoDeptService;

@Controller
public class InfoDeptController {
	@Autowired
	private InfoDeptService infoDeptService;
	
	// 1. infoDeptInsert
	@RequestMapping(value="/infoDeptInsert", method=RequestMethod.GET)
	public String infoDeptInsert(){
		return "info/dept/deptInsert";
	}
	
	@RequestMapping(value="/infoDeptInsert", method=RequestMethod.POST)
	public String infoDeptInsert(InfoDept infoDept){
		infoDeptService.infoDeptInsert(infoDept);
		return "redirect:/infoDeptList";
	}
	
	// 2. infoDeptUpdate
	@RequestMapping(value="/infoDeptUpdate", method=RequestMethod.GET)
	public String infoDeptUpdate(){
		return "infoDeptUpdate";
	}
	
	@RequestMapping(value="/infoDeptUpdate", method=RequestMethod.POST)
	public String infoDeptUpdate(InfoDept infoDept){
		return "infoDeptDetail";
	}
	
	// 3. infoDeptDelete
	@RequestMapping(value="/infoDeptDelete", method=RequestMethod.GET)
	public String infoDeptDelete(){
		return "infoDeptDelete";
	}
	
	@RequestMapping(value="/infoDeptDelete", method=RequestMethod.POST)
	public String infoDeptDelete(InfoDept infoDept){
		return "redirect:/infoDeptList";
	}
	
	// 4. infoDeptList
	@RequestMapping(value="/infoDeptList", method=RequestMethod.GET)
	public String infoDeptList(
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
			
			int totalCount = infoDeptService.infoDeptCountBySearch(map);	// totalCount 구하기
			pageHelper.pageSet(totalCount, linePerPage, clickPage,blockSize);	//페이지 셋팅하기
			System.out.println("pageHelper InfoDeptController :" + pageHelper);
			map.put("pageHelper", pageHelper);
			
			List<InfoDept> infoDeptList = infoDeptService.infoDeptList(map);
			model.addAttribute("infoDeptList", infoDeptList);
			model.addAttribute("pageHelper", pageHelper);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
			return "info/dept/deptList";
	}
	
	@RequestMapping(value="/infoDeptList", method=RequestMethod.POST)
	public String infoDeptList(InfoDept infoDept){
		return "info/dept/deptList";
	}
	
	// 5. infoDeptDetail
	@RequestMapping(value="/infoDeptDetail", method=RequestMethod.GET)
	public String infoDeptDetail(
			InfoDept infoDept, 
			Model model,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		infoDept = infoDeptService.infoDeptDetail(infoDept);
		model.addAttribute("infoDept", infoDept);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/dept/deptDetail";
	}
	
	@RequestMapping(value="/infoDeptDetail", method=RequestMethod.POST)
	public String infoDeptDetail(){
		return "info/dept/deptDetail";
	}
}
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
import com.to.cdp.info.model.InfoMember;
import com.to.cdp.info.service.InfoMemberService;

@Controller
public class InfoMemberController {
	@Autowired
	private InfoMemberService infoMemberService;
	
	// 0 . index
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String index(){
		return "home";
	}
	
	// 1. infoMemberInsert
	@RequestMapping(value="/infoMemberInsert", method=RequestMethod.GET)
	public String infoMemberInsert(){
		return "info/member/memberInsert";
	}
	
	@RequestMapping(value="/infoMemberInsert", method=RequestMethod.POST)
	public String infoMemberInsert(InfoMember infoMember){
		infoMemberService.infoMemberInsert(infoMember);
		return "redirect:/infoMemberList";
	}
	
	// 2. infoMemberUpdate
	@RequestMapping(value="/infoMemberUpdate", method=RequestMethod.GET)
	public String infoMemberUpdate(){
		return "info/member/memberUpdate";
	}
	
	@RequestMapping(value="/infoMemberUpdate", method=RequestMethod.POST)
	public String infoMemberUpdate(InfoMember infoMember){
		return "info/member/memberDetail";
	}
	
	// 3. infoMemberDelete
	@RequestMapping(value="/infoMemberDelete", method=RequestMethod.GET)
	public String infoMemberDelete(){
		return "info/member/memberDelete";
	}
	
	@RequestMapping(value="/infoMemberDelete", method=RequestMethod.POST)
	public String infoMemberDelete(InfoMember infoMember){
		return "redirect:/infoMemberList";
	}
	
	// 4. infoMemberList
	@RequestMapping(value="/infoMemberList", method=RequestMethod.GET)
	public String infoMemberList(
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

		int totalCount = infoMemberService.infoMemberCountBySearch(map);	// totalCount 
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	// 페이지셋팅
		System.out.println("pageHelper InfoMemberController : " + pageHelper);
		map.put("pageHelper", pageHelper);
		
		List<InfoMember> infoMemberList = infoMemberService.infoMemberList(map);
		System.out.println("infoMemberList InfoMemberController : " + infoMemberList);
		model.addAttribute("infoMemberList", infoMemberList);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/member/memberList";
	}
	
	@RequestMapping(value="/infoMemberList", method=RequestMethod.POST)
	public String infoMemberList(InfoMember infoMember){
		return "info/member/memberList";
	}
	
	// 5. infoMemberDetail
	@RequestMapping(value="/infoMemberDetail", method=RequestMethod.GET)
	public String infoMemberDetail(
			InfoMember infoMember, 
			Model model,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		
		infoMember = infoMemberService.infoMemberDetail(infoMember);
		model.addAttribute("infoMember", infoMember);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/member/memberDetail";
	}
	
	@RequestMapping(value="/infoMemberDetail", method=RequestMethod.POST)
	public String infoMemberDetail(){
		return "info/member/memberDetail";
	}
}
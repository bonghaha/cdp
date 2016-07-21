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
import com.to.cdp.info.model.InfoCert;
import com.to.cdp.info.service.InfoCertService;

@Controller
public class InfoCertController {
	@Autowired
	private InfoCertService infoCertService;
	
	// 1. infoCertInsert
	@RequestMapping(value="/infoCertInsert", method=RequestMethod.GET)
	public String infoCertInsert(){
		return "info/cert/certInsert";
	}
	
	@RequestMapping(value="/infoCertInsert", method=RequestMethod.POST)
	public String infoCertInsert(InfoCert infoCert){
		infoCertService.infoCertInsert(infoCert);
		return "redirect:/infoCertList";
	}
	
	// 2. infoCertUpdate
	@RequestMapping(value="/infoCertUpdate", method=RequestMethod.GET)
	public String infoCertUpdate(){
		return "infoCertUpdate";
	}
	
	@RequestMapping(value="/infoCertUpdate", method=RequestMethod.POST)
	public String infoCertUpdate(InfoCert infoCert){
		return "infoCertDetail";
	}
	
	// 3. infoCertDelete
	@RequestMapping(value="/infoCertDelete", method=RequestMethod.GET)
	public String infoCertDelete(){
		return "infoCertDelete";
	}
	
	@RequestMapping(value="/infoCertDelete", method=RequestMethod.POST)
	public String infoCertDelete(InfoCert infoCert){
		return "redirect:/infoCertList";
	}
	
	// 4. infoCertList
	@RequestMapping(value="/infoCertList", method=RequestMethod.GET)
	public String infoCertList(
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
			
			int totalCount = infoCertService.infoCertCountBySearch(map);	// totalCount 구하기
			pageHelper.pageSet(totalCount, linePerPage, clickPage,blockSize);	//페이지 셋팅하기
			System.out.println("pageHelper InfoCertController :" + pageHelper);
			map.put("pageHelper", pageHelper);
			
			List<InfoCert> infoCertList = infoCertService.infoCertList(map);
			model.addAttribute("infoCertList", infoCertList);
			model.addAttribute("pageHelper", pageHelper);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
			return "info/cert/certList";
	}
	
	@RequestMapping(value="/infoCertList", method=RequestMethod.POST)
	public String infoCertList(InfoCert infoCert){
		return "info/cert/certList";
	}
	
	// 5. infoCertDetail
	@RequestMapping(value="/infoCertDetail", method=RequestMethod.GET)
	public String infoCertDetail(
			InfoCert infoCert, 
			Model model,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		infoCert = infoCertService.infoCertDetail(infoCert);
		model.addAttribute("infoCert", infoCert);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/cert/certDetail";
	}
	
	@RequestMapping(value="/infoCertDetail", method=RequestMethod.POST)
	public String infoCertDetail(){
		return "info/cert/certDetail";
	}
}
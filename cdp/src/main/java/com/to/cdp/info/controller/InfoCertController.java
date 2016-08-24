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
import com.to.cdp.info.model.InfoCert;
import com.to.cdp.info.service.InfoCertService;

@Controller
public class InfoCertController {
	@Autowired
	private InfoCertService infoCertService;
	
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
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord) throws Exception{
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		
		List<InfoCert> infoCertList = infoCertService.infoCertList(map);
		pageHelper.pageSet(infoCertList.size(), linePerPage, clickPage, blockSize);	
		System.out.println("pageHelper InfoCertController : " + pageHelper);
		
		model.addAttribute("infoCertList", infoCertList);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/cert/certList";
	}
	
	// 5. infoCertDetail
	@RequestMapping(value="/infoCertDetail", method=RequestMethod.POST)
	public String infoCertDetail(){
		
		return "info/cert/certDetail";
	}
	
	@RequestMapping(value="/infoCertDetail", method=RequestMethod.GET)
	public String infoCertDetail(
			InfoCert infoCert,
			Model model,
			@RequestParam(value="jmCd") String jmCd,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		
		System.out.println("jmCd InfoCertController : " + jmCd);
		infoCert = infoCertService.infoCertDetail(jmCd);
		model.addAttribute("infoCert", infoCert);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/cert/certDetail";
	}
}
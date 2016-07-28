package com.to.cdp.rec.controller;

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
import com.to.cdp.info.model.InfoJob;
import com.to.cdp.info.service.InfoCertService;
import com.to.cdp.info.service.InfoJobService;
import com.to.cdp.rec.model.RecCert;
import com.to.cdp.rec.service.RecCertService;

@Controller
public class RecCertController {
	@Autowired
	private RecCertService recCertService;
	
	@Autowired
	private InfoCertService infoCertService;
	
	@Autowired
	private InfoJobService infoJobService;
	
	// 1. recCertInsert
	@RequestMapping(value="/recCertInsert", method=RequestMethod.GET)
	public String recCertInsert(
			InfoJob infoJob,
			RecCert recCert,
			Model model,
			Map<String, Object> map,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "30")  int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord,
			@RequestParam(value="infoJobUnitName", required = false, defaultValue = "") String infoJobUnitName){
	
		//infoCertList 셋팅(+페이징)
		map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		System.out.println("RecCertController recCertInsert 실행");
		int totalCount = recCertService.infoCertCountAtRec(map);	// totalCount 구하기
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	//페이지 셋팅하기
		System.out.println("pageHelper InfoCertController :" + pageHelper);
		map.put("pageHelper", pageHelper);
		map.put("infoJob", infoJob);
		
		List<InfoCert> infoCertList = infoCertService.infoCertList(map);
		model.addAttribute("infoCertList", infoCertList);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "rec/cert/certInsert";
	}
	
	//자격증 추천이유와 추천내용 등록
	@RequestMapping(value="/recCertDetailInsert", method=RequestMethod.GET)
	public String recCertDetailInsert(
			InfoJob infoJob,
			InfoCert infoCert,
			Model model){
		
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("infoCert", infoCert);
		return "rec/cert/certDetailInsert";
	}
	
	@RequestMapping(value="/recCertInsert", method=RequestMethod.POST)
	public String recCertInsert(
			InfoCert infoCert,
			InfoJob infoJob,
			RecCert recCert,
			Model model){
		
		System.out.println("RecCertController recCertInsert infoCert : " + infoCert);
		System.out.println("RecCertController recCertInsert infoJob : " + infoJob);
		System.out.println("RecCertController recCertInsert recCert : " + recCert);
		
		recCert.setInfoCertCode(infoCert.getInfoCertCode());
		recCert.setInfoJobCode(infoJob.getInfoJobCode());
		recCertService.recCertInsert(recCert);
		infoJob = infoJobService.infoJobDetail(infoJob);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("recCert", recCert);
		return "info/job/jobDetail";
	}
	
	// 2. recCertUpdate
	@RequestMapping(value="/recCertUpdate", method=RequestMethod.GET)
	public String recCertUpdate(){
		return "recCertUpdate";
	}
	
	@RequestMapping(value="/recCertUpdate", method=RequestMethod.POST)
	public String recCertUpdate(RecCert recCert){
		return "recCertDetail";
	}
	
	// 3. recCertDelete
	@RequestMapping(value="/recCertDelete", method=RequestMethod.GET)
	public String recCertDelete(){
		return "recCertDelete";
	}
	
	@RequestMapping(value="/recCertDelete", method=RequestMethod.POST)
	public String recCertDelete(RecCert recCert){
		return "redirect:/recCertList";
	}
	
	// 4. recCertList
	@RequestMapping(value="/recCertList", method=RequestMethod.GET)
	public String recCertList(
			InfoJob infoJob,
			Map<String, Object> map,
			Model model,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "30")  int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord,
			@RequestParam(value="infoJobUnitName", required = false, defaultValue = "") String infoJobUnitName){
		
		// infoCertList 셋팅(+페이징)
		map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		System.out.println("RecCertController recCertInsert 실행");
		int totalCount = recCertService.infoCertCountAtRec(map);	// totalCount 구하기
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	//페이지 셋팅하기
		System.out.println("pageHelper InfoCertController :" + pageHelper);
		map.put("pageHelper", pageHelper);
		map.put("infoJob", infoJob);
		
		// 추천자격증리스트 select
		List<Map<String, Object>> recCertListWithRecCertCondition = recCertService.recCertListWithRecCertCondition(map);
		model.addAttribute("recCertListWithRecCertCondition", recCertListWithRecCertCondition);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "rec/cert/certList";
	}
	
	@RequestMapping(value="/recCertList", method=RequestMethod.POST)
	public String recCertList(RecCert recCert){
		return "recCertList";
	}
	
	// 5. recCertDetail
	@RequestMapping(value="/recCertDetail", method=RequestMethod.GET)
	public String recCertDetail(){
		return "recCertDetail";
	}
	
	@RequestMapping(value="/recCertDetail", method=RequestMethod.POST)
	public String recCertDetail(RecCert recCert){
		return "recCertDetail";
	}
}
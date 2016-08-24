package com.to.cdp.rec.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.to.cdp.PageHelper;
import com.to.cdp.info.model.InfoCert;
import com.to.cdp.info.model.InfoJob;
import com.to.cdp.info.service.InfoCertService;
import com.to.cdp.info.service.InfoJobService;
import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.rec.model.RecCert;
import com.to.cdp.rec.model.RecSchool;
import com.to.cdp.rec.model.RecWithInfoCert;
import com.to.cdp.rec.service.RecCertService;

@Controller
public class RecCertController {
	@Autowired
	private RecCertService recCertService;
	
	@Autowired
	private InfoCertService infoCertService;
	
	@Autowired
	private InfoJobService infoJobService;
	
	// 추천자격증이유 보여주기
	@RequestMapping(value="/recCertReason")
	public String recCertReason(
			RecCert recCert,
			Model model){
		
		System.out.println("recCert /recCertReason : " + recCert);	// recCertCode 확인
		
		// job,jmFldNm,recCertReason,recCertContent 셀렉트
		recCert = recCertService.recCertReason(recCert);	
		
		model.addAttribute("recCert", recCert);	
		return "rec/cert/certReason";
	}
	
	//추천자격증리스트보여주기
	@RequestMapping(value="/recCertListByAjax", method=RequestMethod.POST)
	@ResponseBody
	public List<RecWithInfoCert> recCertListByAjax(
			PlanUnite planUnite,
			Model model){
		System.out.println("planUnite RecCertController : " + planUnite);
		List<RecWithInfoCert> recWithInfoCertList = new ArrayList<RecWithInfoCert>();
		recWithInfoCertList = recCertService.recCertListByAjax(planUnite);
		System.out.println("recWithInfoCertList RecCertController : recWithInfoCert : " + recWithInfoCertList);
		
		recWithInfoCertList = recCertService.infoCertListAtPlanUniteByAjax(recWithInfoCertList);
		System.out.println("recWithInfoCertList(Info) RecCertController : " + recWithInfoCertList);
		
		return recWithInfoCertList;
	}
	
	
	// 1. recCertInsert
	@RequestMapping(value="/recCertInsert", method=RequestMethod.GET)
	public String recCertInsert(
			InfoJob infoJob,
			RecCert recCert,
			Model model,
			Map<String, Object> map,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "10")  int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
	
		//infoCertList 
		map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		System.out.println("RecCertController recCertInsert ����");
		List<InfoCert> infoCertList = infoCertService.infoCertList(map);
		
		pageHelper.pageSet(infoCertList.size(), linePerPage, clickPage, blockSize);	//������ �����ϱ�
		System.out.println("pageHelper InfoCertController :" + pageHelper);
		model.addAttribute("infoCertList", infoCertList);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "rec/cert/certInsert";
	}
	
	//
	@RequestMapping(value="/recCertDetailInsert", method=RequestMethod.GET)
	public String recCertDetailInsert(
			InfoJob infoJob,
			InfoCert infoCert,
			Model model,
			RecCert recCert){
		
		model.addAttribute("recCert", recCert);
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
		
		recCert.setJmCd(infoCert.getJmCd());
		recCert.setJobdicSeq(infoJob.getJobdicSeq());
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
			RecCert recCert,
			Map<String, Object> map,
			Model model,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "10")  int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		
		recCert.setJobdicSeq(infoJob.getJobdicSeq());
		System.out.println("recCert recCertController recCertList : " + recCert);
		
		map = new HashMap<>();
		map.put("recCert", recCert);
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("pageHelper", pageHelper);
		System.out.println("RecCertFromMap RecCertController : " + map.get("recCert"));
		System.out.println("pageHelper InfoCertController :" + pageHelper);
		
		// 
		List<RecCert> recCertListWithRecCertCondition = recCertService.recCertListWithRecCertCondition(map);
		pageHelper.pageSet(recCertListWithRecCertCondition.size(), linePerPage, clickPage, blockSize);	//
		map.put("recCertListWithRecCertCondition", recCertListWithRecCertCondition);
		
		System.out.println("recCertListWithRecCertCondition RecCertController :" + recCertListWithRecCertCondition);
		System.out.println("recCertListWithRecCertCondition.size() RecCertController :" + recCertListWithRecCertCondition.size());
		
		List<InfoCert> infoCertListForRec = recCertService.recCertList(map);
		System.out.println("infoCertListForRec RecCertController : " + infoCertListForRec);
		System.out.println("infoCertListForRec.size() RecCertController : " + infoCertListForRec.size());
		
		List<RecWithInfoCert> recWithInfoCertList = new ArrayList<RecWithInfoCert>();
		recWithInfoCertList = recCertService.recWithInfoCertList(recCertListWithRecCertCondition, infoCertListForRec);
		System.out.println("recWithInfoCertList RecCertController : " + recWithInfoCertList);
		
		model.addAttribute("recWithInfoCertList", recWithInfoCertList);
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
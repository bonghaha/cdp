package com.to.cdp.info.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.to.cdp.PageHelper;
import com.to.cdp.info.model.InfoJob;
import com.to.cdp.info.service.InfoJobService;

@Controller
public class InfoJobController {
	@Autowired
	private InfoJobService infoJobService;
	
	// 1. API(infoJob) 받은 거 리스트로 뿌리기
	@RequestMapping(value="/infoJobList", method=RequestMethod.GET)
	public String infoJobList(
			Model model, 
			InfoJob infoJob,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "10") int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord) throws Exception{
		
//		String xml = infoJobService.restClient(searchWord);
//		System.out.println(xml);
		ArrayList<HashMap<String, Object>> getInfoJobList = infoJobService.infoJobList(searchType, searchWord); // 파싱한 값들(배열) List에 넣기
		ArrayList<InfoJob> infoJobList = new ArrayList<>(); // infoJobList 객체 생성
		HashMap<String, Object> mapList = new HashMap<>(); // 임시보관소(map) 객체 생성
		
		System.out.println("getInfoJobList.size() InfoJobController : " + getInfoJobList.size());
		int totalCount = getInfoJobList.size();	// 파싱한 것들 전체 개수 구하기
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	// 페이지 셋팅
		System.out.println(pageHelper);
		
		for(int i=0; i<getInfoJobList.size(); i++){
			infoJob = new InfoJob();
			mapList = getInfoJobList.get(i);
			infoJob.setInfoJobdicSeq((String) mapList.get("infoJobdicSeq"));
			infoJob.setInfoJob((String) mapList.get("infoJob"));
			infoJob.setInfoJobCode((String) mapList.get("infoJobCode"));
			infoJob.setInfoSummary((String) mapList.get("infoSummary"));
			infoJob.setInfoSimilarJob((String) mapList.get("infoSimilarJob"));
			infoJob.setInfoEqualemployment((String) mapList.get("infoEqualemployment"));
			infoJob.setInfoPossibility((String) mapList.get("infoPossibility"));
			infoJob.setInfoProspect((String) mapList.get("infoProspect"));
			infoJob.setInfoSalery((String) mapList.get("infoSalery"));
			infoJob.setInfoJobCtgCode((String) mapList.get("infoJobCtgCode"));
			infoJob.setInfoAptdTypeCode((String) mapList.get("infoAptdTypeCode"));
			infoJob.setInfoProfession((String) mapList.get("infoProfession"));
			infoJobList.add(i, infoJob);
		}
		model.addAttribute("infoJobList", infoJobList);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/job/jobList";
		
	}
	
	// 2. infoJobDetail
	@RequestMapping(value="/infoJobDetail", method=RequestMethod.GET)
	public String infoJobDetail(
			InfoJob infoJob, 
			Model model,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord) throws Exception{
		
//		String xml = infoJobService.restClient(searchWord);
//		System.out.println(xml);
		
		infoJob = infoJobService.infoJobDetail(infoJob);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/job/jobDetail";
	}
	
	@RequestMapping(value="/infoJobDetail", method=RequestMethod.POST)
	public String infoJobDetail(InfoJob infoJob){
		return "info/job/jobDetail";
	}
}
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
import com.to.cdp.info.model.InfoJobT;
import com.to.cdp.info.model.InfoJob;
import com.to.cdp.info.service.InfoJobTService;
import com.to.cdp.info.service.InfoJobService;
import com.to.cdp.rec.model.RecJobT;
import com.to.cdp.rec.service.RecJobTService;

@Controller
public class RecJobTController {
	@Autowired
	private RecJobTService recJobTService;
	
	@Autowired
	private InfoJobTService infoJobTService;
	
	@Autowired
	private InfoJobService infoJobService;
	
	// 1. recJobTInsert
	@RequestMapping(value="/recJobTInsert", method=RequestMethod.GET)
	public String recJobTInsert(
			InfoJob infoJob,
			RecJobT recJobT,
			Model model,
			Map<String, Object> map,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "30")  int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord,
			@RequestParam(value="infoJobUnitName", required = false, defaultValue = "") String infoJobUnitName){
	
		//infoJobTList 셋팅(+페이징)
		map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		System.out.println("RecJobTController recJobTInsert 실행");
		int totalCount = recJobTService.infoJobTCountAtRec(map);	// totalCount 구하기
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	//페이지 셋팅하기
		System.out.println("pageHelper InfoJobTController :" + pageHelper);
		map.put("pageHelper", pageHelper);
		map.put("infoJob", infoJob);
		
		List<InfoJobT> infoJobTList = infoJobTService.infoJobTList(map);
		model.addAttribute("infoJobTList", infoJobTList);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "rec/jobT/jobTInsert";
	}
	
	//직업훈련 추천이유와 추천내용 등록
	@RequestMapping(value="/recJobTDetailInsert", method=RequestMethod.GET)
	public String recJobTDetailInsert(
			InfoJob infoJob,
			InfoJobT infoJobT,
			Model model){
		
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("infoJobT", infoJobT);
		return "rec/jobT/jobtDetailInsert";
	}
	
	@RequestMapping(value="/recJobTInsert", method=RequestMethod.POST)
	public String recJobTInsert(
			InfoJobT infoJobT,
			InfoJob infoJob,
			RecJobT recJobT,
			Model model){
		
		System.out.println("RecJobTController recJobTInsert infoJobT : " + infoJobT);
		System.out.println("RecJobTController recJobTInsert infoJob : " + infoJob);
		System.out.println("RecJobTController recJobTInsert recJobT : " + recJobT);
		
		recJobT.setInfoJobTCode(infoJobT.getInfoJobTCode());
		recJobT.setInfoJobCode(infoJob.getInfoJobCode());
		recJobTService.recJobTInsert(recJobT);
		infoJob = infoJobService.infoJobDetail(infoJob);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("recJobT", recJobT);
		return "info/job/jobDetail";
	}
	
	// 2. recJobTUpdate
	@RequestMapping(value="/recJobTUpdate", method=RequestMethod.GET)
	public String recJobTUpdate(){
		return "recJobTUpdate";
	}
	
	@RequestMapping(value="/recJobTUpdate", method=RequestMethod.POST)
	public String recJobTUpdate(RecJobT recJobT){
		return "recJobTDetail";
	}
	
	// 3. recJobTDelete
	@RequestMapping(value="/recJobTDelete", method=RequestMethod.GET)
	public String recJobTDelete(){
		return "recJobTDelete";
	}
	
	@RequestMapping(value="/recJobTDelete", method=RequestMethod.POST)
	public String recJobTDelete(RecJobT recJobT){
		return "redirect:/recJobTList";
	}
	
	// 4. recJobTList
	@RequestMapping(value="/recJobTList", method=RequestMethod.GET)
	public String recJobTList(
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
		
		// infoJobTList 셋팅(+페이징)
		map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		System.out.println("RecJobTController recJobTInsert 실행");
		int totalCount = recJobTService.infoJobTCountAtRec(map);	// totalCount 구하기
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	//페이지 셋팅하기
		System.out.println("pageHelper InfoJobTController :" + pageHelper);
		map.put("pageHelper", pageHelper);
		map.put("infoJob", infoJob);
		
		// 추천직업훈련리스트 select
		List<Map<String, Object>> recJobTListWithRecJobTCondition = recJobTService.recJobTListWithRecJobTCondition(map);
		model.addAttribute("recJobTListWithRecJobTCondition", recJobTListWithRecJobTCondition);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "rec/jobT/jobTList";
	}
	
	@RequestMapping(value="/recJobTList", method=RequestMethod.POST)
	public String recJobTList(RecJobT recJobT){
		return "recJobTList";
	}
	
	// 5. recJobTDetail
	@RequestMapping(value="/recJobTDetail", method=RequestMethod.GET)
	public String recJobTDetail(){
		return "recJobTDetail";
	}
	
	@RequestMapping(value="/recJobTDetail", method=RequestMethod.POST)
	public String recJobTDetail(RecJobT recJobT){
		return "recJobTDetail";
	}
}
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
import com.to.cdp.info.model.InfoVolun;
import com.to.cdp.info.model.InfoJob;
import com.to.cdp.info.service.InfoVolunService;
import com.to.cdp.info.service.InfoJobService;
import com.to.cdp.rec.model.RecVolun;
import com.to.cdp.rec.service.RecVolunService;

@Controller
public class RecVolunController {
	@Autowired
	private RecVolunService recVolunService;
	
	@Autowired
	private InfoVolunService infoVolunService;
	
	@Autowired
	private InfoJobService infoJobService;
	
	// 1. recVolunInsert
	@RequestMapping(value="/recVolunInsert", method=RequestMethod.GET)
	public String recVolunInsert(
			InfoJob infoJob,
			RecVolun recVolun,
			Model model,
			Map<String, Object> map,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "30")  int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord,
			@RequestParam(value="infoJobUnitName", required = false, defaultValue = "") String infoJobUnitName){
	
		//infoVolunList 셋팅(+페이징)
		map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		System.out.println("RecVolunController recVolunInsert 실행");
		int totalCount = recVolunService.infoVolunCountAtRec(map);	// totalCount 구하기
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	//페이지 셋팅하기
		System.out.println("pageHelper InfoVolunController :" + pageHelper);
		map.put("pageHelper", pageHelper);
		map.put("infoJob", infoJob);
		
		List<InfoVolun> infoVolunList = infoVolunService.infoVolunList(map);
		model.addAttribute("infoVolunList", infoVolunList);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "rec/volun/volunInsert";
	}
	
	//봉사활동 추천이유와 추천내용 등록
	@RequestMapping(value="/recVolunDetailInsert", method=RequestMethod.GET)
	public String recVolunDetailInsert(
			InfoJob infoJob,
			InfoVolun infoVolun,
			Model model){
		
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("infoVolun", infoVolun);
		return "rec/volun/volunDetailInsert";
	}
	
	@RequestMapping(value="/recVolunInsert", method=RequestMethod.POST)
	public String recVolunInsert(
			InfoVolun infoVolun,
			InfoJob infoJob,
			RecVolun recVolun,
			Model model){
		
		System.out.println("RecVolunController recVolunInsert infoVolun : " + infoVolun);
		System.out.println("RecVolunController recVolunInsert infoJob : " + infoJob);
		System.out.println("RecVolunController recVolunInsert recVolun : " + recVolun);
		
		recVolun.setInfoVolunCode(infoVolun.getInfoVolunCode());
		recVolun.setInfoJobCode(infoJob.getInfoJobCode());
		recVolunService.recVolunInsert(recVolun);
		infoJob = infoJobService.infoJobDetail(infoJob);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("recVolun", recVolun);
		return "info/job/jobDetail";
	}
	
	// 2. recVolunUpdate
	@RequestMapping(value="/recVolunUpdate", method=RequestMethod.GET)
	public String recVolunUpdate(){
		return "recVolunUpdate";
	}
	
	@RequestMapping(value="/recVolunUpdate", method=RequestMethod.POST)
	public String recVolunUpdate(RecVolun recVolun){
		return "recVolunDetail";
	}
	
	// 3. recVolunDelete
	@RequestMapping(value="/recVolunDelete", method=RequestMethod.GET)
	public String recVolunDelete(){
		return "recVolunDelete";
	}
	
	@RequestMapping(value="/recVolunDelete", method=RequestMethod.POST)
	public String recVolunDelete(RecVolun recVolun){
		return "redirect:/recVolunList";
	}
	
	// 4. recVolunList
	@RequestMapping(value="/recVolunList", method=RequestMethod.GET)
	public String recVolunList(
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
		
		// infoVolunList 셋팅(+페이징)
		map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		System.out.println("RecVolunController recVolunInsert 실행");
		int totalCount = recVolunService.infoVolunCountAtRec(map);	// totalCount 구하기
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	//페이지 셋팅하기
		System.out.println("pageHelper InfoVolunController :" + pageHelper);
		map.put("pageHelper", pageHelper);
		map.put("infoJob", infoJob);
		
		// 추천봉사활동리스트 select
		List<Map<String, Object>> recVolunListWithRecVolunCondition = recVolunService.recVolunListWithRecVolunCondition(map);
		model.addAttribute("recVolunListWithRecVolunCondition", recVolunListWithRecVolunCondition);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "rec/volun/volunList";
	}
	
	@RequestMapping(value="/recVolunList", method=RequestMethod.POST)
	public String recVolunList(RecVolun recVolun){
		return "recVolunList";
	}
	
	// 5. recVolunDetail
	@RequestMapping(value="/recVolunDetail", method=RequestMethod.GET)
	public String recVolunDetail(){
		return "recVolunDetail";
	}
	
	@RequestMapping(value="/recVolunDetail", method=RequestMethod.POST)
	public String recVolunDetail(RecVolun recVolun){
		return "recVolunDetail";
	}
}
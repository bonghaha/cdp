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
import com.to.cdp.info.model.InfoBook;
import com.to.cdp.info.model.InfoContest;
import com.to.cdp.info.model.InfoJob;
import com.to.cdp.info.service.InfoCertService;
import com.to.cdp.info.service.InfoContestService;
import com.to.cdp.info.service.InfoJobService;
import com.to.cdp.rec.model.RecBook;
import com.to.cdp.rec.model.RecContest;
import com.to.cdp.rec.service.RecContestService;

@Controller
public class RecContestController {
	@Autowired
	private RecContestService recContestService;
	
	@Autowired
	private InfoContestService infoContestService;
	
	@Autowired
	private InfoJobService infoJobService;
	
	// 1. recContestInsert
	@RequestMapping(value="/recContestInsert", method=RequestMethod.GET)
	public String recContestInsert(
			InfoJob infoJob,
			RecContest recContest,
			Model model,
			Map<String, Object> map,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "30")  int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord,
			@RequestParam(value="infoJobUnitName", required = false, defaultValue = "") String infoJobUnitName){
	
		//infoContestList 셋팅(+페이징)
		map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		System.out.println("RecContestController recContestInsert 실행");
		int totalCount = recContestService.infoContestCountAtRec(map); // totalCount 구하기
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	//페이지 셋팅하기
		System.out.println("pageHelper InfoBookController :" + pageHelper);
		map.put("pageHelper", pageHelper);
		map.put("infoJob", infoJob);
		
		List<InfoContest> infoContestList = infoContestService.infoContestList(map);
		model.addAttribute("infoContestList", infoContestList);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "rec/contest/contestInsert";
	}
	
	//공모전 추천이유와 추천내용 등록
		@RequestMapping(value="/recContestDetailInsert", method=RequestMethod.GET)
		public String recContestDetailInsert(
				InfoJob infoJob,
				InfoContest infoContest,
				Model model){
			
			model.addAttribute("infoJob", infoJob);
			model.addAttribute("infoContest", infoContest);
			return "rec/contest/contestDetailInsert";
		}
		
		@RequestMapping(value="/recContestInsert", method=RequestMethod.POST)
		public String recBookInsert(
				InfoContest infoContest,
				InfoJob infoJob,
				RecContest recContest,
				Model model){
			
			System.out.println("RecContestController recContestInsert infoContest : " + infoContest);
			System.out.println("RecContestController recContestInsert infoJob : " + infoJob);
			System.out.println("RecContestController recContestInsert recContest : " + recContest);
			
			recContest.setInfoContestCode(infoContest.getInfoContestCode());
			recContest.setInfoJobCode(infoJob.getInfoJobCode());
			recContestService.recContestInsert(recContest);
			infoJob = infoJobService.infoJobDetail(infoJob);
			model.addAttribute("infoJob", infoJob);
			model.addAttribute("recBook", recContest);
			return "info/job/jobDetail";
		}
		
		// 2. recContestUpdate
		@RequestMapping(value="/recContestUpdate", method=RequestMethod.GET)
		public String recContestUpdate(){
			return "recContestUpdate";
		}
		
		@RequestMapping(value="/recContestUpdate", method=RequestMethod.POST)
		public String recContestUpdate(RecContest recContest){
			return "recContestDetail";
		}
		
		// 3. recContestDelete
		@RequestMapping(value="/recContestDelete", method=RequestMethod.GET)
		public String recContestDelete(){
			return "recContestDelete";
		}
		
		@RequestMapping(value="/recContestDelete", method=RequestMethod.POST)
		public String recContestDelete(RecContest recContest){
			return "redirect:/recContestList";
		}
		
		// 4. recContestList
		@RequestMapping(value="/recContestList", method=RequestMethod.GET)
		public String recContestList(
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
			
			// infoContestList 셋팅(+페이징)
			map = new HashMap<>();
			map.put("searchType", searchType);
			map.put("searchWord", searchWord);
			System.out.println("RecContestController recContestInsert 실행");
			int totalCount = recContestService.infoContestCountAtRec(map);	// totalCount 구하기
			pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	//페이지 셋팅하기
			System.out.println("pageHelper InfoContestController :" + pageHelper);
			map.put("pageHelper", pageHelper);
			map.put("infoJob", infoJob);
			
			// 추천공모전리스트 select
			List<Map<String, Object>> recContestListWithRecContestCondition = recContestService.recContestListWithRecContestCondition(map);
			model.addAttribute("recContestListWithRecContestCondition", recContestListWithRecContestCondition);
			model.addAttribute("infoJob", infoJob);
			model.addAttribute("pageHelper", pageHelper);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
			return "rec/contest/contestList";
		}
		
		@RequestMapping(value="/recContestList", method=RequestMethod.POST)
		public String recContestList(RecContest recContest){
			return "recContestList";
		}
		
		// 5. recContestDetail
		@RequestMapping(value="/recContestDetail", method=RequestMethod.GET)
		public String recContestDetail(){
			return "recContestDetail";
		}
		
		@RequestMapping(value="/recContestDetail", method=RequestMethod.POST)
		public String recContestDetail(RecContest recContest){
			return "recContestDetail";
		}
}
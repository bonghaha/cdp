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
import com.to.cdp.info.model.InfoJob;
import com.to.cdp.info.service.InfoBookService;
import com.to.cdp.info.service.InfoJobService;
import com.to.cdp.rec.model.RecBook;
import com.to.cdp.rec.service.RecBookService;

@Controller
public class RecBookController {
	@Autowired
	private RecBookService recBookService;
	
	@Autowired
	private InfoBookService infoBookService;
	
	@Autowired
	private InfoJobService infoJobService;
	
	// 1. recBookInsert
	@RequestMapping(value="/recBookInsert", method=RequestMethod.GET)
	public String recBookInsert(
			InfoJob infoJob,
			RecBook recBook,
			Model model,
			Map<String, Object> map,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "30")  int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord,
			@RequestParam(value="infoJobUnitName", required = false, defaultValue = "") String infoJobUnitName){
	
		//infoBookList 셋팅(+페이징)
		map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		System.out.println("RecBookController recBookInsert 실행");
		int totalCount = recBookService.infoBookCountAtRec(map);	// totalCount 구하기
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	//페이지 셋팅하기
		System.out.println("pageHelper InfoBookController :" + pageHelper);
		map.put("pageHelper", pageHelper);
		map.put("infoJob", infoJob);
		

		// info_job_code로 rec_book테이블의 info_book_code select
//		List<RecBook> infoBookCodeListAtRecBook = recBookService.recBookSelectInfoBookCodeByInfoJob(infoJob);
		
//		List<InfoBook> infoBookList = infoBookService.infoBookList(map);
		
//		map.put("recBook", infoBookCodeListAtRecBook);
		
		// infoJobCode를 입력받아 info_book의 info_book_code와 rec_book의 info_book_code이 같은 리스트 출력
		List<Map<String, Object>> infoBookListWithRecBookCondition = recBookService.infoBookListWithRecBookCondition(map);
		model.addAttribute("infoBookListWithRecBookCondition", infoBookListWithRecBookCondition);
//		model.addAttribute("recBookList", infoBookCodeListAtRecBook);
//		model.addAttribute("infoBookList", infoBookList);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "rec/book/bookInsert";
	}
	
	//도서 추천이유와 추천내용 등록
	@RequestMapping(value="/recBookDetailInsert", method=RequestMethod.GET)
	public String recBookDetailInsert(
			InfoJob infoJob,
			InfoBook infoBook,
			Model model){
		
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("infoBook", infoBook);
		return "rec/book/bookDetailInsert";
	}
	
	@RequestMapping(value="/recBookInsert", method=RequestMethod.POST)
	public String recBookInsert(
			InfoBook infoBook,
			InfoJob infoJob,
			RecBook recBook,
			Model model){
		
		System.out.println("RecBookController recBookInsert infoBook : " + infoBook);
		System.out.println("RecBookController recBookInsert infoJob : " + infoJob);
		System.out.println("RecBookController recBookInsert recBook : " + recBook);
		
		recBook.setInfoBookCode(infoBook.getInfoBookCode());
		recBook.setInfoJobCode(infoJob.getInfoJobCode());
		recBookService.recBookInsert(recBook);
		infoJob = infoJobService.infoJobDetail(infoJob);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("recBook", recBook);
		return "info/job/jobDetail";
	}
	
	// 2. recBookUpdate
	@RequestMapping(value="/recBookUpdate", method=RequestMethod.GET)
	public String recBookUpdate(){
		return "recBookUpdate";
	}
	
	@RequestMapping(value="/recBookUpdate", method=RequestMethod.POST)
	public String recBookUpdate(RecBook recBook){
		return "recBookDetail";
	}
	
	// 3. recBookDelete
	@RequestMapping(value="/recBookDelete", method=RequestMethod.GET)
	public String recBookDelete(){
		return "recBookDelete";
	}
	
	@RequestMapping(value="/recBookDelete", method=RequestMethod.POST)
	public String recBookDelete(RecBook recBook){
		return "redirect:/recBookList";
	}
	
	// 4. recBookList
	@RequestMapping(value="/recBookList", method=RequestMethod.GET)
	public String recBookList(
			InfoJob infoJob,
			Model model){
		infoJob = recBookService.selectInfoJobCodeByInfoJobUnitName(infoJob);
		List<RecBook> recBookList = recBookService.recBookListByInfoJobCode(infoJob);
		List<Map<String,Object>> recBookListWithDetail = recBookService.recBookListWithDetail(recBookList);
		model.addAttribute("recBookList", recBookList);
		return "rec/book/bookList";
	}
	
	@RequestMapping(value="/recBookList", method=RequestMethod.POST)
	public String recBookList(RecBook recBook){
		return "recBookList";
	}
	
	// 5. recBookDetail
	@RequestMapping(value="/recBookDetail", method=RequestMethod.GET)
	public String recBookDetail(){
		return "recBookDetail";
	}
	
	@RequestMapping(value="/recBookDetail", method=RequestMethod.POST)
	public String recBookDetail(RecBook recBook){
		return "recBookDetail";
	}
}
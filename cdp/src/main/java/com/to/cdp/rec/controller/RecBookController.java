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
import com.to.cdp.rec.model.RecBook;
import com.to.cdp.rec.service.RecBookService;

@Controller
public class RecBookController {
	@Autowired
	private RecBookService recBookService;
	@Autowired
	private InfoBookService infoBookService;
	
	// 1. recBookInsert
	@RequestMapping(value="/recBookInsert", method=RequestMethod.GET)
	public String recBookInsert(
			InfoJob infoJob,
			Model model,
			Map<String, Object> map,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "30")  int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord,
			@RequestParam(value="infoJobUnitName", required = false, defaultValue = "") String infoJobUnitName){
	
		map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		System.out.println("RecBookController recBookInsert 실행");
		int totalCount = recBookService.infoBookCountAtRec(map);	// totalCount 구하기
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	//페이지 셋팅하기
		System.out.println("pageHelper InfoBookController :" + pageHelper);
		map.put("pageHelper", pageHelper);
		
		List<InfoBook> infoBookList = infoBookService.infoBookList(map);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("infoBookList", infoBookList);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "rec/book/bookInsert";
	}
	@RequestMapping(value="/recBookDetailInsert", method=RequestMethod.GET)
	public String recBookDetailInsert(
			InfoBook infoBook,
			InfoJob infoJob,
			Model model){
		
		model.addAttribute("infoBook", infoBook);
		model.addAttribute("infoJob", infoJob);
		return "rec/book/bookDetailInsert";
	}
	
	
	
	@RequestMapping(value="/recBookInsert", method=RequestMethod.POST)
	public String recBookInsert(
			InfoBook infoBook,
			InfoJob infoJob,
			Map<String, Object> map){
		
		map = new HashMap<>();
		map.put("infoBook", infoBook);
		map.put("infoJob", infoJob);
		
		recBookService.recBookInsert(map);
		
		return "recBookDetail";
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
	public String recBookList(){
		return "recBookList";
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
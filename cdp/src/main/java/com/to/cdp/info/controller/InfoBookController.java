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
import com.to.cdp.info.model.InfoBook;
import com.to.cdp.info.service.InfoBookService;

@Controller
public class InfoBookController {
	@Autowired
	private InfoBookService infoBookService;
	
	// 1. infoBookInsert
	@RequestMapping(value="/infoBookInsert", method=RequestMethod.GET)
	public String infoBookInsert(){
		return "info/book/bookInsert";
	}
	
	@RequestMapping(value="/infoBookInsert", method=RequestMethod.POST)
	public String infoBookInsert(InfoBook infoBook){
		infoBookService.infoBookInsert(infoBook);
		return "redirect:/infoBookList";
	}
	
	// 2. infoBookUpdate
	@RequestMapping(value="/infoBookUpdate", method=RequestMethod.GET)
	public String infoBookUpdate(){
		return "infoBookUpdate";
	}
	
	@RequestMapping(value="/infoBookUpdate", method=RequestMethod.POST)
	public String infoBookUpdate(InfoBook infoBook){
		return "infoBookDetail";
	}
	
	// 3. infoBookDelete
	@RequestMapping(value="/infoBookDelete", method=RequestMethod.GET)
	public String infoBookDelete(){
		return "infoBookDelete";
	}
	
	@RequestMapping(value="/infoBookDelete", method=RequestMethod.POST)
	public String infoBookDelete(InfoBook infoBook){
		return "redirect:/infoBookList";
	}
	
	// 4. infoBookList
	@RequestMapping(value="/infoBookList", method=RequestMethod.GET)
	public String infoBookList(
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
		
		int totalCount = infoBookService.infoBookCountBySearch(map);	// totalCount 구하기
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	//페이지 셋팅하기
		System.out.println("pageHelper InfoBookController :" + pageHelper);
		map.put("pageHelper", pageHelper);
		
		List<InfoBook> infoBookList = infoBookService.infoBookList(map);
		model.addAttribute("infoBookList", infoBookList);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/book/bookList";
	}
	
	@RequestMapping(value="/infoBookList", method=RequestMethod.POST)
	public String infoBookList(InfoBook infoBook){
		return "info/book/bookList";
	}
	
	// 5. infoBookDetail
	@RequestMapping(value="/infoBookDetail", method=RequestMethod.GET)
	public String infoBooDetail(
			InfoBook infoBook, 
			Model model,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		infoBook = infoBookService.infoBookDetail(infoBook);
		model.addAttribute("infoBook", infoBook);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/book/bookDetail";
	}
	
	@RequestMapping(value="/infoBookDetail", method=RequestMethod.POST)
	public String infoBookDetail(){
		return "info/book/bookDetail";
	}
}
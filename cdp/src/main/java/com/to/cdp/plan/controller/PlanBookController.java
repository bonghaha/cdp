package com.to.cdp.plan.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.to.cdp.plan.model.PlanBook;
import com.to.cdp.plan.service.PlanBookService;

@Controller
public class PlanBookController {
	@Autowired
	private PlanBookService planBookService;
	
	// 1. planBookInsert
	@RequestMapping(value="/planBookInsert", method=RequestMethod.GET)
	public String planBookInsert(
			PlanBook planBook,
			Map<String, Object> map,
			@RequestParam(value="recBookCode") List<String> recBookCodeArr){
		
		System.out.println("recBookCode사이즈 PlanBookController : " + recBookCodeArr.size());
		for(String recBookCode : recBookCodeArr){
			System.out.println("recBookCode PlanBookController planBookInsert : " + recBookCode);
			//PlanBook dto에 있는 항목들 받아서 planBook(map)에 넣어서 Insert하기
			//PlanBookCode는 PlanBookService에서 추가
			planBook.setRecBookCode(recBookCode);
			
			planBookService.planBookInsert(map);
		}
		
		return "plan/book/bookInsert";
	}
	
	@RequestMapping(value="/planBookInsert", method=RequestMethod.POST)
	public String planBookInsert(PlanBook planBook){
		return "planBookDetail";
	}
	
	// 2. planBookUpdate
	@RequestMapping(value="/planBookUpdate", method=RequestMethod.GET)
	public String planBookUpdate(){
		return "planBookUpdate";
	}
	
	@RequestMapping(value="/planBookUpdate", method=RequestMethod.POST)
	public String planBookUpdate(PlanBook planBook){
		return "planBookDetail";
	}
	
	// 3. planBookDelete
	@RequestMapping(value="/planBookDelete", method=RequestMethod.GET)
	public String planBookDelete(){
		return "planBookDelete";
	}
	
	@RequestMapping(value="/planBookDelete", method=RequestMethod.POST)
	public String planBookDelete(PlanBook planBook){
		return "redirect:/planBookList";
	}
	
	// 4. planBookList
	@RequestMapping(value="/planBookList", method=RequestMethod.GET)
	public String planBookList(){
		return "planBookList";
	}
	
	@RequestMapping(value="/planBookList", method=RequestMethod.POST)
	public String planBookList(PlanBook planBook){
		return "planBookList";
	}
	
	// 5. planBookDetail
	@RequestMapping(value="/planBookDetail", method=RequestMethod.GET)
	public String planBookDetail(){
		return "planBookDetail";
	}
	
	@RequestMapping(value="/planBookDetail", method=RequestMethod.POST)
	public String planBookDetail(PlanBook planBook){
		return "planBookDetail";
	}
}
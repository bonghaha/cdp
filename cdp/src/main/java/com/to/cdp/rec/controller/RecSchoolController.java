package com.to.cdp.rec.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.to.cdp.PageHelper;
import com.to.cdp.info.model.InfoSchool;
import com.to.cdp.info.model.InfoJob;
import com.to.cdp.info.model.InfoMember;
import com.to.cdp.info.service.InfoSchoolService;
import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.info.service.InfoJobService;
import com.to.cdp.info.service.InfoMemberService;
import com.to.cdp.rec.model.RecSchool;
import com.to.cdp.rec.model.RecWithInfoSchool;
import com.to.cdp.rec.service.RecSchoolService;

@Controller
public class RecSchoolController {
	@Autowired
	private RecSchoolService recSchoolService;
	@Autowired
	private InfoSchoolService infoSchoolService;
	@Autowired
	private InfoJobService infoJobService;
	@Autowired
	private InfoMemberService infoMemberService;
	
	// 추천학교이유 보여주기
	@RequestMapping(value="/recSchoolReason")
	public String recSchoolReason(
			RecSchool recSchool,
			Model model){
		
		System.out.println("recSchool /recSchoolReason : " + recSchool);	// recSchoolCode 확인
		
		// job,schoolName,recSchoolReason,recSchoolContent 셀렉트
		recSchool = recSchoolService.recSchoolReason(recSchool);	
		
		model.addAttribute("recSchool", recSchool);	
		return "rec/school/schoolReason";
	}
	
	// 추천학교리스트보여주기AtPlanUniteDetailByAjax
	@RequestMapping(value="/recSchoolListByAjax", method=RequestMethod.POST)
	@ResponseBody
	public List<RecWithInfoSchool> recSchoolListByAjax(
			PlanUnite planUnite, 
			Model model){
		
		System.out.println("planUnite RecSchoolController : " + planUnite);	// jobdicSeq
		List<RecWithInfoSchool> recWithInfoSchoolList = new ArrayList<RecWithInfoSchool>();
		recWithInfoSchoolList = recSchoolService.recSchoolListByAjax(planUnite);
		System.out.println("recWithInfoSchool RecSchoolController : recWithInfoSchool : " + recWithInfoSchoolList);	// jobdicSeq, seq 포함
		
		recWithInfoSchoolList = recSchoolService.infoSchoolListAtPlanUniteByAjax(recWithInfoSchoolList);
		System.out.println("recWithInfoSchoolList(info) RecSchoolController : " + recWithInfoSchoolList);
		
		return recWithInfoSchoolList;
	}
	
	// 1. recSchoolInsert
	@RequestMapping(value="/recSchoolInsert", method=RequestMethod.GET)
	public String recSchoolInsert(
			InfoJob infoJob,
			Model model,
			Map<String, Object> map,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "10")  int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
	
		//infoSchoolList 
		map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		
		//추천하기위한 infoSchoolList 보여주기
		List<InfoSchool> infoSchoolList = infoSchoolService.infoSchoolList(map);
		System.out.println("infoSchoolList.size() RecSchoolController : " + infoSchoolList.size());
		
		pageHelper.pageSet(infoSchoolList.size(), linePerPage, clickPage, blockSize);	//
		System.out.println("pageHelper InfoSchoolController :" + pageHelper);
		
		model.addAttribute("infoSchoolList", infoSchoolList);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "rec/school/schoolInsert";
	}
	
	@RequestMapping(value="/recSchoolInsert", method=RequestMethod.POST)
	public String recSchoolInsert(
			InfoJob infoJob,
			RecSchool recSchool,
			InfoMember infoMember,
			HttpSession session,
			Model model){
		
//		System.out.println("RecSchoolController recSchoolInsert recSchool : " + recSchool);
		
		recSchoolService.recSchoolInsert(recSchool);
		infoJob = infoJobService.infoJobDetail(infoJob);
		
		// 권한에 의한 버튼 출력
		String infoMemberId = (String) session.getAttribute("memberLoginId");
		infoMember.setInfoMemberId(infoMemberId);
		infoMember = infoMemberService.selectInfoMemberLevel(infoMember);
		
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("infoMember", infoMember);
		return "info/job/jobDetail";
	}
	
	//
	@RequestMapping(value="/recSchoolDetailInsert", method=RequestMethod.GET)
	public String recSchoolDetailInsert(
			InfoJob infoJob,
			InfoSchool infoSchool,
			Model model,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("infoSchool", infoSchool);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "rec/school/schoolDetailInsert";
	}
	
	// 4. recSchoolList
	@RequestMapping(value="/recSchoolList", method=RequestMethod.GET)
	public String recSchoolList(
			InfoJob infoJob,
			RecSchool recSchool,
			Map<String, Object> map,
			Model model,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "10")  int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		
		System.out.println("recSchool RecSchoolController : " + recSchool);
		
		map = new HashMap<>();
		map.put("recSchool", recSchool);
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("pageHelper", pageHelper);
//		System.out.println("recSchoolFromMap RecSchoolController : " + map.get("recSchool"));
//		System.out.println("pageHelper InfoSchoolController :" + pageHelper);
		
		//추천이유 및 상태 리스트 , seq 리스트에 셋팅
		List<RecSchool> recSchoolListWithRecSchoolCondition = recSchoolService.recSchoolListWithRecSchoolCondition(map);
		pageHelper.pageSet(recSchoolListWithRecSchoolCondition.size(), linePerPage, clickPage, blockSize);
		map.put("recSchoolListWithRecSchoolCondition", recSchoolListWithRecSchoolCondition);
		
//		System.out.println("recSchoolListWithRecSchoolCondition RecSchoolController : " + recSchoolListWithRecSchoolCondition);
//		System.out.println("recSchoolListWithRecSchoolCondition.size() : " + recSchoolListWithRecSchoolCondition.size());

		//seq 배열 이용해서 api 데이터list 가져오기
		List<InfoSchool> infoSchoolListForRec = recSchoolService.recSchoolList(map);
//		System.out.println("infoSchoolListForRec RecSchoolController : " + infoSchoolListForRec);
//		System.out.println("infoSchoolListForRec.size() RecSchoolController : " + infoSchoolListForRec.size());

		List<RecWithInfoSchool> recWithInfoSchoolList = new ArrayList<RecWithInfoSchool>();
		recWithInfoSchoolList = recSchoolService.recWithInfoSchoolList(recSchoolListWithRecSchoolCondition, infoSchoolListForRec);
//		System.out.println("recWithInfoSchoolList RecSchoolController : " + recWithInfoSchoolList);
		
		model.addAttribute("recWithInfoSchoolList", recWithInfoSchoolList);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "rec/school/schoolList";
	}
}
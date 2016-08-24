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
import com.to.cdp.info.model.InfoDept;
import com.to.cdp.info.model.InfoJob;
import com.to.cdp.info.model.InfoMember;
import com.to.cdp.info.service.InfoDeptService;
import com.to.cdp.info.service.InfoJobService;
import com.to.cdp.info.service.InfoMemberService;
import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.rec.model.RecDept;
import com.to.cdp.rec.model.RecSchool;
import com.to.cdp.rec.model.RecWithInfoDept;
import com.to.cdp.rec.service.RecDeptService;

@Controller
public class RecDeptController {
	@Autowired
	private RecDeptService recDeptService;
	@Autowired
	private InfoDeptService infoDeptService;
	@Autowired
	private InfoJobService infoJobService;
	@Autowired
	private InfoMemberService infoMemberService;
	
	// 추천학과이유 보여주기
	@RequestMapping(value="/recDeptReason")
	public String recDeptReason(
			RecDept recDept,
			Model model){
		
		System.out.println("recDept /recDeptReason : " + recDept);	// recDeptCode 확인
		
		// job,mClass,recDeptReason,recDeptContent 셀렉트
		recDept = recDeptService.recDeptReason(recDept);	
		
		model.addAttribute("recDept", recDept);	
		return "rec/dept/deptReason";
	}
	
	// 추천학과리스트보여주기AtPlanUniteDetailByAjax
	@RequestMapping(value="/recDeptListByAjax", method=RequestMethod.POST)
	@ResponseBody
	public List<RecWithInfoDept> recDeptListByAjax(
			PlanUnite planUnite, 
			Model model){
		
		System.out.println("planUnite RecDeptController : " + planUnite);	// jobdicSeq
		List<RecWithInfoDept> recWithInfoDeptList = new ArrayList<RecWithInfoDept>();
		recWithInfoDeptList = recDeptService.recDeptListByAjax(planUnite);
		System.out.println("recWithInfoDept RecDeptController : recWithInfoDept : " + recWithInfoDeptList);	// jobdicSeq, seq 포함
		
		recWithInfoDeptList = recDeptService.infoDeptListAtPlanUniteByAjax(recWithInfoDeptList);
		System.out.println("recWithInfoDeptList(info) RecDeptController : " + recWithInfoDeptList);
		
		return recWithInfoDeptList;
	}
	
	// 1. recDeptInsert
	@RequestMapping(value="/recDeptInsert", method=RequestMethod.GET)
	public String recDeptInsert(
			InfoJob infoJob,
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
		
		
		List<InfoDept> infoDeptList = infoDeptService.infoDeptList(map);	// 파싱한 값들(list) List에 넣기
		System.out.println("RecDeptController recDeptInsert " + infoDeptList.size());
		
		pageHelper.pageSet(infoDeptList.size(), linePerPage, clickPage, blockSize);	// 페이지 셋팅
		System.out.println("pageHelper InfoBookController :" + pageHelper);
		
		model.addAttribute("infoDeptList", infoDeptList);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "rec/dept/deptInsert";
	}
	
	@RequestMapping(value="/recDeptInsert", method=RequestMethod.POST)
	public String recDeptInsert(
			InfoJob infoJob,
			RecDept recDept,
			InfoMember infoMember,
			HttpSession session,
			Model model){
		
//		System.out.println("recDeptController recDeptInsert recDept : " + recDept);
		
		recDeptService.recDeptInsert(recDept);
		infoJob = infoJobService.infoJobDetail(infoJob);
		
		// 권한에 의한 버튼 출력
		String infoMemberId = (String) session.getAttribute("memberLoginId");
		infoMember.setInfoMemberId(infoMemberId);
		infoMember = infoMemberService.selectInfoMemberLevel(infoMember);
		
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("infoMember", infoMember);
		return "info/job/jobDetail";
	}
	
	// 4. recDeptList
	@RequestMapping(value="/recDeptList", method=RequestMethod.GET)
	public String recDeptList(
			InfoJob infoJob,
			RecDept recDept,
			Map<String, Object> map,
			Model model,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "10")  int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		
		
		map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		map.put("pageHelper", pageHelper);
		map.put("infoJob", infoJob);
		map.put("recDept", recDept);
		
		List<RecDept> recDeptListWithRecDeptCondition = recDeptService.recDeptListWithRecDeptCondition(map);
		pageHelper.pageSet(recDeptListWithRecDeptCondition.size(), linePerPage, clickPage, blockSize);	//
		map.put("recDeptListWithRecDeptCondition", recDeptListWithRecDeptCondition);
//		System.out.println("pageHelper InfoDeptController :" + pageHelper);
	
		List<InfoDept> infoDeptListForRec = recDeptService.recDeptList(map);
//		System.out.println("recDeptCont infoDeptListForRec" + infoDeptListForRec);
		
		List<RecWithInfoDept> recWithInfoDeptList = new ArrayList<RecWithInfoDept>();
		recWithInfoDeptList = recDeptService.recWithInfoDeptList(recDeptListWithRecDeptCondition, infoDeptListForRec);
		
		
		model.addAttribute("recWithInfoDeptList", recWithInfoDeptList);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "rec/dept/deptList";
	}
	
	// 5. recDeptDetail
	@RequestMapping(value="/recDeptDetailInsert", method=RequestMethod.GET)
	public String recDeptDetailInsert(
			InfoJob infoJob,
			InfoDept infoDept,
			Model model,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("infoDept", infoDept);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "rec/dept/deptDetailInsert";
	}
}
package com.to.cdp.plan.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.to.cdp.plan.model.PlanDeptDetail;
import com.to.cdp.plan.service.PlanDeptDetailService;

@Controller
public class PlanDeptDetailController {
	@Autowired
	private PlanDeptDetailService planDeptDetailService;
	
	@RequestMapping(value="/planDeptDetailComplete")
	@ResponseBody
	public ModelAndView planDeptDetailComplete(PlanDeptDetail planDeptDetail){
		System.out.println("=========planDeptDetailController /planDeptDetailComplete======");
		
		System.out.println("planDeptDetail : " + planDeptDetail);
		// condition 1로 업데이트
		planDeptDetailService.planDeptDetailComplete(planDeptDetail);
		
		// planDeptCode 받아와서 /planDeptDetailList 로 가기
		String planDeptCode = planDeptDetailService.pdCodeByPddCode(planDeptDetail);
		System.out.println("planDept : " + planDeptCode);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("planDeptCode", planDeptCode);
		mav.setViewName("redirect:/planDeptDetailList");
		
		System.out.println("======planDeptDetailController /planDeptDetailComplete END=====");
		return mav;
	}
	
	// planDeptDetailList(ajax)
	@RequestMapping(value="/planDeptDetailList")
	@ResponseBody
	public List<PlanDeptDetail> planDeptDetailList(
			PlanDeptDetail planDeptDetail,
			HttpSession session,
			Map<String,Object> map,
			ModelAndView mav){
		
		System.out.println("planDeptDetail /planDeptDetailList : " + planDeptDetail);	//planDeptCode받음
		
		// planDeptCode에 해당하는 planDeptDetail 리스트 가져오기
		List<PlanDeptDetail> planDeptDetailList = new ArrayList<PlanDeptDetail>();
		planDeptDetail.setInfoMemberId((String) session.getAttribute("memberLoginId"));
		planDeptDetailList = planDeptDetailService.planDeptDetailList(planDeptDetail);	//planDeptCode에 해당하는 거 리스트 뽑기
		System.out.println("planDeptDetail /planDeptDetailList : " + planDeptDetailList);
		return planDeptDetailList;
	}
	
	// planDeptDetailInsert(ajax)
	@RequestMapping(value="/planDeptDetailInsert")
	@ResponseBody
	public void planDeptDetailInsert(
			PlanDeptDetail planDeptDetail,
			HttpSession session){
		
		//planDeptCode받아서 planDeptDetail에 insert(+planDeptDetailCode,시작일,종료일,자세한 디테일들)
		System.out.println("planDeptDetail /planDeptDetailInsert : " + planDeptDetail);
		planDeptDetail.setInfoMemberId((String) session.getAttribute("memberLoginId"));
		planDeptDetailService.planDeptDetailInsert(planDeptDetail);
	}
}

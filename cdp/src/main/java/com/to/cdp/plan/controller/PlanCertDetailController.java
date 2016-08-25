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

import com.to.cdp.plan.model.PlanCertDetail;
import com.to.cdp.plan.service.PlanCertDetailService;

@Controller
public class PlanCertDetailController {
	@Autowired
	private PlanCertDetailService planCertDetailService;
	
	@RequestMapping(value="/planCertDetailComplete")
	@ResponseBody
	public ModelAndView planCertDetailComplete(PlanCertDetail planCertDetail){
		System.out.println("=========planCertDetailController /planCertDetailComplete======");
		
		System.out.println("planCertDetail : " + planCertDetail);
		// condition 1로 업데이트
		planCertDetailService.planCertDetailComplete(planCertDetail);
		
		// planCertCode 받아와서 /planCertDetailList 로 가기
		String planCertCode = planCertDetailService.pcCodeByPcdCode(planCertDetail);
		System.out.println("planCert : " + planCertCode);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("planCertCode", planCertCode);
		mav.setViewName("redirect:/planCertDetailList");
		
		System.out.println("======planCertDetailController /planCertDetailComplete END=====");
		return mav;
	}
	
	// planCertDetailList(ajax)
	@RequestMapping(value="/planCertDetailList")
	@ResponseBody
	public List<PlanCertDetail> planCertDetailList(
			PlanCertDetail planCertDetail,
			HttpSession session,
			Map<String,Object> map,
			ModelAndView mav){
		
		System.out.println("planCertDetail /planCertDetailList : " + planCertDetail);	//planCertCode받음
		
		// planCertCode에 해당하는 planCertDetail 리스트 가져오기
		List<PlanCertDetail> planCertDetailList = new ArrayList<PlanCertDetail>();
		planCertDetail.setInfoMemberId((String) session.getAttribute("memberLoginId"));
		planCertDetailList = planCertDetailService.planCertDetailList(planCertDetail);	//planCertCode에 해당하는 거 리스트 뽑기
		System.out.println("planCertDetail /planCertDetailList : " + planCertDetailList);
		return planCertDetailList;
	}
	
	// planCertDetailInsert(ajax)
	@RequestMapping(value="/planCertDetailInsert")
	@ResponseBody
	public void planCertDetailInsert(
			PlanCertDetail planCertDetail,
			HttpSession session){
		
		//planCertCode받아서 planCertDetail에 insert(+planCertDetailCode,시작일,종료일,자세한 디테일들)
		System.out.println("planCertDetail /planCertDetailInsert : " + planCertDetail);
		planCertDetail.setInfoMemberId((String) session.getAttribute("memberLoginId"));
		planCertDetailService.planCertDetailInsert(planCertDetail);
	}
}

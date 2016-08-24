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

import com.to.cdp.plan.model.PlanSchoolDetail;
import com.to.cdp.plan.service.PlanSchoolDetailService;

@Controller
public class PlanSchoolDetailController {
	@Autowired
	private PlanSchoolDetailService planSchoolDetailService;
	
	// planSchoolDetailList(ajax)
	@RequestMapping(value="/planSchoolDetailList")
	@ResponseBody
	public List<PlanSchoolDetail> planSchoolDetailList(
			PlanSchoolDetail planSchoolDetail,
			HttpSession session,
			Map<String,Object> map,
			ModelAndView mav){
		
		System.out.println("planSchoolDetail /planSchoolDetailList : " + planSchoolDetail);	//planSchoolCode받음
		
		// planSchoolCode에 해당하는 planSchoolDetail 리스트 가져오기
		List<PlanSchoolDetail> planSchoolDetailList = new ArrayList<PlanSchoolDetail>();
		planSchoolDetail.setInfoMemberId((String) session.getAttribute("memberLoginId"));
		planSchoolDetailList = planSchoolDetailService.planSchoolDetailList(planSchoolDetail);	//planSchoolCode에 해당하는 거 리스트 뽑기
		System.out.println("planSchoolDetail /planSchoolDetailList : " + planSchoolDetailList);
		return planSchoolDetailList;
	}
	
	// planSchoolDetailInsert(ajax)
	@RequestMapping(value="/planSchoolDetailInsert")
	@ResponseBody
	public void planSchoolDetailInsert(
			PlanSchoolDetail planSchoolDetail,
			HttpSession session){
		
		//planSchoolCode받아서 planSchoolDetail에 insert(+planSchoolDetailCode,시작일,종료일,자세한 디테일들)
		System.out.println("planSchoolDetail /planSchoolDetailInsert : " + planSchoolDetail);
		planSchoolDetail.setInfoMemberId((String) session.getAttribute("memberLoginId"));
		planSchoolDetailService.planSchoolDetailInsert(planSchoolDetail);
	}
}

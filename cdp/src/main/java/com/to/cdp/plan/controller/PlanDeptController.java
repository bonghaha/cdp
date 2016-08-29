package com.to.cdp.plan.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.to.cdp.plan.model.PlanDept;
import com.to.cdp.plan.model.PlanSchool;
import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.plan.service.PlanDeptService;
import com.to.cdp.plan.service.PlanUniteService;
import com.to.cdp.rec.model.RecDept;

@Controller
public class PlanDeptController {
	@Autowired
	private PlanDeptService planDeptService;
	@Autowired
	private PlanUniteService planUniteService;
	
	// planUniteAll화면에서 삭제버튼 누르면 planDeptCode로 delete시키기
	// 비밀번호 확인 후 삭제 해야하는데 일단 그냥 하자
	@RequestMapping(value="/planDeptDelete")
	@ResponseBody
	public void planDeptDelete(PlanDept planDept){
		planDeptService.planDeptDelete(planDept);
	}
	
	//planUniteAll화면에서 등록버튼 누르면 planDept update시키기
	@RequestMapping(value="/planDeptUpdate")
	@ResponseBody
	public PlanDept planDeptUpdate(
			PlanDept planDept,
			HttpSession session){
		
		System.out.println("planDept /planDeptUpdate : " + planDept);
		planDeptService.planDeptUpdate(planDept);
		planDept.setInfoMemberId((String) session.getAttribute("memberLoginId"));
		planDept = planDeptService.planDeptDetail(planDept);
		System.out.println("planDeptAfterDetail /planDeptUpdate : " + planDept);
		return planDept;
	}
	
	// 1. planDeptInsert(planUnite 만들기)
	@RequestMapping(value="/planDeptInsertAndList")
	public String planDeptList(
			PlanUnite planUnite,
			RecDept recDept,
			@RequestParam(value="recDeptCodes", required=false) List<String> recDeptCodeList,
			HttpSession session,
			Model model){
		
		// 추천학과코드들 받아서 계획학과Insert 후 계획리스트로 이동
		List<PlanDept> planDeptList = new ArrayList<PlanDept>();
		String memberLoginId = (String) session.getAttribute("memberLoginId");
		// PlanUniteDetail에서 ajax 통해 만들어진 체크박스가 있으면 if문 실행
		if(recDeptCodeList != null){
//			System.out.println("recDeptCodeList /planSchooInsertAndlList : " + recDeptCodeList);
//			System.out.println("recDeptCodeList.size()  /planSchooInsertAndlList : " + recDeptCodeList.size());
			PlanDept planDept = null;
			
			for(String recDeptCode : recDeptCodeList){
				//recDeptCode로 mClass따와서 planDept에 셋팅
				recDept.setRecDeptCode(recDeptCode);
				recDept = planDeptService.selectDeptMClass(recDept);
				
				planDept = new PlanDept();
				planDept.setInfoMemberId(memberLoginId);
				planDept.setRecDeptCode(recDeptCode);
				planDept.setmClass(recDept.getmClass());
				planDept.setPlanUniteCode(planUnite.getPlanUniteCode());
				planDeptService.planDeptInsert(planDept);
			}
			planDeptList = planDeptService.planDeptList(planDept);
		}else{
			planUnite.setInfoMemberId(memberLoginId);
			planDeptList = planDeptService.planDeptListByBtn(planUnite);
		}
//		System.out.println("planDeptList /planDeptInsertAndlList : " + planDeptList);
//		System.out.println("planUnite /planSchooInsertAndlList : " + planUnite);
		planUnite = planUniteService.planUniteDetail(planUnite);
		
		model.addAttribute("planDeptList", planDeptList);
		model.addAttribute("planUnite", planUnite);
		return "plan/unite/uniteDetail";
	}
	
	@RequestMapping(value="/planDeptList", method=RequestMethod.POST)
	public String planDeptList(
			PlanDept planDept,
			List<PlanDept> planDeptList){
		System.out.println("planDept /planDeptList : " + planDept);
		System.out.println("planDeptList /planDeptList : " + planDeptList);
		// 2. session에서 Id받아서 planDept에 셋팅
		// 3. planUniteCode받아서 planDept에 셋팅
		// 4. DeptInsert.jsp 에서 입력한 
		// planDeptCondition, planDeptContent, planDeptCount, 시작일,종료일 포함
		// 5. (service에서) planDeptCode 셋팅 후 planDept을 planDeptList에 셋팅
		// 6. planDeptInsert 후 return : planDeptList
		return "plan/dept/deptList";
	}
	
}
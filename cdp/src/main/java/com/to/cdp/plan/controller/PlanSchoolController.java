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

import com.to.cdp.plan.model.PlanSchool;
import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.plan.service.PlanSchoolService;
import com.to.cdp.plan.service.PlanUniteService;
import com.to.cdp.rec.model.RecSchool;

@Controller
public class PlanSchoolController {
	@Autowired
	private PlanSchoolService planSchoolService;
	@Autowired
	private PlanUniteService planUniteService;
	
	// planUniteAll화면에서 삭제버튼 누르면 planSchoolCode로 delete시키기
	// 비밀번호 확인 후 삭제 해야하는데 일단 그냥 하자
	@RequestMapping(value="/planSchoolDelete")
	@ResponseBody
	public void planSchoolDelete(PlanSchool planSchool){
		planSchoolService.planSchoolDelete(planSchool);
	}
	
	//planUniteAll화면에서 등록버튼 누르면 planSchool update시키기
	@RequestMapping(value="/planSchoolUpdate")
	@ResponseBody
	public PlanSchool planSchoolUpdate(
			PlanSchool planSchool,
			HttpSession session){
		
		System.out.println("planSchool /planSchoolUpdate : " + planSchool);
		planSchoolService.planSchoolUpdate(planSchool);
		planSchool.setInfoMemberId((String) session.getAttribute("memberLoginId"));
		planSchool = planSchoolService.planSchoolDetail(planSchool);
		System.out.println("planSchoolAfterDetail /planSchoolUpdate : " + planSchool);
		return planSchool;
	}
	
	// 1. planSchoolInsert(planUnite 만들기)
	@RequestMapping(value="/planSchoolInsertAndList")
	public String planSchoolList(
			PlanUnite planUnite,
			RecSchool recSchool,
			@RequestParam(value="recSchoolCodes", required=false) List<String> recSchoolCodeList,
			HttpSession session,
			Model model){
		
		// 추천학교코드들 받아서 계획학교Insert 후 계획리스트로 이동
		List<PlanSchool> planSchoolList = new ArrayList<PlanSchool>();
//		System.out.println("planSchoolList /planSchoolInsertAndList!!!!!! : " + planSchoolList);
		String memberLoginId = (String) session.getAttribute("memberLoginId");
		// PlanUniteDetail에서 ajax 통해 만들어진 체크박스가 있으면 if문 실행
		if(recSchoolCodeList != null){
//			System.out.println("recSchoolCodeList /planSchooInsertAndlList : " + recSchoolCodeList);
//			System.out.println("recSchoolCodeList.size()  /planSchooInsertAndlList : " + recSchoolCodeList.size());
			PlanSchool planSchool = null;
			
			for(String recSchoolCode : recSchoolCodeList){
				//recSchoolCode로 schoolName따와서 planSchool에 셋팅
				recSchool.setRecSchoolCode(recSchoolCode);
				recSchool = planSchoolService.selectSchoolName(recSchool);
				
				planSchool = new PlanSchool();
				planSchool.setInfoMemberId(memberLoginId);
				planSchool.setRecSchoolCode(recSchoolCode);
				planSchool.setSchoolName(recSchool.getSchoolName());
				planSchool.setPlanUniteCode(planUnite.getPlanUniteCode());
				planSchoolService.planSchoolInsert(planSchool);
			}
			planSchoolList = planSchoolService.planSchoolList(planSchool);
		}else{
			planUnite.setInfoMemberId(memberLoginId);
			planSchoolList = planSchoolService.planSchoolListByBtn(planUnite);
		}
//		System.out.println("planSchoolList /planSchoolInsertAndlList : " + planSchoolList);
//		System.out.println("planUnite /planSchoolInsertAndlList : " + planUnite);
		planUnite = planUniteService.planUniteDetail(planUnite);
		
		model.addAttribute("planSchoolList", planSchoolList);
		model.addAttribute("planUnite", planUnite);
		return "plan/unite/uniteDetail";
	}
	
	@RequestMapping(value="/planSchoolList", method=RequestMethod.POST)
	public String planSchoolList(
			PlanSchool planSchool,
			List<PlanSchool> planSchoolList){
		System.out.println("planSchool /planSchoolList : " + planSchool);
		System.out.println("planSchoolList /planSchoolList : " + planSchoolList);
		// 2. session에서 Id받아서 planSchool에 셋팅
		// 3. planUniteCode받아서 planSchool에 셋팅
		// 4. schoolInsert.jsp 에서 입력한 
		// planSchoolCondition, planSchoolContent, planSchoolCount, 시작일,종료일 포함
		// 5. (service에서) planSchoolCode 셋팅 후 planSchool을 planSchoolList에 셋팅
		// 6. planSchoolInsert 후 return : planSchoolList
		return "plan/school/schoolList";
	}
	
}
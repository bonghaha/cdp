package com.to.cdp.plan.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.to.cdp.info.model.InfoJob;
import com.to.cdp.plan.model.PlanCert;
import com.to.cdp.plan.model.PlanDept;
import com.to.cdp.plan.model.PlanSchool;
import com.to.cdp.plan.model.PlanSchoolDetail;
import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.plan.service.PlanCertService;
import com.to.cdp.plan.service.PlanDeptService;
import com.to.cdp.plan.service.PlanSchoolService;
import com.to.cdp.plan.service.PlanUniteService;

@Controller
public class PlanUniteController {
	@Autowired
	private PlanUniteService planUniteService;
	@Autowired
	private PlanSchoolService planSchoolService;
	@Autowired
	private PlanDeptService planDeptService;
	@Autowired
	private PlanCertService planCertService;
	
	// 1. planUniteInsertForm
	@RequestMapping(value="/planUniteInsert", method=RequestMethod.GET)
	public String planUniteInsert(
			HttpSession session,
			InfoJob infoJob,
			Model model,
			PlanUnite planUnite){
		
		// jobdicSeq,infoMemberId 셋팅 후 폼에 넘기기
		planUnite.setJobdicSeq(infoJob.getJobdicSeq());
		planUnite.setJob(infoJob.getJob());
		planUnite.setInfoMemberId((String) session.getAttribute("memberLoginId"));
		
		model.addAttribute("planUnite", planUnite);
		return "plan/unite/uniteInsert";
	}
	
	// planUniteInsertAccess
	@RequestMapping(value="/planUniteInsert", method=RequestMethod.POST)
	public String planUniteInsert(
			PlanUnite planUnite,
			Model model){
		
		System.out.println("planUnite PlanUniteController : " + planUnite);

		// 1. planUniteCode 생성(service) 후 Insert
		planUniteService.planUniteInsert(planUnite);
		
		return "redirect:/planUniteList";
	}
	
	// 4. planUniteList
	@RequestMapping(value="/planUniteList", method=RequestMethod.GET)
	public String planUniteList(
			Model model,
			PlanUnite planUnite,
			HttpSession session){
		
		planUnite.setInfoMemberId((String) session.getAttribute("memberLoginId"));
		List<PlanUnite> planUniteList = planUniteService.planUniteList(planUnite);
		System.out.println("planUniteList PlanUniteController : " + planUniteList);
		model.addAttribute("planUniteList", planUniteList);
		return "plan/unite/uniteList";
	}
	
	// 5. planUniteDetail
	@RequestMapping(value="/planUniteDetail", method=RequestMethod.GET)
	public String planUniteDetail(
			PlanUnite planUnite,
			InfoJob infoJob,
			Model model,
			HttpSession session){
		
		planUnite.setInfoMemberId((String) session.getAttribute("memberLoginId"));
		planUnite = planUniteService.planUniteDetail(planUnite);
		if(infoJob.getJobdicSeq() != null){
			planUnite.setJobdicSeq(infoJob.getJobdicSeq());
		}
		System.out.println("planUnite PlanUniteController : " + planUnite);
		model.addAttribute("planUnite", planUnite);
		return "plan/unite/uniteDetail";
	}
	
	//planUniteAllList화면에서 ajax로 planSchool리스트 보여주기
	@RequestMapping(value="/showPlanSchoolList")
	@ResponseBody
	public List<PlanSchool> showPlanSchoolList(
			HttpSession session,
			PlanSchool planSchool){
		
		System.out.println("===============PlanUniteController===============");
		System.out.println("planSchool /showPlanSchoolList : " + planSchool);
		
		//VO(PlanSchool)에서 아이디와 planUniteCode가 조건에 해당하는 것 리스트에 넣기
		List<PlanSchool> planSchoolList = new ArrayList<PlanSchool>();
		String memberLoginId = (String) session.getAttribute("memberLoginId");
		planSchool.setInfoMemberId(memberLoginId);
		System.out.println("planSchool /showPlanSchoolList : " + planSchool);
		// planSchoolPercent insert 후 전체list 출력
		planSchoolList = planSchoolService.planSchoolList(planSchool);
		System.out.println("planSchoolList : " + planSchoolList);
		
		System.out.println("============PlanUniteController End==============");
		return planSchoolList;
	}
	
	//planUniteAllList화면에서 ajax로 planDept리스트 보여주기
	@RequestMapping(value="/showPlanDeptList")
	@ResponseBody
	public List<PlanDept> showPlanDeptList(
			HttpSession session,
			PlanDept planDept){

		System.out.println("===============PlanUniteController===============");
		System.out.println("planDept /showPlanDeptList : " + planDept);
		
		//VO(PlanDept)에서 아이디와 planUniteCode가 조건에 해당하는 것 리스트에 넣기
		List<PlanDept> planDeptList = new ArrayList<PlanDept>();
		String memberLoginId = (String) session.getAttribute("memberLoginId");
		planDept.setInfoMemberId(memberLoginId);
		System.out.println("planDept /showPlanDeptList : " + planDept);
		// planDeptPercent insert 후 전체list 출력
		planDeptList = planDeptService.planDeptList(planDept);
		System.out.println("planDeptList : " + planDeptList);
		
		System.out.println("============PlanUniteController End==============");
		return planDeptList;
	}
		
	//planUniteAllList화면에서 ajax로 planCert리스트 보여주기
	@RequestMapping(value="/showPlanCertList")
	@ResponseBody
	public List<PlanCert> showPlanCertList(
			HttpSession session,
			PlanCert planCert){

		System.out.println("===============PlanUniteController===============");
		System.out.println("planCert /showPlanCertList : " + planCert);
		
		//VO(PlanCert)에서 아이디와 planUniteCode가 조건에 해당하는 것 리스트에 넣기
		List<PlanCert> planCertList = new ArrayList<PlanCert>();
		String memberLoginId = (String) session.getAttribute("memberLoginId");
		planCert.setInfoMemberId(memberLoginId);
		System.out.println("planCert /showPlanCertList : " + planCert);
		// planCertPercent insert 후 전체list 출력
		planCertList = planCertService.planCertList(planCert);
		System.out.println("planCertList : " + planCertList);
		
		System.out.println("============PlanUniteController End==============");
		return planCertList;
	}
}
package com.to.cdp.plan.controller;

import java.util.ArrayList;
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

import com.to.cdp.plan.model.PlanCert;
import com.to.cdp.plan.model.PlanDept;
import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.plan.service.PlanCertService;
import com.to.cdp.plan.service.PlanUniteService;
import com.to.cdp.rec.model.RecCert;

@Controller
public class PlanCertController {
	@Autowired
	private PlanCertService planCertService;
	@Autowired
	private PlanUniteService planUniteService;
	
	// 2. planCertUpdate
	@RequestMapping(value="/planCertUpdate")
	@ResponseBody
	public PlanCert planCertUpdate(
			PlanCert planCert,
			HttpSession session){
		
		System.out.println("planCert planCertUpdate : " + planCert);
		planCertService.planCertUpdate(planCert);
		planCert.setInfoMemberId((String)session.getAttribute("memberLoginId"));
		planCert = planCertService.planCertDetail(planCert);
		System.out.println("planCertAfterDetail planCertUpdate : " + planCert);
		return planCert;
	}
	
	// 3. planCertDelete
	@RequestMapping(value="/planCertDelete")
	@ResponseBody
	public void planCertDelete(PlanCert planCert){
		planCertService.planCertDelete(planCert);
	}
	
	// 4. planCertList
	@RequestMapping(value="/planCertList", method=RequestMethod.POST)
	public String planCertList(){
		return "planCertList";
	}
	
	@RequestMapping(value="/planCertInsertAndList")
	public String planCertList(
			PlanUnite planUnite,
			RecCert recCert,
			@RequestParam(value="recCertCodes", required=false) List<String> recCertCodeList,
			HttpSession session,
			Model model){
		
		List<PlanCert> planCertList = new ArrayList<PlanCert>();
		String memberLoginId = (String) session.getAttribute("memberLoginId");
		
		if(recCertCodeList != null){
//			System.out.println("recCertCodeList planCertInsertAndList : " + recCertCodeList);
//			System.out.println("recCertCodeList.size() planCertInsertAndList : " + recCertCodeList.size());
			PlanCert planCert = null;
			
			for(String recCertCode : recCertCodeList){
				recCert.setRecCertCode(recCertCode);
				recCert = planCertService.selectCertjmFldNm(recCert);
				
				planCert = new PlanCert();
				planCert.setJmFldNm(recCert.getJmFldNm());
				planCert.setInfoMemberId(memberLoginId);
				planCert.setRecCertCode(recCertCode);
				planCert.setPlanUniteCode(planUnite.getPlanUniteCode());
				planCertService.planCertInsert(planCert);
			}
			planCertList = planCertService.planCertList(planCert);
		} else{
			planUnite.setInfoMemberId(memberLoginId);
			planCertList = planCertService.planCertListByBtn(planUnite);
		}
//		System.out.println("planCertList planCertInsertAndList : " + planCertList);
		planUnite = planUniteService.planUniteDetail(planUnite);
		
		model.addAttribute("planCertList", planCertList);
		model.addAttribute("planUnite", planUnite);
		return "plan/unite/uniteAllList";
	}
	
	// 5. planCertDetail
	@RequestMapping(value="/planCertDetail", method=RequestMethod.GET)
	public String planCertDetail(){
		return "planCertDetail";
	}
	
	@RequestMapping(value="/planCertDetail", method=RequestMethod.POST)
	public String planCertDetail(PlanCert planCert){
		return "planCertDetail";
	}
}
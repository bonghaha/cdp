package com.to.cdp.info.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.to.cdp.PageHelper;
import com.to.cdp.info.model.InfoJob;
import com.to.cdp.info.model.InfoMember;
import com.to.cdp.info.service.InfoJobService;
import com.to.cdp.info.service.InfoMemberService;

@Controller
public class InfoJobController {
	@Autowired
	private InfoJobService infoJobService;
	@Autowired
	private InfoMemberService infoMemberService;
	
	// 1. API(infoJob) 받은 거 리스트로 뿌리기
	@RequestMapping(value="/infoJobListSub", method=RequestMethod.GET)
	public String infoJobListSub(
			Model model, 
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "10") int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord) throws Exception{
		
		List<InfoJob> infoJobList = infoJobService.infoJobList(searchType, searchWord);	// 파싱한 값들(list) List에 넣기
		System.out.println("infoJobList.size() InfoJobController : " + infoJobList.size());
		pageHelper.pageSet(infoJobList.size(), linePerPage, clickPage, blockSize);	// 페이지 셋팅
		System.out.println("pageHelper InfoJobController :" + pageHelper);
		
		model.addAttribute("infoJobList", infoJobList);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/job/jobListSub";
	}
	
	// 1. API(infoJob) 받은 거 리스트로 뿌리기
	@RequestMapping(value="/infoJobList", method=RequestMethod.GET)
	public String infoJobList(
			Model model, 
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "10") int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord) throws Exception{
		
		List<InfoJob> infoJobList = infoJobService.infoJobList(searchType, searchWord);	// 파싱한 값들(list) List에 넣기
		System.out.println("infoJobList.size() InfoJobController : " + infoJobList.size());
		pageHelper.pageSet(infoJobList.size(), linePerPage, clickPage, blockSize);	// 페이지 셋팅
		System.out.println("pageHelper InfoJobController :" + pageHelper);
		
		model.addAttribute("infoJobList", infoJobList);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/job/jobList";
		
	}
	
	// 2. infoJobDetail
	@RequestMapping(value="/infoJobDetail", method=RequestMethod.GET)
	public String infoJobDetail(
			InfoJob infoJob,
			HttpSession session,
			InfoMember infoMember,
			Model model,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord) throws Exception{
		
//		System.out.println("infoJob /infoJobDetail : " + infoJob);
		// jobdicSeq로 직업 기본정보상세 불러오기
		infoJob = infoJobService.infoJobDetail(infoJob);
//		System.out.println("infoJob /infoJobDetail : " + infoJob);
		
		// 권한에 의한 버튼 출력
		String infoMemberId = (String) session.getAttribute("memberLoginId");
		infoMember.setInfoMemberId(infoMemberId);
		infoMember = infoMemberService.selectInfoMemberLevel(infoMember);
		
		System.out.println("infoJob /infoJobDetail : " + infoJob);
		model.addAttribute("infoJob", infoJob);
		model.addAttribute("infoMember", infoMember);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "info/job/jobDetail";
	}
	
	@RequestMapping(value="/infoJobDetail", method=RequestMethod.POST)
	public String infoJobDetail(InfoJob infoJob){
		return "info/job/jobDetail";
	}
}
package com.to.cdp.info.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.dao.InfoMemberDao;
import com.to.cdp.info.model.InfoMember;
import com.to.cdp.resume.model.ResumeSchool;

@Service
@Transactional
public class InfoMemberService {
	
	@Autowired
	private InfoMemberDao infoMemberDao;
	
	// infoMemberInsert
	public int infoMemberInsert(InfoMember infoMember) {
		String infoMemberLastKey = "";
		String infoMemberCode = "";
		String infoMemberPre = "info_member_";
		// 마지막으로 생성된 resume_school_code 번호 select
		infoMemberLastKey = infoMemberDao.infoMemberLastKey();
		
		int lastKeyNum = 0;
		if(infoMemberLastKey == null){
			lastKeyNum = lastKeyNum+1;
		}else{
			// resume_school_을 제외한 번호만 뽑아내서 +1 시킴
			lastKeyNum = Integer.parseInt(infoMemberLastKey.substring(infoMemberPre.length()))+1;
		}
		
		// resume_school_번호 셋팅
		infoMemberCode = infoMemberPre + lastKeyNum;
		infoMember.setInfoMemberCode(infoMemberCode);
		return infoMemberDao.infoMemberInsert(infoMember);
	}
	
	// infoMemberUpdate
	public int infoMemberUpdate(InfoMember infoMember){
		return infoMemberDao.infoMemberUpdate(infoMember);
	}
	
	// infoMemberDelete
	public int infoMemberDelete(InfoMember infoMember){
		return infoMemberDao.infoMemberDelete(infoMember);
	}
	
	// infoMemberList
	public List<InfoMember> infoMemberList(Map<String, Object> map){
		return infoMemberDao.infoMemberList(map);
	}
	
	// infoMemberDetail
	public InfoMember infoMemberDetail(InfoMember infoMember){
		return infoMemberDao.infoMemberDetail(infoMember);
	}

	public int infoMemberCountBySearch(Map<String, Object> map) {
		return infoMemberDao.infoMemberCountBySearch(map);
	}

	public InfoMember findByUserIdAndPassword(InfoMember infoMember) {
		return infoMemberDao.findByUserIdAndPassword(infoMember);
	}

	// 회원가입시 아이디 중복 확인
	public int infoMemberIdCheck(String infoMemberId) {
		return infoMemberDao.infoMemberIdCheck(infoMemberId);
	}

	public InfoMember loginMemberDetail(InfoMember infoMember) {
		return infoMemberDao.loginMemberDetail(infoMember);
	}

	public InfoMember selectInfoMemberLevel(InfoMember infoMember) {
		return infoMemberDao.selectInfoMemberLevel(infoMember);
	}

}
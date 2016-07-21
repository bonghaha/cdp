package com.to.cdp.info.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.dao.InfoMemberDao;
import com.to.cdp.info.model.InfoMember;

@Service
@Transactional
public class InfoMemberService {
	
	@Autowired
	private InfoMemberDao infoMemberDao;
	
	// infoMemberInsert
	public int infoMemberInsert(InfoMember infoMember){
		int infoMemberCount = 0;
		String infoMemberCode = null;
		infoMemberCount = infoMemberDao.infoMemberCount()+1;
		infoMemberCode = "info_member_" + infoMemberCount;
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

}
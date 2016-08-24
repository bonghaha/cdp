package com.to.cdp.resume.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.model.InfoMember;
import com.to.cdp.resume.dao.ResumeUniteDao;
import com.to.cdp.resume.model.ResumeCert;
import com.to.cdp.resume.model.ResumeDept;
import com.to.cdp.resume.model.ResumeSchool;

@Service
@Transactional
public class ResumeUniteService {

	@Autowired
	private ResumeUniteDao resumeUniteDao;
	
	// 회원정보디테일 셀렉트 후 resume에 뿌리기
	public InfoMember resumeMemberDetail(InfoMember infoMember) {
		return resumeUniteDao.resumeMemberDetail(infoMember);
	}

	public ResumeSchool resumeSchoolDetail(ResumeSchool resumeSchool) {
		return resumeUniteDao.resumeSchoolDetail(resumeSchool);
	}

	public ResumeDept resumeDeptDetail(ResumeDept resumeDept) {
		return resumeUniteDao.resumeDeptDetail(resumeDept);
	}

	public ResumeCert resumeCertDetail(ResumeCert resumeCert) {
		return resumeUniteDao.resumeCertDetail(resumeCert);
	}

}

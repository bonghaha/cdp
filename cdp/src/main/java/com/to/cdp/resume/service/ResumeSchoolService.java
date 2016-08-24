package com.to.cdp.resume.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.resume.dao.ResumeSchoolDao;
import com.to.cdp.resume.model.ResumeSchool;

@Service
@Transactional
public class ResumeSchoolService {

	@Autowired
	private ResumeSchoolDao resumeSchoolDao;
	
	// 이력서 학교정보 등록
	public int resumeSchoolInsert(ResumeSchool resumeSchool) {
		String resumeSchoolLastKey = "";
		String resumeSchoolCode = "";
		String resumeSchoolPre = "resume_school_";
		// 마지막으로 생성된 resume_school_code 번호 select
		resumeSchoolLastKey = resumeSchoolDao.resumeSchoolLastKey();
		
		int lastKeyNum = 0;
		if(resumeSchoolLastKey == null){
			lastKeyNum = lastKeyNum+1;
		}else{
			// resume_school_을 제외한 번호만 뽑아내서 +1 시킴
			lastKeyNum = Integer.parseInt(resumeSchoolLastKey.substring(resumeSchoolPre.length()))+1;
		}
		
		// resume_school_번호 셋팅
		resumeSchoolCode = resumeSchoolPre + lastKeyNum;
		resumeSchool.setResumeSchoolCode(resumeSchoolCode);
		return resumeSchoolDao.resumeSchoolInsert(resumeSchool);
	}

	// 이력서 학교정보 수정
	public int resumeSchoolUpdate(ResumeSchool resumeSchool) {
		return resumeSchoolDao.resumeSchoolUpdate(resumeSchool);
		
	}

}

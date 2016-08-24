package com.to.cdp.resume.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.resume.dao.ResumeDeptDao;
import com.to.cdp.resume.model.ResumeDept;

@Service
@Transactional
public class ResumeDeptService {

	@Autowired
	private ResumeDeptDao resumeDeptDao;
	
	// 이력서 학과정보 등록
	public int resumeDeptInsert(ResumeDept resumeDept) {
		String resumeDeptLastKey = "";
		String resumeDeptCode = "";
		String resumeDeptPre = "resume_dept_";
		// 마지막으로 생성된 resume_dept_code 번호 select
		resumeDeptLastKey = resumeDeptDao.selectDeptLastKey();
		
		int lastKeyNum = 0;
		if(resumeDeptLastKey == null){
			lastKeyNum = lastKeyNum+1;
		}else{
			// resume_dept_을 제외한 번호만 뽑아내서 +1 시킴
			lastKeyNum = Integer.parseInt(resumeDeptLastKey.substring(resumeDeptPre.length()))+1;
		}
		
		// resume_dept_번호 셋팅
		resumeDeptCode = resumeDeptPre + lastKeyNum;
		resumeDept.setResumeDeptCode(resumeDeptCode);
		return resumeDeptDao.resumeDeptInsert(resumeDept);
	}

	// 이력서 학과정보 수정
	public int resumeDeptUpdate(ResumeDept resumeDept) {
		return resumeDeptDao.resumeDeptUpdate(resumeDept);
		
	}

}

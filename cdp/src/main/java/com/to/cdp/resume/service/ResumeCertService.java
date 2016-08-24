package com.to.cdp.resume.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.resume.dao.ResumeCertDao;
import com.to.cdp.resume.model.ResumeCert;

@Service
@Transactional
public class ResumeCertService {

	@Autowired
	private ResumeCertDao resumeCertDao;
	
	// 이력서 자격증정보 등록
	public int resumeCertInsert(ResumeCert resumeCert) {
		String resumeCertLastKey = "";
		String resumeCertCode = "";
		String resumeCertPre = "resume_cert_";
		// 마지막으로 생성된 resume_cert_code 번호 select
		resumeCertLastKey = resumeCertDao.selectCertLastKey();
		
		int lastKeyNum = 0;
		if(resumeCertLastKey == null){
			lastKeyNum = lastKeyNum+1;
		}else{
			// resume_cert_를 제외한 번호만 뽑아내서 +1 시킴
			lastKeyNum = Integer.parseInt(resumeCertLastKey.substring(resumeCertPre.length()))+1;
		}
		
		// resume_cert_번호 셋팅
		resumeCertCode = resumeCertPre + lastKeyNum;
		resumeCert.setResumeCertCode(resumeCertCode);
		return resumeCertDao.resumeCertInsert(resumeCert);
	}

	// 이력서 자격증정보 수정
	public int resumeCertUpdate(ResumeCert resumeCert) {
		return resumeCertDao.resumeCertUpdate(resumeCert);
		
	}

}

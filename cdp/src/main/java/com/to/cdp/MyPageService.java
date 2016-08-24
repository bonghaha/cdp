package com.to.cdp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.to.cdp.info.model.InfoMember;
@Service
@Transactional
public class MyPageService {
	
	@Autowired
	private MyPageDao myPageDao;

	public InfoMember infoMemberDetail(InfoMember infoMember) {
		return myPageDao.infoMemberDetail(infoMember);
	}

	public int myInfoMemberUpdate(InfoMember infoMember) {
		return myPageDao.myInfoMemberUpdate(infoMember);
	}
}

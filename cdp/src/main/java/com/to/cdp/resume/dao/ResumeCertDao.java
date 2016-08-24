package com.to.cdp.resume.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.resume.model.ResumeCert;

@Repository
public class ResumeCertDao {
	
	private final String NS="com.to.cdp.repository.ResumeMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 이력서 자격증정보 입력
	public int resumeCertInsert(ResumeCert resumeCert) {
		return sqlSession.insert(NS + ".resumeCertInsert", resumeCert);
	}

	// 이력서 자격증코드위한 마지막primaryKey 불러오기
	public String selectCertLastKey() {
		return sqlSession.selectOne(NS + ".selectCertLastKey");
	}

	// 이력서 자격증정보 수정
	public int resumeCertUpdate(ResumeCert resumeCert) {
		return sqlSession.update(NS + ".resumeCertUpdate", resumeCert);
	}

}

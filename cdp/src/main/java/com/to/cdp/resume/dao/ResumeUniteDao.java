package com.to.cdp.resume.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoMember;
import com.to.cdp.resume.model.ResumeCert;
import com.to.cdp.resume.model.ResumeDept;
import com.to.cdp.resume.model.ResumeSchool;

@Repository
public class ResumeUniteDao {
	private final String NS="com.to.cdp.repository.ResumeMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 회원정보디테일 셀렉트 후 resume에 뿌리기
	public InfoMember resumeMemberDetail(InfoMember infoMember) {
		return sqlSession.selectOne(NS + ".resumeMemberDetail", infoMember);
	}

	public ResumeSchool resumeSchoolDetail(ResumeSchool resumeSchool) {
		return sqlSession.selectOne(NS + ".resumeSchoolDetail", resumeSchool);
	}

	public ResumeDept resumeDeptDetail(ResumeDept resumeDept) {
		return sqlSession.selectOne(NS + ".resumeDeptDetail", resumeDept);
	}

	public ResumeCert resumeCertDetail(ResumeCert resumeCert) {
		return sqlSession.selectOne(NS + ".resumeCertDetail", resumeCert);
	}

}

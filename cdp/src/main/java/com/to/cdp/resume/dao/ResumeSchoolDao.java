package com.to.cdp.resume.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.resume.model.ResumeSchool;

@Repository
public class ResumeSchoolDao {
	
	private final String NS="com.to.cdp.repository.ResumeMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 이력서 학교정보 입력
	public int resumeSchoolInsert(ResumeSchool resumeSchool) {
		return sqlSession.insert(NS + ".resumeSchoolInsert", resumeSchool);
	}

	// 이력서 학교코드위한 마지막primaryKey 불러오기
	public String resumeSchoolLastKey() {
		return sqlSession.selectOne(NS + ".resumeSchoolLastKey");
	}

	// 이력서 학교정보 수정
	public int resumeSchoolUpdate(ResumeSchool resumeSchool) {
		return sqlSession.update(NS + ".resumeSchoolUpdate", resumeSchool);
	}

}

package com.to.cdp.resume.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.resume.model.ResumeDept;

@Repository
public class ResumeDeptDao {
	
	private final String NS="com.to.cdp.repository.ResumeMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 이력서 학과정보 입력
	public int resumeDeptInsert(ResumeDept resumeDept) {
		return sqlSession.insert(NS + ".resumeDeptInsert", resumeDept);
	}

	// 이력서 학과코드위한 마지막primaryKey 불러오기
	public String selectDeptLastKey() {
		return sqlSession.selectOne(NS + ".selectDeptLastKey");
	}

	// 이력서 학과정보 수정
	public int resumeDeptUpdate(ResumeDept resumeDept) {
		return sqlSession.update(NS + ".resumeDeptUpdate", resumeDept);
	}

}

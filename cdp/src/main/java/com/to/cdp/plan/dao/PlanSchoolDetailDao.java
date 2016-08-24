package com.to.cdp.plan.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.plan.model.PlanSchoolDetail;

@Repository
public class PlanSchoolDetailDao {
	private final String NS="com.to.cdp.repository.PlanDetailMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int planSchoolDetailInsert(PlanSchoolDetail planSchoolDetail) {
		return sqlSession.insert(NS + ".planSchoolDetailInsert", planSchoolDetail);
	}

	public String planSchoolDetailLastKey() {
		return sqlSession.selectOne(NS + ".planSchoolDetailLastKey");
	}

	public List<PlanSchoolDetail> planSchoolDetailList(PlanSchoolDetail planSchoolDetail) {
		return sqlSession.selectList(NS + ".planSchoolDetailList", planSchoolDetail);
	}
}

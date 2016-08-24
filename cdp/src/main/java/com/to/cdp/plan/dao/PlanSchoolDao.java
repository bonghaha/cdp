package com.to.cdp.plan.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.plan.model.PlanSchool;
import com.to.cdp.plan.model.PlanSchoolDetail;
import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.rec.model.RecSchool;

@Repository
public class PlanSchoolDao {
	private final String NS="com.to.cdp.repository.PlanMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// planSchoolInsert
	public int planSchoolInsert(PlanSchool planSchool){
		return sqlSession.insert(NS + ".planSchoolInsert", planSchool);
	}
	
	// planSchoolUpdate
	public int planSchoolUpdate(PlanSchool planSchool){
		return sqlSession.update(NS + ".planSchoolUpdate", planSchool);
	}
	
	// planSchoolDelete
	public int planSchoolDelete(PlanSchool planSchool){
		return sqlSession.delete(NS + ".planSchoolDelete", planSchool);
	}
	
	// planSchoolList
	public List<PlanSchool> planSchoolList(PlanSchool planSchool){
		return sqlSession.selectList(NS + ".planSchoolList", planSchool);
	}
	
	// planSchoolDetail
	public PlanSchool planSchoolDetail(PlanSchool planSchool){
		return sqlSession.selectOne(NS + ".planSchoolDetail", planSchool);
	}

	public List<PlanSchool> planSchoolList(PlanUnite planUnite) {
		return sqlSession.selectList(NS + ".planSchoolList", planUnite);
	}

	// 마지막 코드번호 구하기
	public String planSchoolLastKey() {
		return sqlSession.selectOne(NS + ".planSchoolLastKey");
	}

	public RecSchool selectSchoolName(RecSchool recSchool) {
		return sqlSession.selectOne(NS + ".selectSchoolName", recSchool);
	}

	// 계획학교코드에 해당하는 계획학교상세 카운트하기
	public int psdCountByPlanSchoolCode(PlanSchool planSchool) {
		return sqlSession.selectOne(NS + ".psdCountByPlanSchoolCode", planSchool);
	}

	// 계확학교상세완료상태 카운트하기
	public int psdCountByPscWithCondition(PlanSchool planSchool) {
		return sqlSession.selectOne(NS + ".psdCountByPscWithCondition", planSchool);
	}
}
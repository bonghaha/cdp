package com.to.cdp.plan.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.plan.model.PlanDept;
import com.to.cdp.plan.model.PlanSchool;
import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.rec.model.RecDept;

@Repository
public class PlanDeptDao {
	private final String NS="com.to.cdp.repository.PlanMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// planDeptInsert
	public int planDeptInsert(PlanDept planDept){
		return sqlSession.insert(NS + ".planDeptInsert", planDept);
	}
	
	// planDeptUpdate
	public int planDeptUpdate(PlanDept planDept){
		return sqlSession.update(NS + ".planDeptUpdate", planDept);
	}
	
	// planDeptDelete
	public int planDeptDelete(PlanDept planDept){
		return sqlSession.delete(NS + ".planDeptDelete", planDept);
	}
	
	// planDeptList
	public List<PlanDept> planDeptList(PlanDept planDept){
		return sqlSession.selectList(NS + ".planDeptList", planDept);
	}
	
	// planDeptDetail
	public PlanDept planDeptDetail(PlanDept planDept){
		return sqlSession.selectOne(NS + ".planDeptDetail", planDept);
	}

	public List<PlanDept> planDeptList(PlanUnite planUnite) {
		return sqlSession.selectList(NS + ".planDeptList", planUnite);
	}

	// 마지막 코드번호 출력
	public String planDeptLastKey() {
		return sqlSession.selectOne(NS + ".planDeptLastKey");
	}

	public RecDept selectDeptMClass(RecDept recDept) {
		return sqlSession.selectOne(NS + ".selectDeptMClass", recDept);
	}
	
	// 계획학과코드에 해당하는 계획학과상세 카운트하기
	public int pddCountByPlanDeptCode(PlanDept planDept) {
		return sqlSession.selectOne(NS + ".pddCountByPlanDeptCode", planDept);
	}

	// 계확학과상세완료상태 카운트하기
	public int pddCountByPdcWithCondition(PlanDept planDept) {
		return sqlSession.selectOne(NS + ".pddCountByPdcWithCondition", planDept);
	}	
}
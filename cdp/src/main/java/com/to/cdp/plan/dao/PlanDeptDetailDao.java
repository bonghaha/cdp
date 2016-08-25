package com.to.cdp.plan.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.plan.model.PlanDeptDetail;

@Repository
public class PlanDeptDetailDao {
	private final String NS="com.to.cdp.repository.PlanDetailMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int planDeptDetailInsert(PlanDeptDetail planDeptDetail) {
		return sqlSession.insert(NS + ".planDeptDetailInsert", planDeptDetail);
	}

	public String planDeptDetailLastKey() {
		return sqlSession.selectOne(NS + ".planDeptDetailLastKey");
	}

	public List<PlanDeptDetail> planDeptDetailList(PlanDeptDetail planDeptDetail) {
		return sqlSession.selectList(NS + ".planDeptDetailList", planDeptDetail);
	}

	// 완료버튼 클릭시 condition 1로 바꾸기
	public int planDeptDetailComplete(PlanDeptDetail planDeptDetail) {
		return sqlSession.update(NS + ".planDeptDetailComplete", planDeptDetail);
	}

	// planSchoolDetailCode에 해당하는 planSchoolCode받기
	public String pdCodeByPddCode(PlanDeptDetail planDeptDetail) {
		return sqlSession.selectOne(NS + ".pdCodeByPddCode", planDeptDetail);
	}
}
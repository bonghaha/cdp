package com.to.cdp.plan.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.plan.model.PlanCertDetail;

@Repository
public class PlanCertDetailDao {
	private final String NS="com.to.cdp.repository.PlanDetailMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int planCertDetailInsert(PlanCertDetail planCertDetail) {
		return sqlSession.insert(NS + ".planCertDetailInsert", planCertDetail);
	}

	public String planCertDetailLastKey() {
		return sqlSession.selectOne(NS + ".planCertDetailLastKey");
	}

	public List<PlanCertDetail> planCertDetailList(PlanCertDetail planCertDetail) {
		return sqlSession.selectList(NS + ".planCertDetailList", planCertDetail);
	}

	// 완료버튼 클릭시 condition 1로 바꾸기
	public int planCertDetailComplete(PlanCertDetail planCertDetail) {
		return sqlSession.update(NS + ".planCertDetailComplete", planCertDetail);
	}

	// planSchoolDetailCode에 해당하는 planSchoolCode받기
	public String pcCodeByPcdCode(PlanCertDetail planCertDetail) {
		return sqlSession.selectOne(NS + ".pcCodeByPcdCode", planCertDetail);
	}
}

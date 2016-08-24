package com.to.cdp.rec.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoJob;
import com.to.cdp.info.model.InfoSchool;
import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.rec.model.RecSchool;
import com.to.cdp.rec.model.RecWithInfoSchool;



@Repository
public class RecSchoolDao {
	private final String NS="com.to.cdp.repository.RecMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// recSchoolInsert
	public int recSchoolInsert(RecSchool recSchool){
		return sqlSession.insert(NS + ".recSchoolInsert", recSchool);
	}
	
	// recSchoolUpdate
	public int recSchoolUpdate(RecSchool recSchool){
		return sqlSession.update(NS + ".recSchoolUpdate", recSchool);
	}
	
	// recSchoolDelete
	public int recSchoolDelete(RecSchool recSchool){
		return sqlSession.delete(NS + ".recSchoolDelete", recSchool);
	}
	
	// recSchoolList
	public List<RecSchool> recSchoolList(InfoJob infoJob){
		return sqlSession.selectList(NS + ".recSchoolList", infoJob);
	}
	
	// 추천이유,상태 가져오기
	public RecSchool recSchoolReason(RecSchool recSchool){
		return sqlSession.selectOne(NS + ".recSchoolReason", recSchool);
	}
	
	// ��õ�б� �� ����
	public int infoSchoolCountAtRec(Map<String, Object> map) {
		return sqlSession.selectOne(NS + ".infoSchoolCountAtRec", map);
	}

	// 추천이유 및 상태,seq 셋팅
	public List<RecSchool> recSchoolListWithRecSchoolCondition(Map<String, Object> map) {
		return sqlSession.selectList(NS + ".recSchoolListWithRecSchoolCondition", map);
	}

	public List<RecWithInfoSchool> recSchoolListByAjax(PlanUnite planUnite) {
		return sqlSession.selectList(NS + ".recSchoolListByAjax", planUnite);
	}

	// 추천학교 마지막코드값 가져오기
	public String recSchoolLastKey() {
		return sqlSession.selectOne(NS + ".recSchoolLastKey");
	}
}
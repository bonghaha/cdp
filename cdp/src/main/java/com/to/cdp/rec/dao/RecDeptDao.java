package com.to.cdp.rec.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.plan.model.PlanUnite;
import com.to.cdp.rec.model.RecDept;
import com.to.cdp.rec.model.RecWithInfoDept;



@Repository
public class RecDeptDao {
	private final String NS="com.to.cdp.repository.RecMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// recDeptInsert
	public int recDeptInsert(RecDept recDept){
		return sqlSession.insert(NS + ".recDeptInsert", recDept);
	}
	
	// recDeptUpdate
	public int recDeptUpdate(RecDept recDept){
		return sqlSession.update(NS + ".recDeptUpdate", recDept);
	}
	
	// recDeptDelete
	public int recDeptDelete(RecDept recDept){
		return sqlSession.delete(NS + ".recDeptDelete", recDept);
	}
	
	// recDeptList
	public List<RecDept> recDeptList(RecDept recDept){
		return sqlSession.selectList(NS + ".recDeptList", recDept);
	}
	
	// recDeptDetail
	public RecDept recDeptDetail(RecDept recDept){
		return sqlSession.selectOne(NS + ".recDeptDetail", recDept);
	}

	public int infoDeptCountAtRec(Map<String, Object> map) {
		return sqlSession.selectOne(NS + ".infoDeptCountAtRec", map);
	}

	public List<RecDept> recDeptListWithRecDeptCondition(Map<String, Object> map) {
		return sqlSession.selectList(NS + ".recDeptListWithRecDeptCondition", map);
	}

	public List<RecWithInfoDept> recDeptListByAjax(PlanUnite planUnite) {
		return sqlSession.selectList(NS + ".recDeptListByAjax", planUnite);
	}

	// 추천학과 마지막코드 가져오기
	public String recDeptLastKey() {
		return sqlSession.selectOne(NS + ".recDeptLastKey");
	}

	// 추천학과이유 가져오기
	public RecDept recDeptReason(RecDept recDept) {
		return sqlSession.selectOne(NS + ".recDeptReason", recDept);
	}
}
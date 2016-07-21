package com.to.cdp.rec.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.rec.model.RecDept;



@Repository
public class RecDeptDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
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
}
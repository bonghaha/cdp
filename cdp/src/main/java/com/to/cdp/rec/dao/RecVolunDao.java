package com.to.cdp.rec.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.rec.model.RecVolun;



@Repository
public class RecVolunDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// recVolunInsert
	public int recVolunInsert(RecVolun recVolun){
		return sqlSession.insert(NS + ".recVolunInsert", recVolun);
	}
	
	// recVolunUpdate
	public int recVolunUpdate(RecVolun recVolun){
		return sqlSession.update(NS + ".recVolunUpdate", recVolun);
	}
	
	// recVolunDelete
	public int recVolunDelete(RecVolun recVolun){
		return sqlSession.delete(NS + ".recVolunDelete", recVolun);
	}
	
	// recVolunList
	public List<RecVolun> recVolunList(RecVolun recVolun){
		return sqlSession.selectList(NS + ".recVolunList", recVolun);
	}
	
	// recVolunDetail
	public RecVolun recVolunDetail(RecVolun recVolun){
		return sqlSession.selectOne(NS + ".recVolunDetail", recVolun);
	}
}
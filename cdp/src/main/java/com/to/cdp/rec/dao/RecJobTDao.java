package com.to.cdp.rec.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.rec.model.RecJobT;



@Repository
public class RecJobTDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// recJobTInsert
	public int recJobTInsert(RecJobT recJobT){
		return sqlSession.insert(NS + ".recJobTInsert", recJobT);
	}
	
	// recJobTUpdate
	public int recJobTUpdate(RecJobT recJobT){
		return sqlSession.update(NS + ".recJobTUpdate", recJobT);
	}
	
	// recJobTDelete
	public int recJobTDelete(RecJobT recJobT){
		return sqlSession.delete(NS + ".recJobTDelete", recJobT);
	}
	
	// recJobTList
	public List<RecJobT> recJobTList(RecJobT recJobT){
		return sqlSession.selectList(NS + ".recJobTList", recJobT);
	}
	
	// recJobTDetail
	public RecJobT recJobTDetail(RecJobT recJobT){
		return sqlSession.selectOne(NS + ".recJobTDetail", recJobT);
	}
}
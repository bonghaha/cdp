package com.to.cdp.rec.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.rec.model.RecStudyAb;



@Repository
public class RecStudyAbDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// recStudyAbInsert
	public int recStudyAbInsert(RecStudyAb recStudyAb){
		return sqlSession.insert(NS + ".recStudyAbInsert", recStudyAb);
	}
	
	// recStudyAbUpdate
	public int recStudyAbUpdate(RecStudyAb recStudyAb){
		return sqlSession.update(NS + ".recStudyAbUpdate", recStudyAb);
	}
	
	// recStudyAbDelete
	public int recStudyAbDelete(RecStudyAb recStudyAb){
		return sqlSession.delete(NS + ".recStudyAbDelete", recStudyAb);
	}
	
	// recStudyAbList
	public List<RecStudyAb> recStudyAbList(RecStudyAb recStudyAb){
		return sqlSession.selectList(NS + ".recStudyAbList", recStudyAb);
	}
	
	// recStudyAbDetail
	public RecStudyAb recStudyAbDetail(RecStudyAb recStudyAb){
		return sqlSession.selectOne(NS + ".recStudyAbDetail", recStudyAb);
	}
}
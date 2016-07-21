package com.to.cdp.plan.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.plan.model.PlanLang;

@Repository
public class PlanLangDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// planLangInsert
	public int planLangInsert(PlanLang planLang){
		return sqlSession.insert(NS + ".planLangInsert", planLang);
	}
	
	// planLangUpdate
	public int planLangUpdate(PlanLang planLang){
		return sqlSession.update(NS + ".planLangUpdate", planLang);
	}
	
	// planLangDelete
	public int planLangDelete(PlanLang planLang){
		return sqlSession.delete(NS + ".planLangDelete", planLang);
	}
	
	// planLangList
	public List<PlanLang> planLangList(PlanLang planLang){
		return sqlSession.selectList(NS + ".planLangList", planLang);
	}
	
	// planLangDetail
	public PlanLang planLangDetail(PlanLang planLang){
		return sqlSession.selectOne(NS + ".planLangDetail", planLang);
	}
}
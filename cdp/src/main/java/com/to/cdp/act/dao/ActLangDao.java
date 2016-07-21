package com.to.cdp.act.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.act.model.ActLang;

@Repository
public class ActLangDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// actLangInsert
	public int actLangInsert(ActLang actLang){
		return sqlSession.insert(NS + ".actLangInsert", actLang);
	}
	
	// actLangUpdate
	public int actLangUpdate(ActLang actLang){
		return sqlSession.update(NS + ".actLangUpdate", actLang);
	}
	
	// actLangDelete
	public int actLangDelete(ActLang actLang){
		return sqlSession.delete(NS + ".actLangDelete", actLang);
	}
	
	// actLangList
	public List<ActLang> actLangList(ActLang actLang){
		return sqlSession.selectList(NS + ".actLangList", actLang);
	}
	
	// actLangDetail
	public ActLang actLangDetail(ActLang actLang){
		return sqlSession.selectOne(NS + ".actLangDetail", actLang);
	}
}
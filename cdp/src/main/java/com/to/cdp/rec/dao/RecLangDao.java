package com.to.cdp.rec.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.rec.model.RecLang;



@Repository
public class RecLangDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// recLangInsert
	public int recLangInsert(RecLang recLang){
		return sqlSession.insert(NS + ".recLangInsert", recLang);
	}
	
	// recLangUpdate
	public int recLangUpdate(RecLang recLang){
		return sqlSession.update(NS + ".recLangUpdate", recLang);
	}
	
	// recLangDelete
	public int recLangDelete(RecLang recLang){
		return sqlSession.delete(NS + ".recLangDelete", recLang);
	}
	
	// recLangList
	public List<RecLang> recLangList(RecLang recLang){
		return sqlSession.selectList(NS + ".recLangList", recLang);
	}
	
	// recLangDetail
	public RecLang recLangDetail(RecLang recLang){
		return sqlSession.selectOne(NS + ".recLangDetail", recLang);
	}
}
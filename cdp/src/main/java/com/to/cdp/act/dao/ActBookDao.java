package com.to.cdp.act.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.act.model.ActBook;

@Repository
public class ActBookDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// actBookInsert
	public int actBookInsert(ActBook actBook){
		return sqlSession.insert(NS + ".actBookInsert", actBook);
	}
	
	// actBookUpdate
	public int actBookUpdate(ActBook actBook){
		return sqlSession.update(NS + ".actBookUpdate", actBook);
	}
	
	// actBookDelete
	public int actBookDelete(ActBook actBook){
		return sqlSession.delete(NS + ".actBookDelete", actBook);
	}
	
	// actBookList
	public List<ActBook> actBookList(ActBook actBook){
		return sqlSession.selectList(NS + ".actBookList", actBook);
	}
	
	// actBookDetail
	public ActBook actBookDetail(ActBook actBook){
		return sqlSession.selectOne(NS + ".actBookDetail", actBook);
	}
}
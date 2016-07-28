package com.to.cdp.plan.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.plan.model.PlanBook;

@Repository
public class PlanBookDao {
	private final String NS="com.to.cdp.repository.PlanMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// planBookInsert
	public int planBookInsert(Map<String, Object> map){
		return sqlSession.insert(NS + ".planBookInsert", map);
	}
	
	// planBookUpdate
	public int planBookUpdate(PlanBook planBook){
		return sqlSession.update(NS + ".planBookUpdate", planBook);
	}
	
	// planBookDelete
	public int planBookDelete(PlanBook planBook){
		return sqlSession.delete(NS + ".planBookDelete", planBook);
	}
	
	// planBookList
	public List<PlanBook> planBookList(PlanBook planBook){
		return sqlSession.selectList(NS + ".planBookList", planBook);
	}
	
	// planBookDetail
	public PlanBook planBookDetail(PlanBook planBook){
		return sqlSession.selectOne(NS + ".planBookDetail", planBook);
	}
}
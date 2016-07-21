package com.to.cdp.rec.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.rec.model.RecBook;



@Repository
public class RecBookDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// recBookInsert
	public int recBookInsert(RecBook recBook){
		return sqlSession.insert(NS + ".recBookInsert", recBook);
	}
	
	// recBookUpdate
	public int recBookUpdate(RecBook recBook){
		return sqlSession.update(NS + ".recBookUpdate", recBook);
	}
	
	// recBookDelete
	public int recBookDelete(RecBook recBook){
		return sqlSession.delete(NS + ".recBookDelete", recBook);
	}
	
	// recBookList
	public List<RecBook> recBookList(RecBook recBook){
		return sqlSession.selectList(NS + ".recBookList", recBook);
	}
	
	// recBookDetail
	public RecBook recBookDetail(RecBook recBook){
		return sqlSession.selectOne(NS + ".recBookDetail", recBook);
	}
}
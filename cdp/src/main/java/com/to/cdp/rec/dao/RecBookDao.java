package com.to.cdp.rec.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.rec.model.RecBook;



@Repository
public class RecBookDao {
	private final String NS="com.to.cdp.repository.RecMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// recBookInsert
	public int recBookInsert(Map<String, Object> map){
		return sqlSession.insert(NS + ".recBookInsert", map);
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

	public int infoBookCountAtRec(Map<String, Object> map) {
		return sqlSession.selectOne(NS + ".infoBookCountAtRec", map);
	}

	public int recBookCount() {
		return sqlSession.selectOne(NS + ".recBookCount");
	}
}
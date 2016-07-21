package com.to.cdp.info.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoBook;

@Repository
public class InfoBookDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// InfoBookInsert
	public int infoBookInsert(InfoBook infoBook){
		return sqlSession.insert(NS + ".infoBookInsert", infoBook);
	}
	
	// InfoBookUpdate
	public int infoBookUpdate(InfoBook infoBook){
		return sqlSession.update(NS + ".infoBookUpdate", infoBook);
	}
	
	// InfoBookDelete
	public int infoBookDelete(InfoBook infoBook){
		return sqlSession.delete(NS + ".infoBookDelete", infoBook);
	}
	
	// infoBookCount
	public int infoBookCount(){
		return sqlSession.selectOne(NS + ".infoBookCount");
	}
	
	// infoBookCountBySearch
	public int infoBookCountBySearch(Map<String, Object> map){
		return sqlSession.selectOne(NS + ".infoBookCountBySearch", map);
	}
		
	// InfoBookList
	public List<InfoBook> infoBookList(Map<String, Object> map){
		return sqlSession.selectList(NS + ".infoBookList", map);
	}
	
	// InfoBookDetail
	public InfoBook infoBookDetail(InfoBook infoBook){
		return sqlSession.selectOne(NS + ".infoBookDetail", infoBook);
	}
}
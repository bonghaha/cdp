package com.to.cdp.info.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoDept;

@Repository
public class InfoDeptDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// InfoDeptInsert
	public int infoDeptInsert(InfoDept infoDept){
		return sqlSession.insert(NS + ".infoDeptInsert", infoDept);
	}
	
	// InfoDeptUpdate
	public int infoDeptUpdate(InfoDept infoDept){
		return sqlSession.update(NS + ".infoDeptUpdate", infoDept);
	}
	
	// InfoDeptDelete
	public int infoDeptDelete(InfoDept infoDept){
		return sqlSession.delete(NS + ".infoDeptDelete", infoDept);
	}

	// infoDeptCount
	public int infoDeptCount(){
		return sqlSession.selectOne(NS + ".infoDeptCount");
	}
	
	// infoDeptCount
	public int infoDeptCountBySearch(Map<String, Object> map){
		return sqlSession.selectOne(NS + ".infoDeptCountBySearch", map);
	}
		
	// InfoDeptList
	public List<InfoDept> infoDeptList(Map<String, Object> map){
		return sqlSession.selectList(NS + ".infoDeptList", map);
	}
	
	// InfoDeptDetail
	public InfoDept infoDeptDetail(InfoDept infoDept){
		return sqlSession.selectOne(NS + ".infoDeptDetail", infoDept);
	}

}
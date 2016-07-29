package com.to.cdp.info.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoMember;

@Repository
public class InfoMemberDao {
	private final String NS="com.to.cdp.repository.CdpMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// InfoMemberInsert
	public int infoMemberInsert(InfoMember infoMember){
		return sqlSession.insert(NS + ".infoMemberInsert", infoMember);
	}
	
	// InfoMemberUpdate
	public int infoMemberUpdate(InfoMember infoMember){
		return sqlSession.update(NS + ".infoMemberUpdate", infoMember);
	}
	
	// InfoMemberDelete
	public int infoMemberDelete(InfoMember infoMember){
		return sqlSession.delete(NS + ".infoMemberDelete", infoMember);
	}
	
	// infoMemberCount(ȸ����Ͽ�)
	public int infoMemberCount(){
		return sqlSession.selectOne(NS + ".infoMemberCount");
	}
	
	// infoMemberCount
	public int infoMemberCountBySearch(Map<String, Object> map){
		return sqlSession.selectOne(NS + ".infoMemberCountBySearch", map);
	}
	
	// InfoMemberList
	public List<InfoMember> infoMemberList(Map<String, Object> map){
		return sqlSession.selectList(NS + ".infoMemberList", map);
	}
	
	// InfoMemberDetail
	public InfoMember infoMemberDetail(InfoMember infoMember){
		return sqlSession.selectOne(NS + ".infoMemberDetail", infoMember);
	}

	public InfoMember findByUserIdAndPassword(InfoMember infoMember) {
		return sqlSession.selectOne(NS + ".findByUserIdAndPassword", infoMember);
	}
}
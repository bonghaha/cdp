package com.to.cdp;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoMember;

@Repository
public class MyPageDao {
	private final String NS="com.to.cdp.repository.MyPageMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public InfoMember infoMemberDetail(InfoMember infoMember) {
		return sqlSession.selectOne(NS + ".infoMemberDetail", infoMember);
	}

	public int myInfoMemberUpdate(InfoMember infoMember) {
		return sqlSession.update(NS + ".myInfoMemberUpdate", infoMember);
	}
}

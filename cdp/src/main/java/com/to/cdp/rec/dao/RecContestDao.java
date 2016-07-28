package com.to.cdp.rec.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoJob;
import com.to.cdp.rec.model.RecBook;
import com.to.cdp.rec.model.RecContest;



@Repository
public class RecContestDao {
	private final String NS="com.to.cdp.repository.RecMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// recContestInsert
	public int recContestInsert(RecContest recContest){
		return sqlSession.insert(NS + ".recContestInsert", recContest);
	}
	
	// recContestUpdate
	public int recContestUpdate(RecContest recContest){
		return sqlSession.update(NS + ".recContestUpdate", recContest);
	}
	
	// recContestDelete
	public int recContestDelete(RecContest recContest){
		return sqlSession.delete(NS + ".recContestDelete", recContest);
	}
	
	// recContestList
	public List<RecContest> recContestList(InfoJob infoJob){
		return sqlSession.selectList(NS + ".recContestList", infoJob);
	}
	
	// recContestDetail
	public RecContest recContestDetail(RecContest recContest){
		return sqlSession.selectOne(NS + ".recContestDetail", recContest);
	}
	
	// ��õ������ �� ����
	public int infoContestCountAtRec(Map<String, Object> map) {
		return sqlSession.selectOne(NS + ".infoContestCountAtRec", map);
	}

	// ��õ�������ڵ��ȣ ���� ���� count
	public int recContestCount() {
		return sqlSession.selectOne(NS + ".recContestCount");
	}
	
	// ��õ����������Ʈ
	public List<Map<String, Object>> recContestListWithRecContestCondition(Map<String, Object> map) {
		return sqlSession.selectList(NS + ".recContestListWithRecContestCondition", map);
	}

}
package com.to.cdp.rec.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.info.model.InfoJob;
import com.to.cdp.rec.model.RecBook;



@Repository
public class RecBookDao {
	private final String NS="com.to.cdp.repository.RecMapper";
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
	public List<RecBook> recBookList(InfoJob infoJob){
		return sqlSession.selectList(NS + ".recBookList", infoJob);
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

	public List<RecBook> recBookSelectInfoBookCodeByInfoJob(InfoJob infoJob) {
		return sqlSession.selectList(NS + ".recBookSelectInfoBookCodeByInfoJob", infoJob);
	}

	public List<Map<String, Object>> recBookListWithRecBookCondition(Map<String, Object> map) {
		return sqlSession.selectList(NS + ".recBookListWithRecBookCondition", map);
	}

	public InfoJob selectInfoJobCodeByInfoJobUnitName(InfoJob infoJob) {
		return sqlSession.selectOne(NS + ".selectInfoJobCodeByInfoJobUnitName", infoJob);
	}

	public List<RecBook> recBookListByInfoJobCode(InfoJob infoJob) {
		return sqlSession.selectList(NS + ".recBookListByInfoJobCode", infoJob);
	}

	public List<Map<String, Object>> recBookListWithDetail(List<RecBook> recBookList) {
		return sqlSession.selectList(NS + ".recBookListWithDetail", recBookList);
	}
}
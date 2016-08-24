package com.to.cdp.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.to.cdp.board.model.Article;
import com.to.cdp.board.model.Reply;

@Repository
public class BoardDao {
	private final String NS="com.to.cdp.repository.BoardMapper";
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 
	public int articleInsert(Article article){
		return sqlSession.insert(NS + ".articleInsert", article);
	}
	
	// articleDetail
	public Article articleDetail(Article article){
		return sqlSession.selectOne(NS + ".articleDetail", article);
	}
	
	// 
	public List<Article> articleList(Map<String,Object> map){
		return sqlSession.selectList(NS + ".articleList", map);
	}
	
	// 
	public int selectTotalCount(Map<String, String> map){
		return sqlSession.selectOne(NS + ".selectTotalCount", map);
	}
	
	// 
	public Article articleSelectByNoAndPw(Article article){
		return sqlSession.selectOne(NS + ".articleSelectByNoAndPw", article);
	}
	
	// 
	public int articleModify(Article article){
		return sqlSession.update(NS + ".articleModify", article);
	}
	
	// �� ����
	public int articleDelete(Article article){
		return sqlSession.delete(NS + ".articleDelete", article);
	}
	
	// replyInsert
	public int replyInsert(Reply reply){
		return sqlSession.insert(NS + ".replyInsert", reply);
	}
	
	// replyList (direct:include=>articleDetail��)
	public List<Reply> replyList(Reply reply){
		return sqlSession.selectList(NS + ".replyList", reply);
	}
	
	// replyModify
	public int replyModify(Reply reply){
		return sqlSession.update(NS + ".replyModify", reply);
	}
	
	// replyDelete
	public int replyDelete(Reply reply){
		return sqlSession.delete(NS + ".replyDelete", reply);
	}
	
	// replyDetail
	public Reply replyDetail(Reply reply) {
		return sqlSession.selectOne(NS + ".replyDetail", reply);
	}

	public Reply replyDetailByArticleNo(Reply reply) {
		return sqlSession.selectOne(NS + ".replyDetailByArticleNo", reply);
	}

	public Object articleDetailByArticleNo(int articleNo) {
		return sqlSession.selectOne(NS + ".articleDetailByArticleNo", articleNo);
	}

	public List<Reply> replyListByArticleNo(Article article) {
		return sqlSession.selectList(NS + ".replyListByArticleNo", article);
	}

	public int replyDeleteWithArticle(Article article) {
		return sqlSession.delete(NS + ".replyDeleteWithArticle", article);
	}

	public int articleCountBySearch(Map<String, Object> map) {
		return sqlSession.selectOne(NS + ".articleCountBySearch", map);
	}
}
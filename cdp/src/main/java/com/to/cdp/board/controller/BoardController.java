package com.to.cdp.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.to.cdp.board.model.Article;
import com.to.cdp.board.model.PageHelper;
import com.to.cdp.board.model.Reply;
import com.to.cdp.board.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	// articleInsert 
	@RequestMapping(value="/articleInsert", method=RequestMethod.GET)
	public String articleInsert(){
		return "board/articleInsert";
	}
	
	// articleInsert
	@RequestMapping(value="/articleInsert", method=RequestMethod.POST)
	public String articleInsert(Article article){
		boardService.articleInsert(article);
		return "redirect:/articleList";
	}
	
	// articleList
	@RequestMapping(value="/articleList", method=RequestMethod.GET)
	public String articleList(
			Model model,
			Map<String, Object> map,
			PageHelper pageHelper,
			@RequestParam(value="clickPage", defaultValue = "1") int clickPage,
			@RequestParam(value="linePerPage", defaultValue = "10")  int linePerPage,
			@RequestParam(value="blockSize", defaultValue = "10") int blockSize,
			@RequestParam(value="searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value="searchWord", required = false, defaultValue = "") String searchWord){
		
		map = new HashMap<>();
		map.put("searchType", searchType);
		map.put("searchWord", searchWord);
		
		int totalCount = boardService.articleCountBySearch(map);	// totalCount 셋팅
		pageHelper.pageSet(totalCount, linePerPage, clickPage, blockSize);	// 페이지 셋팅
		map.put("pageHelper", pageHelper);
		
		List<Article> articleList = boardService.articleList(map);
		model.addAttribute("articleList", articleList);
		model.addAttribute("pageHelper", pageHelper);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchWord", searchWord);
		return "board/articleList";
	}

	// articleDetail
	@RequestMapping(value="/articleDetail", method=RequestMethod.POST)
	public String articleDetail(Article article, Reply reply, Model model){
		article = boardService.articleDetail(article);
		List<Reply> replyList = boardService.replyList(reply);
		model.addAttribute("article", article);
		model.addAttribute("replyList", replyList);
		return "board/articleDetail";
	}
	@RequestMapping(value="/articleDetail1", method=RequestMethod.GET)
	public String articleDetail1(Article article, Reply reply, Model model){
		article = boardService.articleDetail(article);
		model.addAttribute("article", article);
		List<Reply> replyList = boardService.replyListByArticleNo(article);
		model.addAttribute("replyList", replyList);
		return "board/articleDetail";
	}
	
	// articleModify 
	@RequestMapping(value="/articleModify", method=RequestMethod.GET)
	public String articleModify(Article article, Model model){
		article = boardService.articleDetail(article);
		model.addAttribute("article", article);
		return "board/articleModify";
	}
	
	// articleModify
	@RequestMapping(value="/articleModifyPost", method=RequestMethod.POST)
	public String articleModifyPost(Article article, Model model){
		boardService.articleModify(article);
		List<Reply> replyList = boardService.replyListByArticleNo(article);
		model.addAttribute("replyList", replyList);
		return "board/articleDetail";
	}
	
	// articleDelete 
	@RequestMapping(value="/articleDelete", method=RequestMethod.GET)
	public String articleDelete(Article article, Reply reply, Model model){
		article = boardService.articleDetail(article);
		model.addAttribute("article", article);
		return "board/articleDelete";
	}
	
	// articleDelete
	@RequestMapping(value="/articleDelete", method=RequestMethod.POST)
	public String articleDelete(Reply reply, Article article){
		if(article.getArticleNo() != 0){
			boardService.replyDeleteWithArticle(article);
		}
		boardService.articleDelete(article);
		return "redirect:/articleList";
	}

	// replyInsert
	@RequestMapping(value="/replyInsert", method=RequestMethod.POST)
	public String replyInsert(Article article, Reply reply, Model model){
		boardService.replyInsert(reply);
		article = boardService.articleDetail(article);
		List<Reply> replyList = boardService.replyList(reply);
		model.addAttribute("article", article);
		model.addAttribute("replyList", replyList);
		return "board/articleDetail";
	}
	
	// replyList
	@RequestMapping(value="/replyList", method=RequestMethod.GET)
	public String replyList(Reply reply){
		boardService.replyList(reply);
		return "board/articleList";
	}
/*	replyModify !!!
	// replyModify 
	@RequestMapping(value="/replyModify", method=RequestMethod.GET)
	public String replyModify(Article article, Reply reply, Model model){
		article = boardService.articleDetail(article);
		List<Reply> replyList = boardService.replyList(reply);
		model.addAttribute("article", article);
		model.addAttribute("replyList", replyList);
		return "articleDetail";
	}
	
	// replyModify
	@RequestMapping(value="/replyModify", method=RequestMethod.POST)
	public String replyModify(Reply reply){
		boardService.replyModify(reply);
		return "articleDetail";
	}
	*/
	// replyDelete 
	@RequestMapping(value="/replyDelete", method=RequestMethod.GET)
	public String replyDelete(Reply reply, Model model){
		reply = boardService.replyDetail(reply);
		model.addAttribute("reply", reply);
		return "board/replyDelete";
	}
	
	// replyDelete
	@RequestMapping(value="/replyDelete", method=RequestMethod.POST)
	public String replyDelete(Reply reply, Model model, @RequestParam("articleNo") int articleNo){
		boardService.replyDelete(reply);
		Object article = boardService.articleDetailByArticleNo(articleNo);
		List<Reply> replyList = boardService.replyList(reply);
		model.addAttribute("article", article);
		model.addAttribute("replyList", replyList);
		return "board/articleDetail";
	}
}
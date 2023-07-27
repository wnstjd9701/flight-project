package com.project.myapp.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.safety.Safelist;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.myapp.board.model.Board;
import com.project.myapp.board.model.BoardCategory;
import com.project.myapp.board.model.Reply;
import com.project.myapp.board.service.IBoardCategoryService;
import com.project.myapp.board.service.IBoardService;
import com.project.myapp.board.service.IReplyService;
import com.project.myapp.member.model.Member;
import com.project.myapp.member.service.IMemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {
	
	private final IMemberService memberService;
	
	private final IBoardService boardService;
	
	private final IBoardCategoryService boardCategoryService;
	
	private final IReplyService replyService;
	
	static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	/*   API no.19
    	method : GET
    	information : 카테고리별 Q&A 리스트
	*/
	@RequestMapping("/board/cat/{categoryId}/{page}")
	public String getListByCategory(@PathVariable int categoryId, @PathVariable int page, HttpSession session, Model model) {
		session.setAttribute("page", page);
		model.addAttribute("categoryId", categoryId);
		List<Board> boardList = boardService.selectBoardListByCategory(categoryId, page);
		System.out.println(boardList);
		model.addAttribute("boardList", boardList);
		int bbsCount = boardService.selectTotalBoardCountByCategoryId(categoryId);
		System.out.println(bbsCount);
		int totalPage = 0;
		if(bbsCount>0) {
			totalPage = (int)Math.ceil(bbsCount/10.0);
		}
		model.addAttribute("totalPageCount", totalPage);
		model.addAttribute("page",page);
		
		return "board/list";		
	}
	
	@RequestMapping("/board/cat/{categoryId}")
	public String getListByCategory(@PathVariable int categoryId, HttpSession session, Model model) {
		return getListByCategory(categoryId, 1, session, model);
	}
	
	/*   API no.21
		method : GET
		information : Q&A글 보기
	 */
	@RequestMapping(value="/board/{boardId}/{page}",method=RequestMethod.GET)
	public String getBoardDetail(@PathVariable int boardId, @PathVariable int page, Model model,HttpSession session) {
		try {
		Board board = boardService.selectBoard(boardId);
		Member member = memberService.selectMember((String)session.getAttribute("memberId"));
		model.addAttribute("member", member);
		List<Reply> replyList= replyService.selectReply(boardId);
		model.addAttribute("board", board);
		model.addAttribute("page", page);
		model.addAttribute("replyList", replyList);
		model.addAttribute("categoryId", board.getCategoryId());
		logger.info("getBoardDetails"+board.toString());
		}catch(Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		return "board/view";
	}
	
	@RequestMapping("/board/{boardId}")
	public String getBoardDetail(@PathVariable int boardId, Model model,HttpSession session) {
		return getBoardDetail(boardId, 1, model,session);
	}
	
	/*   API no.22
	  	method : GET
		information : Q&A글 쓰기
	*/
	@RequestMapping(value="/board/write/{boardCategoryId}",method = RequestMethod.GET)
	public String writeBoard(@PathVariable int boardCategoryId, Model model) {
		List<BoardCategory> categoryList = boardCategoryService.selectAllCategory();
		System.out.println(categoryList);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("boardCategoryId", boardCategoryId);
		return "board/write";
	}
	/*  API no.22
		method : POST
		information : Q&A글 쓰기
	*/
	@RequestMapping(value="/board/write", method=RequestMethod.POST)
	public String wirteBoard(Board board, BindingResult result, RedirectAttributes redirectAttrs) {
		logger.info("board/wirte :" + board.toString());
		try {
//			board.setContent(board.getContent().replace("\r\n", "<br>"));
			board.setTitle(Jsoup.clean(board.getTitle(), Safelist.basic()));
			board.setContent(Jsoup.clean(board.getContent(), Safelist.basic()));
			boardService.insertBoard(board);
		}catch(Exception e){
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message",e.getMessage());
		}
		System.out.println(board);
		return "redirect:/board/cat/" + board.getCategoryId();
	}
	
	/*  API no.23
		method : GET
		information : Q&A글 수정
	*/
	@RequestMapping(value="/board/update/{boardId}",method=RequestMethod.GET)
	public String updateBoard(@PathVariable int boardId, Model model) {
		List<BoardCategory> categoryList = boardCategoryService.selectAllCategory();
		Board board = boardService.selectBoard(boardId);
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("categoryId", board.getCategoryId());
		board.setContent(board.getContent().replaceAll("\r\n", "<br>"));
		model.addAttribute("board", board);
		return "board/update";
	}
	/*   API no.23
		method : POST
		information : Q&A글 수정
	*/
	@RequestMapping(value="/board/update",method=RequestMethod.POST)
	public String updateBoard(Board board, RedirectAttributes redirectAttrs) {
		logger.info("/board/update"+board.toString());
		try {
			board.setContent(board.getContent().replace("\r\n", "<br>"));
			board.setTitle(Jsoup.clean(board.getTitle(), Safelist.basic()));
			board.setContent(Jsoup.clean(board.getContent(), Safelist.basic()));
			boardService.updateBoard(board);
		}catch(Exception e){
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message",e.getMessage());
		}
			return "redirect:/board/"+board.getBoardId();
	}
	
	/*  API no.24
		method : POST
		information : Q&A글 삭제
	*/
	@RequestMapping(value="/board/delete",method=RequestMethod.POST)
	public String deleteBoard(Board board, RedirectAttributes model, HttpSession session) {
		try {
			boardService.deleteBoard(board.getBoardId());
			return "redirect:/board/cat/"+board.getCategoryId() + "/" + (Integer)session.getAttribute("page");
		}catch(Exception e) {
			model.addAttribute("message", e.getMessage());
			e.printStackTrace();
			return "error/runtime";
		}
	}
	
	@RequestMapping("/board/search/{page}")
	public String search(@RequestParam(required=false, defaultValue="") String keyword, @PathVariable int page, HttpSession session, Model model) {
		try {
			List<Board> boardList = boardService.searchListByContentKeyword(keyword, page);
			model.addAttribute("boardList", boardList);
			int bbsCount = boardService.selectTotalBoardCountByKeyword(keyword);
			int totalPage = 0;
			if(bbsCount > 0) {
				totalPage= (int)Math.ceil(bbsCount/10.0);
			}
			model.addAttribute("totalPageCount", totalPage);
			model.addAttribute("page", page);
			model.addAttribute("keyword", keyword);
			logger.info(totalPage + ":" + page + ":" + keyword);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "board/search";
	}
	/*   API no.22
		method : POST
		information : 댓글 남기기
	*/
	@RequestMapping(value="/board/reply", method=RequestMethod.POST)
	public String wirteReply(String memberId,Reply reply, BindingResult result, RedirectAttributes redirectAttrs,HttpSession session,Model model) {
		logger.info("reply/wirte :" + reply.toString());
		Member member = memberService.selectMember(memberId);
		try {
			model.addAttribute("member", member);
			if(member.getIsAdmin()==1) {
				reply.setReplyContent(reply.getReplyContent().replace("\r\n", "<br>"));
				replyService.insertReply(reply);				
			}
		}catch(Exception e){
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message",e.getMessage());
		}
		System.out.println(reply.getBoardId());
		return "redirect:/board/" + reply.getBoardId();
	}
	
	@RequestMapping(value="/board/deletereply", method=RequestMethod.POST)
	public String deleteReply(Reply reply, RedirectAttributes redirectAttrs,Model model) {
		Member member = memberService.selectMember(reply.getMemberId());
		try {
			model.addAttribute("member", member);
			if(member.getIsAdmin()==1) {
				replyService.deleteReply(reply.getReplyId());				
			}
		}catch(Exception e){
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message",e.getMessage());
		}
		System.out.println(reply.getBoardId());
		return "redirect:/board/" + reply.getBoardId();
	}
	

	

}


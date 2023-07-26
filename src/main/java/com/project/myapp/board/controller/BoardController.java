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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.myapp.board.model.Board;
import com.project.myapp.board.model.BoardCategory;
import com.project.myapp.board.service.IBoardCategoryService;
import com.project.myapp.board.service.IBoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class BoardController {
	
	private final IBoardService boardService;
	
	private final IBoardCategoryService boardCategoryService;
	
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
//	
//	/*   API no.20
//		method : GET
//		information : 전체 Q&A 리스트
//	 */
//	@RequestMapping("/board/{page}")
//	public String getAllBoardList(@PathVariable int page, HttpSession session, Model model) {
//		session.setAttribute("page", page);
//		List<Board> boardList = boardService.getAllBoard(page);
//		model.addAttribute("boardList", boardList);
//		int bbsCount = boardService.selectTotalBoardCount();
//		int totalPage = 0;
//		if(bbsCount>0) {
//			totalPage = (int)Math.ceil(bbsCount/10.0);
//		}
//		model.addAttribute("totalPage", totalPage);
//		model.addAttribute("page",page);
//		
//		return "board/list";		
//	}
	
	/*   API no.21
		method : GET
		information : Q&A글 보기
	 */
	@RequestMapping("/board/{boardId}/{page}")
	public String getBoardDetail(@PathVariable int boardId, @PathVariable int page, Model model) {
		Board board = boardService.selectBoard(boardId);
		model.addAttribute("board", board);
		model.addAttribute("page", page);
		model.addAttribute("categoryId", board.getCategoryId());
		logger.info("getBoardDetails"+board.toString());
		return "board/view";
	}
	
	@RequestMapping("/board/{boardId}")
	public String getBoardDetail(@PathVariable int boardId, Model model) {
		return getBoardDetail(boardId,1, model);
	}
	
	/*   API no.22
	  	method : GET
		information : Q&A글 쓰기
	*/
	@RequestMapping(value="/board/write/{categoryId}",method = RequestMethod.GET)
	public String writeBoard(@PathVariable int categoryId, Model model) {
		List<BoardCategory> categoryList = boardCategoryService.selectAllCategory();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("categoryId", categoryId);
		return "board/write";
	}
	/*   API no.22
		method : POST
		information : Q&A글 쓰기
	*/
	@RequestMapping(value="/board/write", method=RequestMethod.POST)
	public String wirteBoard(Board board, BindingResult result, RedirectAttributes redirectAttrs) {
		logger.info("board/wirte :" + board.toString());
		try {
			board.setContent(board.getContent().replace("\r\n", "<br>"));
			board.setTitle(Jsoup.clean(board.getTitle(), Safelist.basic()));
			board.setContent(Jsoup.clean(board.getContent(), Safelist.basic()));
		}catch(Exception e){
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message",e.getMessage());
		}
		return "redirect:/board/cat" + board.getCategoryId();
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
}


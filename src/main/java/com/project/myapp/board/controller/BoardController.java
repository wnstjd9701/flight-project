//package com.project.myapp.board.controller;
//
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.project.myapp.board.model.Board;
//import com.project.myapp.board.service.IBoardCategoryService;
//import com.project.myapp.board.service.IBoardService;
//
//import lombok.RequiredArgsConstructor;
//
//@Controller
//@RequiredArgsConstructor
//public class BoardController {
//	
//	private final IBoardService boardService;
//	
//	private final IBoardCategoryService boardCategoryService;
//	
//	static final Logger logger = LoggerFactory.getLogger(BoardController.class);
//	
//	/*   API no.19
//    	method : GET
//    	information : 카테고리별 Q&A 리스트
//	*/
//	@RequestMapping("/board/cat/{categoryId}/{page}")
//	public String getListByCategory(@PathVariable int categoryId, @PathVariable int page, HttpSession session, Model model) {
//		session.setAttribute("page", page);
//		model.addAttribute("categoryId", categoryId);
//		List<Board> boardList = boardService.selectBoardListByCategory(categoryId, page);
//		model.addAttribute("boardList", boardList);
//		int bbsCount = boardService.selectTotalBoardCountByCategoryId(categoryId);
//		int totalPage = 0;
//		if(bbsCount>0) {
//			totalPage = (int)Math.ceil(bbsCount/10.0);
//		}
//		model.addAttribute("totalPage", totalPage);
//		model.addAttribute("page",page);
//		
//		return "board/qna";		
//	}
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
//		return "board/qna";		
//	}
//	
//	/*   API no.21
//		method : GET
//		information : Q&A글 보기
//	 */
//	@RequestMapping("/board/{boardId}/{page}")
//	public String getBoardDetail(@PathVariable int boardId, @PathVariable int page, Model model) {
//		Board board = boardService.selectBoard(boardId);
//		model.addAttribute("board", board);
//		model.addAttribute("page", page);
//		model.addAttribute("categoryId", board.getCategoryId());
//		logger.info("getBoardDetails"+board.toString());
//		return "board/qnadetail";
//	}
//}
//
//

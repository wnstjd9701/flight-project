package com.project.myapp.board.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.myapp.board.dao.IBoardRepository;
import com.project.myapp.board.dao.IReplyRepository;
import com.project.myapp.board.model.Board;


import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService implements IBoardService {
	
	private final IBoardRepository IBoardRepository;
	

	@Override
	public List<Board> selectBoardListByCategory(int categoryId, int page) {
		int start = (page-1)*10 + 1 ;
		return IBoardRepository.selectBoardListByCategory(categoryId, start, start+9);
	}

	@Override
	public List<Board> getAllBoard(int page) {
		int start = (page-1)*10 + 1 ;
		return IBoardRepository.getAllBoard(start, start+9);
	}

	@Transactional
	public Board selectBoard(int boardId) {
		IBoardRepository.updateViews(boardId);
		return IBoardRepository.selectBoard(boardId);
	}

	@Transactional
	public void insertBoard(Board board) {
		board.setBoardId(IBoardRepository.selectMaxBoardNo()+1);
		IBoardRepository.insertBoard(board);

	}

	@Override
	public void updateBoard(Board board) {
		 IBoardRepository.updateBoard(board);
		
	}

	@Override
	public void deleteBoard(int boardId) {
		IBoardRepository.deleteBoard(boardId);
		
	}

	@Override
	public int selectTotalBoardCount() {
		return IBoardRepository.selectTotalBoardCount();
	}

	@Override
	public int selectTotalBoardCountByCategoryId(int categoryId) {
		return IBoardRepository.selectTotalBoardCountByCategoryId(categoryId);
	}

	@Override
	public List<Board> searchListByContentKeyword(String keyword, int page) {
		int start = (page-1)*10 + 1 ;
		return IBoardRepository.searchListByContentKeyword("%"+keyword+"%", start, start+9);
	}

	@Override
	public int selectTotalBoardCountByKeyword(String keyword) {
		return IBoardRepository.selectTotalBoardCountByKeyword("%"+keyword+"%");
	}

}

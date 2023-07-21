package com.project.myapp.board.service;

import java.util.List;

import com.project.myapp.board.model.Board;


public interface IBoardService {
	   //카테고리별 Q&A조회
	   List<Board> selectBoardListByCategory(int categoryId,int page);
	   
	   //Q&A게시판 조회 작성 수정 삭제
	   List<Board> getAllBoard(int page); //Q&A 리스트
	   Board selectBoard(int boardId); //Q&A 보기
	   void insertBoard(Board boardId); //Q&A 작성
	   void updateBoard(Board board);// Q&A 수정
	   void deleteBoard(int boardId); // Q&A 삭제
	   
	   int selectTotalBoardCount(); //총 Q&A 개수
	   int selectTotalBoardCountByCategoryId(int categoryId); //카테고리ID별 Q&A개수
	   
	   //keyword로 검색
	   List<Board> searchListByContentKeyword(String keyword,int page);
	   int selectTotalBoardCountByKeyword(String keyword);

}

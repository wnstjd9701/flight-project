package com.project.myapp.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.myapp.board.model.Board;
import com.project.myapp.board.model.Reply;

public interface IBoardRepository {
	int selectMaxBoardNo();
		
	//카테고리별 Q&A조회
	List<Board> selectBoardListByCategory(@Param("categoryId")int categoryId, @Param("start")int start, @Param("end")int end);
	
	//Q&A게시판 조회 작성 수정 삭제
	List<Board> getAllBoard(@Param("start") int start, @Param("end") int end); //Q&A 리스트
	Board selectBoard(int boardId); //Q&A 보기
	void insertBoard(Board board); //Q&A 작성
	void updateBoard(Board board);// Q&A 수정
	void deleteBoard(int boardId); // Q&A 삭제
	void updateViews(int boardId); // 조회수 업데이트
	
	int selectTotalBoardCount(); //총 Q&A 개수
	int selectTotalBoardCountByCategoryId(int categoryId); //카테고리ID별 Q&A개수
	
	//keyword로 검색
	List<Board> searchListByContentKeyword(@Param("keyword")String keyword, @Param("start")int start, @Param("end")int end);
	int selectTotalBoardCountByKeyword(String keyword);
}

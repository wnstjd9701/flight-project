package com.project.myapp.board.dao;

import java.util.List;

import com.project.myapp.board.model.Board;
import com.project.myapp.board.model.Reply;

public interface IBoardRepository {
	//Q&A게시판 조회 작성 수정 삭제
	List<Board> getAllBoard(); //Q&A 리스트
	Board selectBoard(int boardId); //Q&A 보기
	void insertBoard(Board board); //Q&A 작성
	void updateBoard(Board board);// Q&A 수정
	void delteBoard(int boardId); // Q&A 삭제
	//댓글 작성 및 삭제
	void insertReply(Reply reply); //댓글 작성
	void updateReply(Reply reply); //댓글 수정
	void deleteReply(int replyId); //댓글 삭제
}

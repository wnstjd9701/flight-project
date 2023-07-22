package com.project.myapp.board.service;

import com.project.myapp.board.model.Reply;

public interface IReplyService {
	//댓글 작성 및 삭제
	Reply selectReply(int boardId,int replyId); //댓글 조회
	void insertReply(Reply reply); //댓글 작성
	void updateReply(Reply reply); //댓글 수정
	void deleteReply(int replyId); //댓글 삭제
}

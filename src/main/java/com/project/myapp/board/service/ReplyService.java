package com.project.myapp.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.myapp.board.dao.IReplyRepository;
import com.project.myapp.board.model.Reply;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReplyService implements IReplyService {
	
	private final IReplyRepository IReplyRepository;

	@Override
	public List<Reply> selectReply(int boardId) {
		return IReplyRepository.selectReply(boardId);
	}

	@Override
	public void insertReply(Reply reply) {
		IReplyRepository.insertReply(reply);
		
	}

	@Override
	public void updateReply(Reply reply) {
		IReplyRepository.updateReply(reply);
		
	}

	@Override
	public void deleteReply(int replyId) {
		IReplyRepository.deleteReply(replyId);
		
	}

}

package com.project.myapp.board.model;


import java.sql.Timestamp;

import lombok.Data;

@Data
public class Reply {
	private int replyId;
	private String memberId;
	private int boardId;
	private String replyContent;
	private Timestamp createdAt;
	private Timestamp updatedAt;
}

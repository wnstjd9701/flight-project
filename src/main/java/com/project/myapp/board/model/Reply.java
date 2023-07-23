package com.project.myapp.board.model;

import java.sql.Clob;
import java.sql.Timestamp;

public class Reply {
	private int replyId;
	private String memberId;
	private int boardId;
	private String replyContent;
	private Timestamp createdAt;
	private Timestamp updatedAt;
}

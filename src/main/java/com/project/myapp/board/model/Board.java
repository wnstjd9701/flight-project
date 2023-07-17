package com.project.myapp.board.model;

import java.sql.Clob;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Board {
	private int boardId;
	private String memberId;
	private String title;
	private Clob content;
	private int views;
	private Timestamp createdAt;
	private Timestamp updatedAt;
}

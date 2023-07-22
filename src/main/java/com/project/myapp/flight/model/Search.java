package com.project.myapp.flight.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Search {
	private String nation;
	private String departmentNation;
	private String arrivalNation;
	private Date departmentDate;
	private Date arrivalDate;
	private int person;
	private int grade;
	private int page;
	
	// 요청 횟수
	private int requestCount;
}

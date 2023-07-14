package com.project.myapp.flight.model;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Schedule {
	private int scheduleId;
	private int airlineId;
	
	private String departmentNation;
	private String arrivalNation;
	
	private Date departmentDate;
	private Date arrivalDate;
	
	private Timestamp departmentTime;
	private Timestamp arrivalTime;
	private int flightTime;
	
	private int firstClassFare;
	private int firstClassRemain;
	
	private int businessClassFare;
	private int businessClassRemain;
	
	private int economyClassFare;
	private int economyClassRemain;
	
	private Timestamp createdAt;
	private Timestamp updatedAt;
	
	// Airline Table
	private String name;
	private String airplaneTypeName;
	private String image;
	
	// Check Person Count
	private int person;
	
	// 페이징 처리
	private int page;
	
	// Grade
	private int grade;
}

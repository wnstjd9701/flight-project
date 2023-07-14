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
}

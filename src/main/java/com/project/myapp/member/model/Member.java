package com.project.myapp.member.model;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Member {
	

	private String memberId;
	private String password;
	private String password2;
	private String newPassword;


	private String name;
	private String firstName;
	private String lastName;
	
	private String phoneNumber;
	private Date birthday;
	private String address;
	private String email;
	private String gender;

	private int isAdmin;
	private int isDeleted;

	private Timestamp createdAt;
	private Timestamp updatedAt;
	
	
	//join테이블
	private String reservationId;
	
	private String airlineName;
	
	private String departmentNation;
	private String arrivalNation;
	
	private Date departmentDate;
	private Date arrivalDate;
	
	private String departmentTime;
	private String arrivalTime;
	
	private int seatType;
	private int ticketType;
	
	private String reservationStatus;
	
	private int totalPrice;

	
}

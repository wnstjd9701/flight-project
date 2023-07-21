package com.project.myapp.flight.model;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Ticket {
	private int ticketId;
	private String memberId;
	private String reservationId;
	
	private int scheduleId;
	private int scheduleIdToGo;
	private int scheduleIdToCome;
	
	private String name;
	private String firstName;
	private String lastName;
	private String phoneNumber;
	private Date birthday;
	private String passportNumber;
	private Date passportExpiryDate;
	
	private int seatType;
	private int ticketType;
	
	private int fare;
	private int fareToGo;
	private int fareToCome;
	
	private int totalPrice;
	
	private Timestamp createdAt;
	private Timestamp updatedAt;
	
	// 예약 상태
	private String reservationStatus;
}

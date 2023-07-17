package com.project.myapp.flight.model;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Ticket {
	private int ticketId;
	private String memberId;
	private int scheduleId;
	private int reservationId;
	
	private String name;
	private String firstName;
	private String lastName;
	private String phoneNumber;
	private Date birthday;
	private String passportNumber;
	private Date passport_expiry_date;
	
	private String seatType;
	private int ticketType;
	private int fare;
	private int totalPrice;
	
	private Timestamp createdAt;
	private Timestamp updatedAt;
	
}

package com.project.myapp.flight.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Payment {
	private int paymentId;
	private int ticketId;
	private int method;
	private Timestamp createdAt;
	private Timestamp updatedAt;
}

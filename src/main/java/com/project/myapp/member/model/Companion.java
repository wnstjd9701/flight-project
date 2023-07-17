package com.project.myapp.member.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Companion {
	private int companionId;
	private String memberId;
	private String name;
	private String firstName;
	private String lastName;
	private String phoneNumber;
	private Date birthday;
	private String passportNumber;
	private Date passportExpiryDate;
}

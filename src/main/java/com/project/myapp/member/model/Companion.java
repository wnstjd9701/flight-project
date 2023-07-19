package com.project.myapp.member.model;

import java.sql.Date;

import javax.validation.constraints.Pattern;

import lombok.Data;

@Data
public class Companion {
	private int companionId;
	private String memberId;
	
	private String name;
	private String firstName;
	private String lastName;
	private String phoneNumber;
	
	@Pattern(regexp="[0-9]+")
	private Date birthday;
	private String passportNumber;
	private Date passportExpiryDate;
}

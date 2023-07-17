package com.project.myapp.member.model;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class Member {

	private String memberId;
	private String password;

	private String name;
	private String firstName;
	private String lastName;

	private String phoneNumber;
	private Date birthday;
	private String address;
	private String email;
	private String gender;

	private String passportNumber;
	private Date passportExpiryDate;

	private int isAdmin;
	private int isDelete;

	private Timestamp createdAt;
	private Timestamp updatedAt;

	
}

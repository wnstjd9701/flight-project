package com.project.myapp.flight.model;

import lombok.Data;

@Data
public class Airline {
	private int airlineId;
	private String name;
	private int airplaneTypeId;
	private String airplaneTypeName;
	private String image;
	
	private int firstClass;
	private int businessClass;
	private int economyClass;
}

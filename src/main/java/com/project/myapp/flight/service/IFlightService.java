package com.project.myapp.flight.service;

import java.sql.Date;
import java.util.List;

import com.project.myapp.flight.model.Schedule;

public interface IFlightService {
	List<Schedule> getFlightScheduleToGoByGrade(Schedule schedule, int grade);
	List<Schedule> getFlightScheduleToComeByGrade(Schedule schedule, int grade);
	
}

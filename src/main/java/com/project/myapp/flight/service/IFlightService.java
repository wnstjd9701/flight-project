package com.project.myapp.flight.service;

import java.sql.Date;
import java.util.List;

import com.project.myapp.flight.model.Schedule;

public interface IFlightService {
	List<Schedule> getFlightScheduleByGrade(Schedule schedule, int grade);
}

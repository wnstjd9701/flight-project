package com.project.myapp.flight.dao;

import java.util.List;

import com.project.myapp.flight.model.Schedule;

public interface IFlightRepository {
	// 클래스 별 스케줄 조회
	List<Schedule> getEconomyClassSchedule(Schedule schedule);
	List<Schedule> getBusinessClassSchedule(Schedule schedule);
	List<Schedule> getFirstClassSchedule(Schedule schedule);
	
}

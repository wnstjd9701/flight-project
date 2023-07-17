package com.project.myapp.flight.dao;

import java.util.List;

import com.project.myapp.flight.model.Schedule;

public interface IFlightRepository {
	// 클래스 별 스케줄 조회
	// 가는 항공편 조회
	List<Schedule> getEconomyClassScheduleToGo(Schedule schedule);
	List<Schedule> getBusinessClassScheduleToGo(Schedule schedule);
	List<Schedule> getFirstClassScheduleToGo(Schedule schedule);

	// 오는 항공편 조회
	List<Schedule> getEconomyClassScheduleToCome(Schedule schedule);
	List<Schedule> getBusinessClassScheduleToCome(Schedule schedule);
	List<Schedule> getFirstClassScheduleToCome(Schedule schedule);
}

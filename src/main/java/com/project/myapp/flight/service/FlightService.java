package com.project.myapp.flight.service;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.project.myapp.flight.dao.IFlightRepository;
import com.project.myapp.flight.model.Schedule;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FlightService implements IFlightService {
	
	private final IFlightRepository flightRepository;

	// 가는편 좌석 등급 별 스케줄 조회
	@Override
	public List<Schedule> getFlightScheduleToGoByGrade(Schedule schedule, int grade) {
		if(grade == 1) {
			return flightRepository.getEconomyClassScheduleToGo(schedule);
		}else if(grade == 2) {
			return flightRepository.getBusinessClassScheduleToGo(schedule);
		}else {
			return flightRepository.getFirstClassScheduleToGo(schedule);
		}
	}
	
	// 오는편 좌석 등급 별 스케줄 조회
	@Override
	public List<Schedule> getFlightScheduleToComeByGrade(Schedule schedule, int grade) {
		if(grade == 1) {
			return flightRepository.getEconomyClassScheduleToCome(schedule);
		}else if(grade == 2) {
			return flightRepository.getBusinessClassScheduleToCome(schedule);
		}else {
			return flightRepository.getFirstClassScheduleToCome(schedule);
		}
	}
}

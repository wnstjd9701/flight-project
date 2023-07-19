package com.project.myapp.flight.service;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.project.myapp.flight.dao.IFlightRepository;
import com.project.myapp.flight.model.Schedule;
import com.project.myapp.member.model.Companion;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FlightService implements IFlightService {
	
	private final IFlightRepository flightRepository;

	// 좌석 등급 별 스케줄 조회
	@Override
	public List<Schedule> getFlightScheduleByGrade(Schedule schedule, int grade) {
		if(grade == 1) {
			return flightRepository.getEconomyClassSchedule(schedule);
		}else if(grade == 2) {
			return flightRepository.getBusinessClassSchedule(schedule);
		}else {
			return flightRepository.getFirstClassSchedule(schedule);
		}
	}

	// 스케줄 아이디로 스케줄 조회
	@Override
	public Schedule getScheduleByScheduleId(int scheduleId) {
		return flightRepository.getScheduleByScheduleId(scheduleId);
	}

	// 멤버 아이디와 동승자 이름으로 등록되어 있는 탑승객 정보 조회
	@Override
	public Companion getMemberCompanionByName(String memberId, String name) {
		return flightRepository.getMemberCompanionByName(memberId, name);
	}

	// 탑승객 정보 입력
	@Override
	public int insertPassengerInformation(Companion companion) {
		return flightRepository.insertPassengerInformation(companion);
	}

	

	
}

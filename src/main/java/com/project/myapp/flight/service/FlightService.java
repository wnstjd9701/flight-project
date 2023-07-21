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
		}else if(grade == 3){
			return flightRepository.getFirstClassSchedule(schedule);
		}
		return null;
	}

	// 스케줄 아이디로 스케줄 조회
	@Override
	public Schedule getScheduleByScheduleId(int scheduleId) {
		return flightRepository.getScheduleByScheduleId(scheduleId);
	}

	// 탑승객 정보 입력
	@Override
	public int insertPassengerInformation(Companion companion) {
		return flightRepository.insertPassengerInformation(companion);
	}
	
	// 예약중인 좌석 업데이트
	@Override
	public int updateRemainSeatByScheduleId(int scheduleId, int remainSeat, int grade) {
		if(grade == 1) {
			return flightRepository.updateEconomyRemainSeatByScheduleId(scheduleId, remainSeat);
		}else if(grade == 2) {
			return flightRepository.updateBusinessRemainSeatByScheduleId(scheduleId, remainSeat);
		}else {
			return flightRepository.updateFirstRemainSeatByScheduleId(scheduleId, remainSeat);
		}
	}

}

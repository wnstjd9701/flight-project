package com.project.myapp.flight.service;

import java.sql.Date;
import java.util.List;

import com.project.myapp.flight.model.Schedule;
import com.project.myapp.member.model.Companion;

public interface IFlightService {
	List<Schedule> getFlightScheduleByGrade(Schedule schedule, int grade); // 좌석 등급별 스케줄 조회
	
	Schedule getScheduleByScheduleId(int scheduleIdToGo); // 스케줄 아이디로 선택한 스케줄 조회 
	
	int insertPassengerInformation(Companion companion); // 탑승객 정보 입력
	
	int updateRemainSeatByScheduleId(int scheduleId, int person, int grade); // 예약중인 좌석 업데이트 

}

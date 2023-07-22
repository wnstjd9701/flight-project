package com.project.myapp.flight.service;

import java.sql.Date;
import java.util.List;

import com.project.myapp.flight.model.Schedule;
import com.project.myapp.flight.model.Search;
import com.project.myapp.flight.model.Ticket;
import com.project.myapp.member.model.Companion;

public interface IFlightService {
	List<Schedule> getFlightScheduleByGrade(Search search); // 좌석 등급별 스케줄 조회
	
	Schedule getScheduleByScheduleId(int scheduleIdToGo); // 스케줄 아이디로 선택한 스케줄 조회 
	
	String generateReservationId(); // 예약 번호 생성 메서드
	int insertPassengerInformation(Ticket passenger); // 탑승객 정보 입력
	
	int updateRemainSeatByScheduleId(int scheduleId, int person, int grade); // 예약중인 좌석 업데이트 
	
	String getTimeDetail(int flightTime); // 분 -> 시간으로 바꾸는 메서드

	int getRemainSeatByGrade(int scheduleIdToGo, int grade); // 남은 좌석 구하는 메서드

	int checkReservationId(String reservationId); // 예약이 존재하는지 확인하는 메서드

}

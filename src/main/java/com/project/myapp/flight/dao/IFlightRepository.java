package com.project.myapp.flight.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.myapp.flight.model.Schedule;
import com.project.myapp.flight.model.Search;
import com.project.myapp.flight.model.Ticket;
import com.project.myapp.member.model.Companion;

public interface IFlightRepository {
	// 클래스 별 스케줄 조회
	List<Schedule> getEconomyClassSchedule(Search search);
	List<Schedule> getBusinessClassSchedule(Search search);
	List<Schedule> getFirstClassSchedule(Search search);

	// 스케줄 아이디로 스케줄 조회
	Schedule getScheduleByScheduleId(int scheduleId);
	
	// 탑승객 정보 입력
	int insertPassengerInformation(Ticket passenger);
	
	// 예약중인 좌석 업데이트 
	int updateEconomyRemainSeatByScheduleId(@Param("scheduleId") int scheduleId,@Param("remainSeat") int remainSeat); 
	int updateBusinessRemainSeatByScheduleId(@Param("scheduleId") int scheduleId,@Param("remainSeat") int remainSeat);
	int updateFirstRemainSeatByScheduleId(@Param("scheduleId") int scheduleId,@Param("remainSeat") int remainSeat);
	
	// 좌석이 존재하는지 체크
	int getEconomyRemainSeat(int scheduleId);
	int getBusinessRemainSeat(int scheduleId);
	int getFirstRemainSeat(int scheduleId);
	
	// 예약이 존재하는지 체크
	int checkReservationIsExists(String reservationId);
	
	// 예약 상태 변경
	int	updateReservationStatusByReservationId(String reservationId);

}

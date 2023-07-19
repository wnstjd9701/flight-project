package com.project.myapp.flight.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.myapp.flight.model.Schedule;
import com.project.myapp.member.model.Companion;

public interface IFlightRepository {
	// 클래스 별 스케줄 조회
	List<Schedule> getEconomyClassSchedule(Schedule schedule);
	List<Schedule> getBusinessClassSchedule(Schedule schedule);
	List<Schedule> getFirstClassSchedule(Schedule schedule);

	// 스케줄 아이디로 스케줄 조회
	Schedule getScheduleByScheduleId(int scheduleId);
	
	// 멤버 아이디와 동승자 이름으로 등록되어 있는 탑승객 정보 조회
	Companion getMemberCompanionByName(@Param("memberId") String memberId,@Param("name") String name);
	
	// 탑승객 정보 입력
	int insertPassengerInformation(Companion companion); 
	
}

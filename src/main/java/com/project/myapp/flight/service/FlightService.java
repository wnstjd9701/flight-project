package com.project.myapp.flight.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.myapp.flight.controller.FlightController;
import com.project.myapp.flight.dao.IFlightRepository;
import com.project.myapp.flight.model.Schedule;
import com.project.myapp.flight.model.Search;
import com.project.myapp.flight.model.Ticket;
import com.project.myapp.member.model.Companion;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FlightService implements IFlightService {
	
	static final Logger logger = LoggerFactory.getLogger(FlightController.class);
	
	private final IFlightRepository flightRepository;

	// 좌석 등급 별 스케줄 조회
	@Override
	public List<Schedule> getFlightScheduleByGrade(Search search) {
		if(search.getGrade() == 1) {
			return flightRepository.getEconomyClassSchedule(search);
		}else if(search.getGrade() == 2) {
			return flightRepository.getBusinessClassSchedule(search);
		}else if(search.getGrade() == 3){
			return flightRepository.getFirstClassSchedule(search);
		}else {
			throw new IllegalArgumentException("Invalid Grade: " + search.getGrade());
		}
	}

	// 스케줄 아이디로 스케줄 조회
	@Override
	public Schedule getScheduleByScheduleId(int scheduleId) {
		return flightRepository.getScheduleByScheduleId(scheduleId);
	}

	/* 
	 * 예약 번호 생성
	 * UUID를 통해 고유한 식별 번호
	 */
	@Override
	public String generateReservationId() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String currentDate = dateFormat.format(new java.util.Date());

        // UUID 생성
        UUID uuid = UUID.randomUUID();
        String uuidString = uuid.toString().replaceAll("-", "");

        // 예약 번호 생성
        String reservationNumber = "F" + currentDate + "-" + uuidString.substring(0, 6);

        return reservationNumber;
	}
	// 탑승객 정보 입력
	@Override
	@Transactional
	public int insertPassengerInformation(Ticket passenger) {
		
		passenger.setScheduleId(passenger.getScheduleIdToGo());
		passenger.setFare(passenger.getFareToGo());
		
		// 가는편 항공권 등록
		logger.info("Passenger: " + passenger.toString());
		int resultToGo = flightRepository.insertPassengerInformation(passenger);
		int resultToCome = 0;
		
		// 가는편이 등록되었으면 오는편 항공권 등록
		if(resultToGo >= 1) {
			passenger.setScheduleId(passenger.getScheduleIdToCome());
			passenger.setFare(passenger.getFareToCome());
			resultToCome = flightRepository.insertPassengerInformation(passenger);
		}
		int result = resultToGo + resultToCome;
		return result;
	}
	
	// 시간 변경 메서드
	@Override
	public String getTimeDetail(int flightTime) {
		int time = flightTime;
		int hours = time / 60;
		int minutes = time % 60;
		String detailTime = Integer.toString(hours) + "시간 " + Integer.toString(minutes) + "분";
		return detailTime;
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
	
	// 등급별 남은 좌석 확인 
	@Override
	public int getRemainSeatByGrade(int scheduleId, int grade) {
		if(grade == 1) {
			return flightRepository.getEconomyRemainSeat(scheduleId);
		}else if(grade == 2) {
			return flightRepository.getBusinessRemainSeat(scheduleId);
		}else if(grade == 3) {
			return flightRepository.getFirstRemainSeat(scheduleId);
		}
		return 0;
	}

	// 예약이 존재하는지 확인하는 메서드
	@Override
	public int checkReservationId(String reservationId) {
		return flightRepository.checkReservationIsExists(reservationId);
	}

}

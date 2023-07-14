package com.project.myapp.flight.controller;

import java.sql.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.myapp.flight.model.Schedule;
import com.project.myapp.flight.service.IFlightService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FlightController {
	
	static final Logger logger = LoggerFactory.getLogger(FlightController.class);
	
	private final IFlightService flightService;
	
	/*
	 *  URL: /flight/ticket/search/{nation}/{departmentDate}/{arrivalDate}?person=2&grade=1&page=1
	 *  API No: 13
	 *  Method: POST
	 *  Information: 항공권 검색 (기본: 가격순), Date 형식: 2023-07-14, grade 1.이코노미  2.비즈니스  3.퍼스트 
	 *  Response: flightSchedule(스케줄 리스트)
	*/
	@PostMapping("/flight/ticket/search/{nation}/{departmentDate}/{arrivalDate}")
	public String searchTicket(@PathVariable("nation") String nation, 
			@PathVariable("departmentDate") Date departmentDate, 
			@PathVariable("arrivalDate") Date arrivalDate, 
			@RequestParam(value="person", required=true) int person,
			@RequestParam(value="grade", required=true) int grade, 
			@RequestParam(value="page", required=true) int page, Model model) {
			
		Schedule schedule = new Schedule();
		
		schedule.setDepartmentNation("ICN");
		schedule.setArrivalNation(nation);
		schedule.setDepartmentDate(departmentDate);
		schedule.setArrivalDate(arrivalDate);
		schedule.setPerson(person);
		schedule.setGrade(grade);
		schedule.setPage(page);
		
		List<Schedule> flightSchedule = flightService.getFlightScheduleByGrade(schedule, grade);

		model.addAttribute("flightSchedule", flightSchedule);
		
		return "/ticket/search";
	}
	
	/*
	 * API No: 14
	 * Method: POST
	 * Information: 항공권 예매
	 */
	@PostMapping("/flight/ticket/reservation")
	public String reserveTicket(Model model) {
		return "/ticket/reservation";
	}
	
	/* view-controller path="/flight/ticket/cancel" view-name="" 추가 하기
	 * API No: 15
	 * Method: POST
	 * Information: 예약 취소
	*/ 
	@PostMapping("/flight/ticket/cancel")
	public String ticketReservationCancel(Model model) {
		return "/ticket/cancel";
	}
	/*
	 * API No: 16
	 * Method: POST
	 * Information: 탑승자 정보 입력
	 */
	@PostMapping("/flight/passengers/insert")
	public String insertPassengers(Model model) {
		return "/passengers/insert";
	}
	
	/*
	 * API No: 17
	 * Method: POST
	 * Information: 항공권 결제
	 */
	@PostMapping("/flight/ticket/pay")
	public String ticketPayment(Model model) {
		return "/ticket/pay/confirm";
	}
	
}

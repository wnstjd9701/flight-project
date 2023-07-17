package com.project.myapp.flight.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
	
	/*	/flight/ticket/search/JP/20230717/20230720?person=2&grade=1&page=1
	 *  URL: /flight/ticket/search/{nation}/{departmentDate}/{arrivalDate}?person=2&grade=1&page=1
	 *  API No: 13
	 *  Method: POST
	 *  Information: 항공권 검색 (기본: 가격순), Date 형식: 2023-07-14, grade 1.이코노미  2.비즈니스  3.퍼스트 
	 *  Response: flightSchedule(스케줄 리스트)
	*/
	@GetMapping("/flight/ticket/search/{nation}/{departmentDate}/{arrivalDate}")
	public String searchTicket(@PathVariable("nation") String nation, 
			@PathVariable("departmentDate") String departmentDate, 
			@PathVariable("arrivalDate") String arrivalDate, 
			@RequestParam(value="person", required=true) int person,
			@RequestParam(value="grade", required=true) int grade, 
			@RequestParam(value="page", required=true) int page,
			Model model) {
		
		logger.info("nation:" + nation + " departmentDate:" + departmentDate + " arrivalDate:" + arrivalDate + " person:" + person + " grade:" + grade + " page:" + page);
		
		Schedule scheduleToGo = new Schedule();
		Schedule scheduleToCome = new Schedule();
		
		try {
			SimpleDateFormat beforeDepartmentDateFormat = new SimpleDateFormat("yyyymmdd");
			SimpleDateFormat afterDepartmentDateFormat = new SimpleDateFormat("yyyy-mm-dd");
			
			SimpleDateFormat beforeArrivalDateFormat = new SimpleDateFormat("yyyymmdd");
			SimpleDateFormat afterArrivalDateFormat = new SimpleDateFormat("yyyy-mm-dd");
			
			java.util.Date tempDepartmentDate = null;
			tempDepartmentDate = beforeDepartmentDateFormat.parse(departmentDate);
			String transDepartmentDate = afterDepartmentDateFormat.format(tempDepartmentDate);
			Date departmentDateFormat = Date.valueOf(transDepartmentDate);
			
			java.util.Date tempArrivalDate = null;
			tempArrivalDate = beforeArrivalDateFormat.parse(arrivalDate);
			String transArrivalDate = afterArrivalDateFormat.format(tempArrivalDate);
			Date arrivalDateFormat = Date.valueOf(transArrivalDate);
			
			scheduleToGo.setDepartmentNation("ICN");
			scheduleToGo.setArrivalNation(nation);
			scheduleToGo.setDepartmentDate(departmentDateFormat);
			scheduleToGo.setPerson(person);
			scheduleToGo.setGrade(grade);
			scheduleToGo.setPage(page*10);
			
			scheduleToCome.setDepartmentNation(nation);
			scheduleToCome.setArrivalNation("ICN");
			scheduleToCome.setDepartmentDate(arrivalDateFormat);
			scheduleToCome.setPerson(person);
			scheduleToCome.setGrade(grade);
			scheduleToCome.setPage(page*10);
			
			List<Schedule> flightScheduleToGo = flightService.getFlightScheduleToGoByGrade(scheduleToGo, grade);
			int goListCount = flightScheduleToGo.size();
			model.addAttribute("flightScheduleToGo", flightScheduleToGo);
			model.addAttribute("goListCount", goListCount);
			
			List<Schedule> flightScheduleToCome = flightService.getFlightScheduleToComeByGrade(scheduleToCome, grade);
			int comeListCount = flightScheduleToCome.size();
			
			model.addAttribute("flightScheduleToCome", flightScheduleToCome);
			
			model.addAttribute("comeListCount", comeListCount);
			model.addAttribute("grade", grade);
			model.addAttribute("person", person);
		
		}catch (ParseException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "flight/search";
	}
	
	/*
	 * API No: 14
	 * Method: POST
	 * Information: 항공권 예매
	 */
	@PostMapping("/flight/ticket/reservation")
	public String reserveTicket(Schedule schedule, Model model) {
		logger.info("Schedele: " + schedule.toString());
		return "/flight/reservation";
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

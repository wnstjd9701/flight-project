package com.project.myapp.flight.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.myapp.flight.model.Schedule;
import com.project.myapp.flight.service.IFlightService;
import com.project.myapp.member.model.Companion;

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
			Model model, HttpSession session) {
		
		logger.info("nation:" + nation + " departmentDate:" + departmentDate + " arrivalDate:" + arrivalDate + 
				" person:" + person + " grade:" + grade + " page:" + page);
		
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
			
			List<Schedule> flightScheduleToGo = flightService.getFlightScheduleByGrade(scheduleToGo, grade);
			int goListCount = flightScheduleToGo.size();
			model.addAttribute("flightScheduleToGo", flightScheduleToGo);
			model.addAttribute("goListCount", goListCount);
			
			scheduleToCome.setDepartmentNation(nation);
			scheduleToCome.setArrivalNation("ICN");
			scheduleToCome.setDepartmentDate(arrivalDateFormat);
			scheduleToCome.setPerson(person);
			scheduleToCome.setGrade(grade);
			scheduleToCome.setPage(page*10);
			
			List<Schedule> flightScheduleToCome = flightService.getFlightScheduleByGrade(scheduleToCome, grade);
			int comeListCount = flightScheduleToCome.size();
			model.addAttribute("flightScheduleToCome", flightScheduleToCome);
			model.addAttribute("comeListCount", comeListCount);
			
			session.setAttribute("grade", grade);
			session.setAttribute("person", person);
		
		}catch (ParseException e) {
			throw new RuntimeException(e);
		}
		return "flight/search";
	}
	
	/*
	 * API No: 14
	 * Method: GET
	 * Information: 항공권 선택
	 * 스케줄 아이디를 가지고 해당 스케줄 조회
	 */
	@GetMapping("/flight/ticket/select")
	public String reserveTicket(String scheduleIdList, Model model, HttpSession session) {
//		String memberId = (String) session.getAttribute("memberId");
		
		String[] scheduleIdLists = scheduleIdList.split(",");
		int scheduleIdToGo = Integer.parseInt(scheduleIdLists[0]);
		int scheduleIdToCome = Integer.parseInt(scheduleIdLists[1]);
		
		Schedule scheduleToGo = flightService.getScheduleByScheduleId(scheduleIdToGo);
		Schedule scheduleToCome = flightService.getScheduleByScheduleId(scheduleIdToCome);
		
		session.setAttribute("scheduleIdToGo", scheduleIdToGo);
		session.setAttribute("scheduleIdToCome", scheduleToCome);
		
		session.setAttribute("flightScheduleToGo", scheduleToGo);
		session.setAttribute("flightScheduleToCome", scheduleToCome);
		
		return "flight/reservation";
	}
	
	/* view-controller path="/flight/ticket/cancel" view-name="" 추가 하기
	 * API No: 15
	 * Method: POST
	 * Information: 예약 취소
	*/ 
	@PostMapping("/flight/ticket/cancel")
	public String ticketReservationCancel(Model model) {
		return "ticket/cancel";
	}
	
	/*
	 * API No: 16
	 * Method: POST
	 * Information: 탑승자 정보 입력
	 */
	@PostMapping("/flight/ticket/insert")
	public String insertTicket(@RequestParam("name") ArrayList<String> names,
            @RequestParam("firstName") List<String> firstNames,
            @RequestParam("lastName") List<String> lastNames,
            @RequestParam("phoneNumber") List<String> phoneNumbers,
            @RequestParam("birthday") List<String> birthdays,
            @RequestParam("passportNumber") List<String> passportNumbers,
            @RequestParam("passportExpiryDate") List<String> passportExpiryDates, HttpSession session) {
		try {
			int personCount = (Integer) session.getAttribute("person");
			String memberId = (String) session.getAttribute("memberId");
			ArrayList<Companion> companionList = new ArrayList<Companion>();
			for(int i=0; i<personCount; i++) {
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Companion companion = new Companion();
				companion.setMemberId(memberId);
				companion.setName(names.get(i));
				companion.setFirstName(firstNames.get(i));
				companion.setLastName(lastNames.get(i));
				companion.setPhoneNumber(phoneNumbers.get(i));
				
				java.util.Date utilbirthday = dateFormat.parse(birthdays.get(i));
				Date sqlbirthday = new Date(utilbirthday.getTime());
				companion.setBirthday(sqlbirthday);
				
				companion.setPassportNumber(passportNumbers.get(i));
		
				java.util.Date utilpassportExpiryDate = dateFormat.parse(passportExpiryDates.get(i));
				Date sqlpassportExpiryDate = new Date(utilpassportExpiryDate.getTime());
				companion.setPassportExpiryDate(sqlpassportExpiryDate);
			
				logger.info("Companion: " + companion.toString());
				companionList.add(companion);
			}
			
			session.setAttribute("passengersList", companionList);
			
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
		return "redirect:/flight/payment";
	}
	
	/*
	 * API No: 18
	 * Method: Get
	 * Infromation: 등록된 탑승자 정보 가져오기 (Ajax 요청) 
	 */
	@GetMapping("/flight/companion")
	public Companion getCompanionList(@RequestParam("name") String name, HttpSession session, Model model) {
//		String memberId = (String) session.getAttribute("memberId");
		logger.info("SelectedName: " + name);
		String memberId = "wh4679";
		Companion companion = flightService.getMemberCompanionByName(memberId, name);
		logger.info("Companion: " + companion.toString());
		return companion;
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

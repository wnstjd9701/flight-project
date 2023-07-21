package com.project.myapp.flight.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	// iamport 결제를 위한 imp 번호
	@Value("#{impNumber[impnumber]}")
	private String impNumber;
	
	/*	/flight/ticket/search/JP/20230717/20230720?person=2&grade=1&page=1
	 *  URL: /flight/ticket/search/{nation}/{departmentDate}/{arrivalDate}?person=2&grade=1&page=1
	 *  API No: 13
	 *  Method: POST
	 *  Information: 항공권 검색 (기본: 가격순), Date 형식: 2023-07-14, grade 1.이코노미  2.비즈니스  3.퍼스트 
	 *  Response: flightSchedule(스케줄 리스트)
	*/
	@RequestMapping("/flight/ticket/search/{nation}/{departmentDate}/{arrivalDate}")
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
			
			for(int i=0; i<goListCount; i++) {
				int time = flightScheduleToGo.get(i).getFlightTime();
				int hours = time / 60;
				int minutes = time % 60;
				String detailTime = Integer.toString(hours) + "시간 " + Integer.toString(minutes) + "분"; 
				flightScheduleToGo.get(i).setFlightTimeDetail(detailTime);
			}
			
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
			
			for(int i=0; i<comeListCount; i++) {
				int time = flightScheduleToCome.get(i).getFlightTime();
				int hours = time / 60;
				int minutes = time % 60;
				String detailTime = Integer.toString(hours) + "시간 " + Integer.toString(minutes) + "분"; 
				flightScheduleToCome.get(i).setFlightTimeDetail(detailTime);
			}
			
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
	@Transactional
	public String reserveTicket(String scheduleIdList, Model model, HttpSession session) {
//		String memberId = (String) session.getAttribute("memberId");
		int person = Integer.parseInt(session.getAttribute("person").toString());
		
		int grade = Integer.parseInt(session.getAttribute("grade").toString());
		
		String[] scheduleIdLists = scheduleIdList.split(",");
		int scheduleIdToGo = Integer.parseInt(scheduleIdLists[0]);
		int scheduleIdToCome = Integer.parseInt(scheduleIdLists[1]);
		
		Schedule scheduleToGo = flightService.getScheduleByScheduleId(scheduleIdToGo);
		Schedule scheduleToCome = flightService.getScheduleByScheduleId(scheduleIdToCome);
		
		int time = scheduleToGo.getFlightTime();
		int hours = time / 60;
		int minutes = time % 60;
		String detailTimeToGo = Integer.toString(hours) + "시간 " + Integer.toString(minutes) + "분";
		scheduleToGo.setFlightTimeDetail(detailTimeToGo);
		
		time = scheduleToCome.getFlightTime();
		hours = time / 60;
		minutes = time % 60;
		String detailTimeToCome = Integer.toString(hours) + "시간 " + Integer.toString(minutes) + "분";
		scheduleToCome.setFlightTimeDetail(detailTimeToCome);
		
		int remainSeatToGo = 0;
		int remainSeatToCome = 0;
		
		if(grade == 1) {
			session.setAttribute("totalPrice", (scheduleToGo.getEconomyClassFare()+ scheduleToCome.getEconomyClassFare()) * person);
			remainSeatToGo = scheduleToGo.getEconomyClassRemain();
			remainSeatToCome = scheduleToCome.getEconomyClassRemain();
			logger.info("scheduleToGo: " + scheduleToGo.toString());
		}else if(grade == 2) {
			session.setAttribute("totalPrice",  (scheduleToGo.getBusinessClassFare() + scheduleToCome.getBusinessClassFare()) * person);
			remainSeatToGo = scheduleToGo.getBusinessClassRemain();
			remainSeatToCome = scheduleToCome.getBusinessClassRemain();
			logger.info("scheduleToGo: " + scheduleToGo.toString());
		}else if(grade == 3) {
			session.setAttribute("totalPrice",  (scheduleToGo.getFirstClassFare() + scheduleToCome.getFirstClassFare()) * person);
			remainSeatToGo = scheduleToGo.getFirstClassRemain();
			remainSeatToCome = scheduleToCome.getFirstClassRemain();
			logger.info("scheduleToGo: " + scheduleToGo.toString());
		}
		
		if(remainSeatToGo < person || remainSeatToCome < person) {
			return "redirect:/flight/ticket/search/" + scheduleToGo.getArrivalNation() + "/" + scheduleToGo.getDepartmentDate() + "/" + scheduleToCome.getDepartmentDate() 
				+ "?person=" + person + "&grade=" + grade + "&page=" + 1;
		}
		
		remainSeatToGo = remainSeatToGo - person;
		remainSeatToCome = remainSeatToCome - person;
		logger.info("scheduleToGoRemain: " + remainSeatToGo);
		logger.info("scheduleToComeRemain: " + remainSeatToCome);
		
		int resultToGo = flightService.updateRemainSeatByScheduleId(scheduleToGo.getScheduleId(), remainSeatToGo, grade);
		int resultToCome = flightService.updateRemainSeatByScheduleId(scheduleToCome.getScheduleId(), remainSeatToCome, grade);
		
		logger.info("가는편 좌석 예약중: " + resultToGo);
		logger.info("오는편 좌석 예약중: " + resultToCome);
		
		session.setAttribute("scheduleIdToGo", scheduleIdToGo);
		session.setAttribute("scheduleIdToCome", scheduleIdToCome);
		
		session.setAttribute("flightScheduleToGo", scheduleToGo);
		session.setAttribute("flightScheduleToCome", scheduleToCome);
		
		session.setAttribute("impNumber", impNumber);
		
		return "flight/reservation";
	}
	
	/*
	 * API No: 16
	 * Method: POST
	 * Information: 선택한 항공권 결제 및 예약 정보 입력
	 */
	@PostMapping("/flight/ticket/insert")
	public String insertTicket(@RequestParam("name") List<String> names,
            @RequestParam("firstName") List<String> firstNames,
            @RequestParam("lastName") List<String> lastNames,
            @RequestParam("phoneNumber") List<String> phoneNumbers,
            @RequestParam("birthday") List<String> birthdays,
            @RequestParam("passportNumber") List<String> passportNumbers,
            @RequestParam("passportExpiryDate") List<String> passportExpiryDates, 
            Model model, HttpSession session) {
		
		
		Schedule scheduleToGo = (Schedule) session.getAttribute("flightScheduleToGo");
		Schedule scheduleToCome = (Schedule) session.getAttribute("flightScheduleToCome");
		logger.info("scheduleToGo: " + scheduleToGo.toString());
		
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
			logger.info("companionList: " + companionList.toString());
			session.setAttribute("passengersList", companionList);
			
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
		return "redirect:/flight/payment";
	}
	
	/*
	 * API No: 18
	 * Method: Get
	 * Information: 등록된 탑승자 정보 가져오기 (Ajax 요청) 
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
	@GetMapping("/flight/ticket/test")
	@ResponseBody
	public String ticketPayment() {
		logger.info("Test");
		boolean status = true;
		if(status) {
			return "redirect:/home";
		}else {
			return "redirect:/home";
		}
	}
	
}

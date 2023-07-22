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
import org.springframework.http.HttpStatus;
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
import com.project.myapp.flight.model.Search;
import com.project.myapp.flight.model.Ticket;
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
	 *  URL: /flight/ticket/search?nation=ICN&departmentDate=2023-07-20&arrivalDate=2023-07-25&person=2&grade=1&page=1
	 *  API No: 13
	 *  Method: GET
	 *  Information: 항공권 검색 (기본: 가격순), Date 형식: 2023-07-14, grade 1.이코노미  2.비즈니스  3.퍼스트 
	 *  Response: flightSchedule(스케줄 리스트)
	*/
	@RequestMapping("/flight/ticket/search")
	public String searchTicket(Search search, Model model, HttpSession session) {

	    search.setDepartmentNation("ICN");
	    search.setArrivalNation(search.getNation());
	    search.setPage(search.getPage() * 10);
	    logger.info("SearchInfo: " + search.toString());
	    
	    List<Schedule> flightScheduleToGo = flightService.getFlightScheduleByGrade(search);
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
	    
	    // 돌아오는 항공권
	    search.setDepartmentNation(search.getNation());
	    search.setArrivalNation("ICN");
	    
	    Date tempDate = search.getDepartmentDate();
	    search.setDepartmentDate(search.getArrivalDate());
	    logger.info("SearchInfo: " + search.toString());
	    
	    List<Schedule> flightScheduleToCome = flightService.getFlightScheduleByGrade(search);
	    int comeListCount = flightScheduleToCome.size();
	    
	    search.setDepartmentDate(tempDate);
	    
	    for(int i=0; i<comeListCount; i++) {
	    	int time = flightScheduleToCome.get(i).getFlightTime();
	    	int hours = time / 60;
	    	int minutes = time % 60;
	    	String detailTime = Integer.toString(hours) + "시간 " + Integer.toString(minutes) + "분"; 
	    	flightScheduleToCome.get(i).setFlightTimeDetail(detailTime);
	    }
	    
	    model.addAttribute("flightScheduleToCome", flightScheduleToCome);
	    model.addAttribute("comeListCount", comeListCount);
	    
	    session.setAttribute("requestCount", 1);
	    session.setAttribute("search", search);
		
		return "flight/search";
	}
	
	/*
	 * API No: 14
	 * Method: GET
	 * Information: 항공권 선택
	 * 스케줄 아이디를 가지고 해당 스케줄 조회
	 */
	@GetMapping("/flight/ticket/select")
	public String reserveTicket(String scheduleIdList,@RequestParam("person") int person, @RequestParam("grade") int grade, Model model, HttpSession session) {
		String memberId = (String) session.getAttribute("memberId");
		
		Search search = (Search) session.getAttribute("search");
		
		// 스케줄 선택을 하지 않거나 2개 이상 선택했을 때
		if(scheduleIdList == null || scheduleIdList.split(",").length > 2) {
			search.setPage(1);
			session.setAttribute("search", search);
			return "redirect:/flight/ticket/search?page=" + search.getPage() + "&nation=" + search.getNation() +"&departmentDate=" + search.getDepartmentDate() 
				+ "&arrivalDate=" + search.getArrivalDate() + "&person=" + search.getPerson() + "&grade=" + search.getPage();
		}
		
		String[] scheduleIdLists = scheduleIdList.split(",");
		int scheduleIdToGo = Integer.parseInt(scheduleIdLists[0]);
		int scheduleIdToCome = Integer.parseInt(scheduleIdLists[1]);
		
		logger.info("scheduleIdList: " + scheduleIdLists);
		
		Schedule scheduleToGo = flightService.getScheduleByScheduleId(scheduleIdToGo);
		Schedule scheduleToCome = flightService.getScheduleByScheduleId(scheduleIdToCome);
		
		scheduleToGo.setFlightTimeDetail(flightService.getTimeDetail(scheduleToGo.getFlightTime()));
		scheduleToCome.setFlightTimeDetail(flightService.getTimeDetail(scheduleToCome.getFlightTime()));
		
		int remainSeatToGo = 0;
		int remainSeatToCome = 0;
		
		if(grade == 1) {
			session.setAttribute("totalPrice", (scheduleToGo.getEconomyClassFare()+ scheduleToCome.getEconomyClassFare()) * person);
			remainSeatToGo = scheduleToGo.getEconomyClassRemain();
			remainSeatToCome = scheduleToCome.getEconomyClassRemain();
		}else if(grade == 2) {
			session.setAttribute("totalPrice",  (scheduleToGo.getBusinessClassFare() + scheduleToCome.getBusinessClassFare()) * person);
			remainSeatToGo = scheduleToGo.getBusinessClassRemain();
			remainSeatToCome = scheduleToCome.getBusinessClassRemain();
		}else if(grade == 3) {
			session.setAttribute("totalPrice",  (scheduleToGo.getFirstClassFare() + scheduleToCome.getFirstClassFare()) * person);
			remainSeatToGo = scheduleToGo.getFirstClassRemain();
			remainSeatToCome = scheduleToCome.getFirstClassRemain();
		}
		
		if(remainSeatToGo < person || remainSeatToCome < person) {
			return "redirect:/flight/ticket/search?nation=" + scheduleToGo.getArrivalNation() + "/departmentDate" + scheduleToGo.getDepartmentDate() + "/" + scheduleToCome.getDepartmentDate() 
				+ "?person=" + person + "&grade=" + grade + "&page=" + 1;
		}
		
		
		// 선택한 스케줄 아이디
		session.setAttribute("scheduleIdToGo", scheduleIdToGo);
		session.setAttribute("scheduleIdToCome", scheduleIdToCome);
		
		// 선택한 스케줄 정보
		session.setAttribute("selectScheduleToGo", scheduleToGo);
		session.setAttribute("selectScheduleToCome", scheduleToCome);
		
		return "flight/reservation";
	}
	
	/*
	 * API No: 16
	 * Method: POST
	 * Information: 선택한 항공권 결제 및 예약 정보 입력
	 */
	@PostMapping("/flight/ticket/insert")
	public String insertPassengersInformation(@RequestParam("name") List<String> names,
            @RequestParam("firstName") List<String> firstNames,
            @RequestParam("lastName") List<String> lastNames,
            @RequestParam("phoneNumber") List<String> phoneNumbers,
            @RequestParam("birthday") List<Date> birthdays,
            @RequestParam("passportNumber") List<String> passportNumbers,
            @RequestParam("passportExpiryDate") List<Date> passportExpiryDates, 
            @RequestParam(value="fareToGo", required = false) int fareToGo,
            @RequestParam(value="fareToCome", required = false) int fareToCome,
            HttpSession session) {
		if(session.getAttribute("scheduleIdToGo") == null || session.getAttribute("scheduleIdToCome") == null) {
			logger.info("error");
		}
		int scheduleIdToGo = Integer.parseInt(session.getAttribute("scheduleIdToGo").toString());
		int scheduleIdToCome = Integer.parseInt(session.getAttribute("scheduleIdToCome").toString());
		
		Search search = (Search) session.getAttribute("search");
		logger.info("SearchInformation: " + search.toString());
		logger.info("Select ScheduleIdToGo: " + scheduleIdToGo + "/ScheduleIdToCome: " + scheduleIdToCome);
		
		try {
			int personCount = search.getPerson();
//			String memberId = (String) session.getAttribute("memberId");
			
			ArrayList<Ticket> passengerList = new ArrayList<Ticket>();
			for(int i=0; i<personCount; i++) {
				Ticket passenger = new Ticket();
				
				passenger.setMemberId("wh4679");
				passenger.setScheduleIdToGo(scheduleIdToGo);
				passenger.setScheduleIdToCome(scheduleIdToCome);
				
				// 예약 번호 생성
				passenger.setReservationId("");
				
				passenger.setName(names.get(i));
				passenger.setFirstName(firstNames.get(i));
				passenger.setLastName(lastNames.get(i));
				passenger.setPhoneNumber(phoneNumbers.get(i));
				passenger.setBirthday(birthdays.get(i));
				passenger.setPassportNumber(passportNumbers.get(i));
				passenger.setPassportExpiryDate(passportExpiryDates.get(i));
				
				passenger.setSeatType(search.getGrade());
				
				passenger.setFareToGo(fareToGo);
				passenger.setFareToCome(fareToCome);
				
				passenger.setTotalPrice(Integer.parseInt(session.getAttribute("totalPrice").toString()));
				
				passenger.setReservationStatus("예약중");
				
				int result = flightService.insertPassengerInformation(passenger);
				
				// 입력 정보가 잘못되었을 경우 행이 등록이 안됨
				if(result < 2) {
					return "redirect:/flight/ticket/insert";
				}
				passengerList.add(passenger);
			}
			logger.info("passengerList: " + passengerList.toString());
			session.setAttribute("passengerList", passengerList);
			session.setAttribute("impNumber", impNumber);
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
		return "redirect:/flight/payment";
	}
	
	// 결제 완료 시 Update
	@GetMapping("/flight/ticket/paymentCompleted")
	public String paymentCompleted(HttpSession session) {
		
		Schedule scheduleToGo = (Schedule) session.getAttribute("scheduleToGo");
		Schedule scheduleToCome = (Schedule) session.getAttribute("scheduleToCome");
		
		Search search = (Search) session.getAttribute("search");
		
		int remainSeatToGo = 0;
		int remainSeatToCome = 0;
		int grade = search.getGrade();
		int person = search.getPerson();
		
		if(grade == 1) {
			remainSeatToGo = scheduleToGo.getEconomyClassRemain();
			remainSeatToCome = scheduleToCome.getEconomyClassRemain();
		}else if(grade == 2) {
			remainSeatToGo = scheduleToGo.getBusinessClassRemain();
			remainSeatToCome = scheduleToCome.getBusinessClassRemain();
		}else if(grade == 3) {
			remainSeatToGo = scheduleToGo.getFirstClassRemain();
			remainSeatToCome = scheduleToCome.getFirstClassRemain();
		}
		remainSeatToGo = remainSeatToGo - person;
		remainSeatToCome = remainSeatToCome - person;

		// 만약 결제 완료 
		if(remainSeatToGo <= 0 || remainSeatToCome <= 0) {
			return "redirect:/";
		}
		int reulstToGo = flightService.updateRemainSeatByScheduleId(scheduleToGo.getScheduleId(), person, grade);
		int resultToCome = flightService.updateRemainSeatByScheduleId(scheduleToCome.getScheduleId(), person, grade);
		
		return "";
	}
	
	/*
	 * API No: 
	 * Method: GET
	 * Information: 결제 버튼 클릭 시 좌석이 남아있는 지 확인
	 * 결제 버튼 클릭 시 체크 하도록 Ajax 요청
	 *  
	 */
	@GetMapping("/flight/seat/check")
	@ResponseBody
	public ResponseEntity<Boolean> checkRemainSeat(HttpSession session) {
//		String memberId = (String) session.getAttribute("memberId");
		logger.info("session: " + session);
		// 만약 세션에 scheduleId나 검색 내역이 없다면
		if(session.getAttribute("scheduleIdToGo") == null || session.getAttribute("scheduleIdToCome") == null || session.getAttribute("search") == null) {
			/* 다시 예약 하도록 
			 * 예약 상태가 있으면 삭제해주기
			 * flightService.deleteReservation(memberId, "예약중");
			 */
			logger.info("errorInIF");
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(false);
		}
		Search search = (Search) session.getAttribute("search");
		int grade = search.getGrade();
		int person = search.getPerson();
		
		int scheduleIdToGo = Integer.parseInt(session.getAttribute("scheduleIdToGo").toString());
		int scheduleIdToCome = Integer.parseInt(session.getAttribute("scheduleIdToCome").toString());
		
		int remainSeatToGo = flightService.getRemainSeatByGrade(scheduleIdToGo, grade);
		int remainSeatToCome = flightService.getRemainSeatByGrade(scheduleIdToCome, grade);
		logger.info("remainSeat:" + remainSeatToGo);
		logger.info("remainSeatToCome: " + remainSeatToCome);
		if(remainSeatToGo - person < 0 || remainSeatToCome - person < 0) {
			logger.info("errorInSeat");
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(false);
		}
		// 결제 정보와 결제 시 필요한 정보 가져오기
		if(session.getAttribute("impNumber") == null) {
			session.setAttribute("impNumber", impNumber);
		}
		session.setAttribute("merchantUid", "");
		session.setAttribute("flightName", "구매 내용");
		session.setAttribute("memberName", "구매자 이름");
		session.setAttribute("amount", 10000);
		session.setAttribute("memberEmail", "구매자 이메일");
		session.setAttribute("memberPhoneNumber", "구매자 핸드폰 번호");
		session.setAttribute("memberAddress", "구매자 주소");
		
		return ResponseEntity.ok(true);
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

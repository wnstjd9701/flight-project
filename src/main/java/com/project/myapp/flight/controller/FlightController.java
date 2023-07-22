package com.project.myapp.flight.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.Iterator;
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
		// 이전 검색 내역이 존재 할 때 다시 검색 했을 때
//		if (session.getAttribute("search") != null) {
//	        // 세션에 있는 검색 기록 삭제
//	        List<String> keysToKeep = Arrays.asList("memberId", "phoneNumber", "email");
//	        Iterator<String> attributeNames = session.getAttributeNames();
//	        while (attributeNames.hasNext()) {
//	            String attributeName = attributeNames.next();
//	            if (!keysToKeep.contains(attributeName)) {
//	                session.removeAttribute(attributeName);
//	            }
//	        }
//	    }
		
	    search.setDepartmentNation("ICN");
	    search.setArrivalNation(search.getNation());
	    search.setPage(search.getPage() * 10);
	    
	    List<Schedule> flightScheduleToGo = flightService.getFlightScheduleByGrade(search);
	    int goListCount = flightScheduleToGo.size();
//	    flightScheduleToGo.forEach(schedule -> {
//	        int time = schedule.getFlightTime();
//	        String detailTime = flightService.getTimeDetail(time);
//	        schedule.setFlightTimeDetail(detailTime);
//	    });
	    for(int i=0; i<goListCount; i++) {
	    	int time = flightScheduleToGo.get(i).getFlightTime();
	    	String detailTime = flightService.getTimeDetail(time);
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
	    	String detailTime = flightService.getTimeDetail(time);
	    	flightScheduleToCome.get(i).setFlightTimeDetail(detailTime);
	    }
	    
	    model.addAttribute("flightScheduleToCome", flightScheduleToCome);
	    model.addAttribute("comeListCount", comeListCount);
	    
	    session.setAttribute("search", search);
		
		return "flight/search";
	}
	
	/*
	 * API No: 14
	 * Method: GET
	 * Information: 항공권 선택
	 * 스케줄 아이디를 가지고 해당 스케줄 조회
	 * 인터셉터에서 잡아서 search session 확인
	 */
	@GetMapping("/flight/ticket/select")
	public String reserveTicket(String scheduleListIdToGo, String scheduleListIdToCome, @RequestParam("person") int person, @RequestParam("grade") int grade, Model model, HttpSession session) {
		String memberId = (String) session.getAttribute("memberId");
		
		Search search = (Search) session.getAttribute("search");
		
		// 스케줄 선택을 하지 않거나 2개 이상 선택했을 때
		if(scheduleListIdToGo == null || scheduleListIdToGo.length() > 2 || scheduleListIdToCome == null || scheduleListIdToCome.length() > 2) {
			search.setPage(1);
			session.setAttribute("search", search);
			return "redirect:/flight/ticket/search?page=" + search.getPage() + "&nation=" + search.getNation() +"&departmentDate=" + search.getDepartmentDate() 
				+ "&arrivalDate=" + search.getArrivalDate() + "&person=" + search.getPerson() + "&grade=" + search.getPage();
		}
		
		int scheduleIdToGo = Integer.parseInt(scheduleListIdToGo);
		int scheduleIdToCome = Integer.parseInt(scheduleListIdToCome);
		
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

		// 선택 시 항공편 잔여 좌석이 인원수 보다 작을 경우
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
		if(session.getAttribute("scheduleIdToGo") == null || session.getAttribute("scheduleIdToCome") == null || session.getAttribute("search") == null) {
			return "/";
		}
		int scheduleIdToGo = Integer.parseInt(session.getAttribute("scheduleIdToGo").toString());
		int scheduleIdToCome = Integer.parseInt(session.getAttribute("scheduleIdToCome").toString());
		
		Search search = (Search) session.getAttribute("search");
		
		try {
			int personCount = search.getPerson();
//			String memberId = (String) session.getAttribute("memberId");
			if(session.getAttribute("reservationId") != null) {
				int checkReservation = flightService.checkReservationId(session.getAttribute("reservationId").toString());
				if(checkReservation >= 1) {
					// 예약이 이미 존재함
					// 예약 조회 페이지로 redirect
					logger.info("이미 예약이 존재");
					return "/";
				}
			}
			
			// 예약 번호 생성
			String reservationId = flightService.generateReservationId();
			
			ArrayList<Ticket> passengerList = new ArrayList<Ticket>();
			for(int i=0; i<personCount; i++) {
				Ticket passenger = new Ticket();
				
				passenger.setMemberId("wh4679");
				passenger.setScheduleIdToGo(scheduleIdToGo);
				passenger.setScheduleIdToCome(scheduleIdToCome);
				
				passenger.setReservationId(reservationId);
				
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
			session.setAttribute("reservationId", reservationId);
			session.setAttribute("passengerList", passengerList);
			session.setAttribute("impNumber", impNumber);
			
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
		return "redirect:/flight/payment";
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
		
		// 만약 세션에 scheduleId나 검색 내역이 없는데 결제 버튼을 눌렀다면 -> 마이 페이지에서 예약 조회 후 예약 하기 버튼 (여기서 세션에 예약 내역 저장)
		if(session.getAttribute("scheduleIdToGo") == null || session.getAttribute("scheduleIdToCome") == null
				|| session.getAttribute("search") == null) {
			/* 다시 예약 하도록 
			 * 예약 상태가 있으면 삭제해주기
			 * flightService.deleteReservation(memberId, reservationId, "예약중");
			 */
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(false);
		}
		Search search = (Search) session.getAttribute("search");
		int grade = search.getGrade();
		int person = search.getPerson();
		
		int scheduleIdToGo = Integer.parseInt(session.getAttribute("scheduleIdToGo").toString());
		int scheduleIdToCome = Integer.parseInt(session.getAttribute("scheduleIdToCome").toString());
		
		int remainSeatToGo = flightService.getRemainSeatByGrade(scheduleIdToGo, grade);
		int remainSeatToCome = flightService.getRemainSeatByGrade(scheduleIdToCome, grade);
		
		// 좌석이 부족 하면 에약 실패
		if(remainSeatToGo - person < 0 || remainSeatToCome - person < 0) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(false);
		}
		
		// 결제 정보와 결제 시 필요한 정보 가져오기
		
		session.setAttribute("impNumber", impNumber);
		
		String merchantUid = session.getAttribute("reservationId").toString();
		session.setAttribute("merchantUid", merchantUid);
		
		flightService.getScheduleByScheduleId(scheduleIdToGo);
		
		String purchaseDetails = "항공권";
		session.setAttribute("purchaseDetails", "123456");
		
		int totalPrice = 0;
		if(session.getAttribute("totalPrice") == null) {
			if(grade == 1) {
				totalPrice = (flightService.getScheduleByScheduleId(scheduleIdToGo).getEconomyClassFare()+ flightService.getScheduleByScheduleId(scheduleIdToCome).getEconomyClassFare()) * person;
			}else if(grade == 2) {
				totalPrice = (flightService.getScheduleByScheduleId(scheduleIdToGo).getBusinessClassFare() + flightService.getScheduleByScheduleId(scheduleIdToCome).getBusinessClassFare()) * person;
			}else if(grade == 3) {
				totalPrice = (flightService.getScheduleByScheduleId(scheduleIdToGo).getFirstClassFare() + flightService.getScheduleByScheduleId(scheduleIdToCome).getFirstClassFare()) * person;
			}
		}
		session.setAttribute("amount", totalPrice);
		
//		session.setAttribute("memberName", session.getAttribute("memberId"));
		session.setAttribute("memberName", "Hello");
		
//		session.setAttribute("memberEmail", session.getAttribute("email"));
		session.setAttribute("memberEmail", "MemberEmail");
		
//		session.setAttribute("memberPhoneNumber", session.getAttribute("phoneNumber"));
		session.setAttribute("memberPhoneNumber", "MemberPhoneNumber");
		
		return ResponseEntity.ok(true);
	}
	
	// 결제 완료 시 Update
	@GetMapping("/flight/ticket/paymentCompleted")
	public String paymentCompleted(HttpSession session) {
		
		int scheduleIdToGo = Integer.parseInt(session.getAttribute("scheduleIdToGo").toString());
		int scheduleIdToCome = Integer.parseInt(session.getAttribute("scheduleIdToCome").toString());
		
		Search search = (Search) session.getAttribute("search");
		
		int grade = search.getGrade();
		int person = search.getPerson();
		
		// 예약이 완료되었으므로 좌석 업데이트
		int resultToGo = flightService.updateRemainSeatByScheduleId(scheduleIdToGo, person, grade);
		int resultToCome = flightService.updateRemainSeatByScheduleId(scheduleIdToCome, person, grade);
		
		return "/";
	}
	
	
}

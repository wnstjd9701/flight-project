package com.project.myapp.flight.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.project.myapp.flight.service.IFlightService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class FlightController {

	private final IFlightService flightService;
	
	/*
	 *  API No: 13
	 *  Method: GET
	 *  Information: 항공권 검색
	*/
	@GetMapping("/flight/ticket/search")
	public String searchTicket(Model model) {
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

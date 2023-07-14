package com.project.myapp.flight.service;

import org.springframework.stereotype.Service;

import com.project.myapp.flight.dao.IFlightRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FlightService implements IFlightService {
	
	private final IFlightRepository flightRepository;
}

package com.project.myapp.exception;

import java.text.ParseException;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.slf4j.Slf4j;

@ControllerAdvice
public class CustomExceptionHandler {
	
	@ExceptionHandler({RuntimeException.class, ParseException.class})
	public ResponseEntity<String> BadRequestException(final RuntimeException e){
		return ResponseEntity.badRequest().body(e.getMessage());
	}
}

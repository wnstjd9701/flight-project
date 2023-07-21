package com.project.myapp.payment.controller;

import java.util.concurrent.atomic.AtomicInteger;

import org.springframework.stereotype.Controller;

@Controller
public class PaymentController {
	private static final AtomicInteger counter = new AtomicInteger();
	
	public static String generateUID() {
        long timestamp = System.currentTimeMillis();
        int random = counter.incrementAndGet();
        return timestamp + "-" + random;
    }
}

package com.project.myapp.flight.model;

import lombok.Data;

@Data
public class PaymentInfo {
	String merchantUid;
	String purchaseDetails;
	String memberName;
	int amount;
	String memberEmail;
	String memberPhoneNumber;
}

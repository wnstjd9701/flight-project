package com.project.myapp.flight.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StreamUtils;

import com.project.myapp.flight.controller.FlightController;
import com.project.myapp.flight.dao.IFlightRepository;
import com.project.myapp.flight.model.Schedule;
import com.project.myapp.flight.model.Search;
import com.project.myapp.flight.model.Ticket;
import com.project.myapp.member.model.Companion;
import com.project.myapp.member.model.Member;
import com.project.myapp.member.service.MemberService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FlightService implements IFlightService {
	
	static final Logger logger = LoggerFactory.getLogger(FlightController.class);
	
	private final IFlightRepository flightRepository;
	private final JavaMailSenderImpl mailSender;

	// Email 발송을 위한 HTML 파일을 읽어오기 위해 필요
	private final ResourceLoader resourceLoader;
	@Value("${hostSMTPid}")
    private String hostSMTPid;
	
	@Value("${hostSMTPpwd}")
	private String hostSMTPpwd;
	
	@Value("${fromEmail}")
	private String fromEmail;
	
	// 좌석 등급 별 스케줄 조회
	@Override
	public List<Schedule> getFlightScheduleByGrade(Search search) {
		if(search.getGrade() == 1) {
			return flightRepository.getEconomyClassSchedule(search);
		}else if(search.getGrade() == 2) {
			return flightRepository.getBusinessClassSchedule(search);
		}else if(search.getGrade() == 3){
			return flightRepository.getFirstClassSchedule(search);
		}else {
			throw new IllegalArgumentException("Invalid Grade: " + search.getGrade());
		}
	}

	// 스케줄 아이디로 스케줄 조회
	@Override
	public Schedule getScheduleByScheduleId(int scheduleId) {
		return flightRepository.getScheduleByScheduleId(scheduleId);
	}
	
	/* 
	 * 예약 번호 생성
	 * UUID를 통해 고유한 식별 번호
	 */
	@Override
	public String generateReservationId() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String currentDate = dateFormat.format(new java.util.Date());

        // UUID 생성
        UUID uuid = UUID.randomUUID();
        String uuidString = uuid.toString().replaceAll("-", "");

        // 예약 번호 생성
        String reservationNumber = "F" + currentDate + "-" + uuidString.substring(0, 6);

        return reservationNumber;
	}
	// 탑승객 정보 입력
	@Override
	@Transactional
	public int insertPassengerInformation(Ticket passenger) {
		passenger.setScheduleId(passenger.getScheduleIdToGo());
		passenger.setFare(passenger.getFareToGo());
		
		// 가는편 항공권 등록
		logger.info("Passenger: " + passenger.toString());
		int resultToGo = flightRepository.insertPassengerInformation(passenger);
		int resultToCome = 0;
		
		// 가는편이 등록되었으면 오는편 항공권 등록
		if(resultToGo >= 1) {
			passenger.setScheduleId(passenger.getScheduleIdToCome());
			passenger.setFare(passenger.getFareToCome());
			resultToCome = flightRepository.insertPassengerInformation(passenger);
		}
		int result = resultToGo + resultToCome;
		return result;
	}
	
	// 시간 변경 메서드
	@Override
	public String getTimeDetail(int flightTime) {
		int time = flightTime;
		int hours = time / 60;
		int minutes = time % 60;
		String detailTime = Integer.toString(hours) + "시간 " + Integer.toString(minutes) + "분";
		return detailTime;
	}
	
	// 예약중인 좌석 업데이트
	@Override
	public int updateRemainSeatByScheduleId(int scheduleId, int remainSeat, int grade) {
		if(grade == 1) {
			return flightRepository.updateEconomyRemainSeatByScheduleId(scheduleId, remainSeat);
		}else if(grade == 2) {
			return flightRepository.updateBusinessRemainSeatByScheduleId(scheduleId, remainSeat);
		}else {
			return flightRepository.updateFirstRemainSeatByScheduleId(scheduleId, remainSeat);
		}
	}

	// 잔여 좌석 등급별로 가져오기
	@Override
	public int getRemainSeatByGrade(int scheduleId, int grade) {
		if(grade == 1) {
			return flightRepository.getEconomyRemainSeat(scheduleId);
		}else if(grade == 2) {
			return flightRepository.getBusinessRemainSeat(scheduleId);
		}else if(grade == 3) {
			return flightRepository.getFirstRemainSeat(scheduleId);
		}
		return 0;
	}

	// 예약 상태 확인
	@Override
	public int checkReservationId(String reservationId) {
		return flightRepository.checkReservationIsExists(reservationId);
	}

	// 예약 상태 변경
	@Override
	public int updateReservationStatusByReservationId(String reservationId) {
		return flightRepository.updateReservationStatusByReservationId(reservationId);
	}

	@Override
	public void sendCompletePaymentEmail(Member member, Search search, String reservationId) {
		// Mail Server 설정
		String memberId = member.getMemberId();
	    String charSet = "UTF-8";
	    String hostSMTP = "smtp.naver.com";
	    String hostSMTPid = "flightservice@naver.com";
	    String hostSMTPpwd = "fs4679123!@#";

	    // 보내는 사람 EMail, 제목, 내용
	    String fromEmail = "flightservice@naver.com";
	    String fromName = "flighteasy";
	    String subject = "항공권 결제 완료 내역";
	    String msg = "";
	    
	 // 이메일 내용을 HTML 파일에서 읽어옴
        String htmlFilePath = "classpath:/templates/reservation_complete_email.html";
        try {
            Resource resource = resourceLoader.getResource(htmlFilePath);
            String htmlContent = StreamUtils.copyToString(resource.getInputStream(), StandardCharsets.UTF_8);

            // 이메일 내용에 들어갈 변수들을 설정 (예약 정보 등)
            Map<String, String> emailVariables = new HashMap<String, String>();
            emailVariables.put("reservationId", reservationId); // 예약 번호 예시
            emailVariables.put("memberName", member.getName()); // 고객명 예시
            emailVariables.put("departureDateTime", "ICN -> " + search.getDepartmentNation() + " / " + search.getDepartmentDate().toString()); // 출발 일시 예시
            emailVariables.put("arrivalDateTime", search.getArrivalNation() + " -> ICN / " + search.getArrivalDate().toString()); // 도착 일시 예시

            // HTML 내용에 있는 변수들을 ${} 템플릿 표현식으로 치환하여 메일 내용 설정
            msg = htmlContent;
            for (Map.Entry<String, String> entry : emailVariables.entrySet()) {
                msg = msg.replace("${" + entry.getKey() + "}", entry.getValue());
            }
        } catch (IOException e) {
            System.out.println("HTML 파일 읽기 실패: " + e);
            return; // 이메일 전송을 실패하는 경우 종료
        }

        // 이메일 전송 설정
        Properties javaMailProperties = new Properties();
        javaMailProperties.setProperty("mail.smtp.starttls.enable", "true");
        javaMailProperties.setProperty("mail.smtp.ssl.enable", "true");
        javaMailProperties.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
        mailSender.setJavaMailProperties(javaMailProperties);

        // 이메일 보내기
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, charSet);
            helper.setFrom(fromEmail, fromName);
            helper.setTo(member.getEmail());
            helper.setSubject(subject);
            helper.setText(msg, true);
            mailSender.send(message);
            
            logger.info("Email 전송 완료");
        } catch (MessagingException e) {
            logger.info("메일발송 실패 : " + e);
        } catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
    }

}


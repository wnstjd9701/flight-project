package com.project.myapp.member.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.project.myapp.member.dao.IMemberRepository;
import com.project.myapp.member.model.Companion;
import com.project.myapp.member.model.Member;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberService implements IMemberService {

	private final IMemberRepository IMemberRepository;
	private final JavaMailSenderImpl mailSender;

	@Override
	public void insertMember(Member member) {
		IMemberRepository.insertMember(member);

	}

	@Override
	public Member selectMember(String memberId) {
		return IMemberRepository.selectMember(memberId);
	}

	@Override
	public List<Member> selectAllMembers() {
		return IMemberRepository.selectAllMembers();
	}

	@Override
	public String getPassword(String memeberId) {
		return IMemberRepository.getPassword(memeberId);
	}

	@Override
	public void updateMember(Member member) {
		IMemberRepository.updateMember(member);

	}

	@Override
	public void deleteMember(Member member) {
		IMemberRepository.deleteMember(member);

	}

	@Override
	public void updatePassword(Member member) {
		IMemberRepository.updatePassword(member);

	}

	@Override
	public void insertPassenger(Companion companion) {
		IMemberRepository.insertPassenger(companion);

	}

	@Override
	public Member viewReservation(String memberId) {
		return IMemberRepository.viewReservation(memberId);
	}

	@Override
	public void sendEmail(Member member, String method) {
		// Mail Server 설정
		String charSet = "UTF-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "flightservice@naver.com";
		String hostSMTPpwd = "fs4679123!@#";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "flightservice@naver.com";
		String fromName = "flighteasy";
		String subject = "";
		String msg = "";

		if(method.equals("findpassword")) {
			subject = "flightEasy 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getMemberId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += member.getPassword() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = member.getEmail();
		try {
			Properties javaMailProperties = new Properties();
			javaMailProperties.setProperty("mail.smtp.starttls.enable", "true");
			javaMailProperties.setProperty("mail.smtp.ssl.enable", "true");
			javaMailProperties.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");

			mailSender.setJavaMailProperties(javaMailProperties);
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper helper = new MimeMessageHelper(message, true,charSet);
	        helper.setFrom(fromEmail, fromName);
	        helper.setTo(mail);
	        helper.setSubject(subject);
	        helper.setText(msg, true);

	        mailSender.send(message);
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	@Override
	public void findPassword(HttpServletResponse response, Member member)  {
		response.setContentType("text/html;charset=utf-8");
		Member check = IMemberRepository.selectMember(member.getMemberId());
		PrintWriter checkout;
		try {
			checkout = response.getWriter();
			// 가입된 아이디가 없으면
			if(IMemberRepository.idCheck(member.getMemberId()) == null){
				checkout.print("등록되지 않은 아이디입니다.");
				checkout.close();
			}// 가입된 이메일이 아니면
			else if(!member.getEmail().equals(check.getEmail())) {
				checkout.print("등록되지 않은 이메일입니다.");
				checkout.close();
			}else {// 임시 비밀번호 생성
				String temporaryPassword = "";
				for (int i = 0; i < 12; i++) {
					temporaryPassword += (char) ((Math.random() * 26) + 97);
				}
				member.setPassword(temporaryPassword);
				// 비밀번호 변경
				IMemberRepository.updatePassword(member);
				// 비밀번호 변경 메일 발송
				sendEmail(member, "findpassword");

				checkout.print("이메일로 임시 비밀번호를 발송하였습니다.");
				checkout.close();
			}
		}catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updatePasswordByMember(Member member) {
		IMemberRepository.updatePasswordByMember(member);
		
	}

}




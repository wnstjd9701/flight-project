package com.project.myapp.member.controller;


import java.sql.Date;
import java.util.Set;
import java.util.regex.Pattern;

import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.ValidatorFactory;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.project.myapp.member.model.Member;
@Component
public class MemberValidator implements Validator,InitializingBean {
	
	private javax.validation.Validator validator;

    @Override
    public boolean supports(Class<?> clazz) {
        return Member.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
    	
		Set<ConstraintViolation<Object>> violations = validator.validate(target);
		for (ConstraintViolation<Object> violation : violations) {
			String propertyPath = violation.getPropertyPath().toString();
			String message = violation.getMessage();
			errors.rejectValue(propertyPath, message, message);
		}
    	
        Member member = (Member) target;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memberId", "Notnull.member.memberId", "[아이디를 입력하세요.]");
        String memberIdPattern = "[a-z0-9]{6,16}";
        String memberId = member.getMemberId();
        if (!Pattern.matches(memberIdPattern,memberId)) {
            errors.rejectValue("memberId", "Pattern.member.memberId", "[영문과 숫자 조합하여 6~16자만 가능합니다.]");
        }
        
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "Notnull.member.password", "[비밀번호를 입력하세요.]");
        String passwordPattern="(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{6,}";
        String password = member.getPassword();
        if (!Pattern.matches(passwordPattern,password)) {
            errors.rejectValue("password", "Pattern.member.password", "[영문/대소문자/숫자/특수문자 조합, 6자 이상이어야 합니다.]");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "member.name.empty", "[성명을 입력하세요.]");
        String namePattern = "[가-힣]{1,}";
        String name = member.getName();
        if (!Pattern.matches(namePattern,name)) {
            errors.rejectValue("name", "Pattern.member.name", "[한글 성명을 입력하세요.]");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "member.firstName.empty", "[영문 이름을 입력하세요.]");
        String firstNamePattern = "[a-z]{2,}";
        String firstName=member.getFirstName();
        if (!Pattern.matches(firstNamePattern,firstName)) {
            errors.rejectValue("firstName", "Patter.member.firstName", "[영문 이름을 입력하세요.]");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "member.firstName.empty", "[영문 성을 입력하세요.]");
        String lastNamePattern = "[A-Z]{2,}";
        String lastName=member.getLastName();
        if (!Pattern.matches(lastNamePattern,lastName)) {
            errors.rejectValue("lastName", "Patter.member.lastName", "[영문 성을 입력하세요.]");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phoneNumber", "member.phoneNumber.empty", "[전화번호를 입력하세요.]");
        String phoneNumberPattern = "[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}";
        String phoneNumber = member.getPhoneNumber();
        if (!Pattern.matches(phoneNumberPattern,phoneNumber)) {
            errors.rejectValue("phoneNumber", "Pattern.member.phoneNumber", "[전화번호 형식에 맞지 않습니다.]");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "member.email.empty", "[이메일을 입력하세요.]");
        String emailPattern = "^[\\w-]+(?:\\.[\\w-]+)*@((?:[\\w-]+\\.)*)\\w[\\w-]{0,66}\\.([a-z]{2,6}(?:\\.[a-z]{2})?)$";
        String email = member.getEmail();
        if (!Pattern.matches(emailPattern,email)) {
            errors.rejectValue("email", "Pattern.member.email", "[이메일 형식에 맞지 않습니다.]");
        }
        
        Date birthday = member.getBirthday();
        Date today = new Date(System.currentTimeMillis());
        if (member.getBirthday() == null) {
            errors.rejectValue("birthday", "Notnull.member.birthday", "[생년월일을 입력하세요.] ");
        }else if(birthday.after(today)) {
        	errors.rejectValue("birthday", "Past.member.birthday","[오늘 이후 날짜는 선택할 수 없습니다.]");
        }
 

    }

	@Override
	public void afterPropertiesSet() throws Exception {
		ValidatorFactory vFactory = Validation.buildDefaultValidatorFactory();
		validator = vFactory.usingContext().getValidator();
		
	}


}

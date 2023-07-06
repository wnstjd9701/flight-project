package com.project.myapp;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class JdbcEncryptor {
	public static void main(String[] args) {
		StandardPBEStringEncryptor enc = new StandardPBEStringEncryptor();
		enc.setPassword("wnstjd");
		System.out.println(enc.encrypt("oracle.jdbc.OracleDriver"));
		System.out.println(enc.encrypt("jdbc:oracle:thin:@localhost:1521:xe"));
		System.out.println(enc.encrypt("flight"));
		System.out.println(enc.encrypt("flight"));
	}
}

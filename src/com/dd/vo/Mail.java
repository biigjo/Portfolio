package com.dd.vo;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
	/*private String to_email;
	private String msg;*/
	
	public Mail() {
		/*this.to_email = to_email;
		this.msg = msg;*/
	}
	
	public static void naverMailSend(String to_email, String msg) {
		String host = "smtp.naver.com";
		String user = "starfishnuna@naver.com";
		String password = "454612cbh";
		
		
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage message = new MimeMessage(session); 
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));		// 보낼 이메일
			
			message.setSubject("댕댕포레스트 계정정보입니다.");
			message.setText(msg);		// 보낼 메시지

			Transport.send(message); 
			System.out.println("Success Message Send");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}

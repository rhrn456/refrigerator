package com.multi.personalfridge.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {
	
	@Autowired
	private JavaMailSender mailSender;
	
//	public void sendSimpleMessage(String to, String subject, String text) {
//		SimpleMailMessage message = new SimpleMailMessage();
//		message.setFrom("smtptest8077@gmail.com");
//		message.setTo(to);
//		message.setSubject(subject);
//		message.setText(text);
//		mailSender.send(message);
//	}
//}
 //SimpleMailMessage 는 단순한 텍스트 보내기용, HTML 이나 첨부파일을 보낼수없음
 //MimeMessage 는 첨부파일이나 HTML형식의 본문작성 가능
public void sendSimpleMessage(String to, String subject, String text) {
	String logoUrl = "<img src='/2luli.refrigerator/house-AI-BI.png' alt='로고 이미지'>";
	String messageText = logoUrl + "\n\n" + text;
	try {
        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true);
        
        helper.setFrom("smtptest8077@gmail.com");
        helper.setTo(to);
        helper.setSubject(subject);
        helper.setText(messageText, true); // HTML 형식으로 메시지 전송
        
        mailSender.send(message);
    } catch (MessagingException e) {
        // 메일 전송 예외 처리
        e.printStackTrace();
        // 예외 처리 로직 추가
    }
}
}
	
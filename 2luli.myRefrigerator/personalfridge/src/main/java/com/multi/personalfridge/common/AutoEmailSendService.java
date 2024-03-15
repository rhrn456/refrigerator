package com.multi.personalfridge.common;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.multi.personalfridge.dto.EmailSendDTO;
import com.multi.personalfridge.dto.RefrigeratorProdcutDTO;

@Service
public class AutoEmailSendService {
	
	@Autowired
	CommonMapper commonMapper;
	@Autowired
	private EmailService emailService;
	
	// 24시간마다 작동
	@Scheduled(fixedDelay = 86400000)
	public void run() {
		System.out.println("스케줄러 작동");/*테스트용 추후 삭제*/		
		
		List<String> overLimitProduct = new ArrayList<String>();
		List<EmailSendDTO> overLimitProductList = getOverLimitProduct();
		
		//현재날짜를 불러옴
		java.util.Date now = new java.util.Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String date = dateFormat.format(now);
		String[] nowDate = date.split("-"); 	
		
		//소비기한이 지난 제품이 있으면 각 유저의 메일로 보내줌
//		if (overLimitProductList != null) {
//			String currentMail = overLimitProductList.get(0).getMail();
//			int count = 0;
//			
//			for (EmailSendDTO refrigeratorProdcut : overLimitProductList) {	
//				count++;
//				
//				if(refrigeratorProdcut.getMail().equals(currentMail)) {						
//					classificationProductDate(refrigeratorProdcut, overLimitProduct, nowDate);				
//				} else {
//					StringBuilder str = new StringBuilder();
//					for (int i = 0; i < overLimitProduct.size() - 1; i++) {
//						str.append(overLimitProduct.get(i) + ", ");
//					}					
//					str.append(overLimitProduct.get(overLimitProduct.size()-1) + ".");					
//					emailService.sendSimpleMessage(currentMail, "소비기한 알림", str.toString());
//					overLimitProduct.clear();
//					
//					classificationProductDate(refrigeratorProdcut, overLimitProduct, nowDate);	
//				}
//				
//				if (count == overLimitProductList.size()) {					
//					StringBuilder str = new StringBuilder();
//					for (int i = 0; i < overLimitProduct.size() - 1; i++) {
//						str.append(overLimitProduct.get(i) + ", ");
//					}
//					str.append(overLimitProduct.get(overLimitProduct.size()-1) + ".");
//					
//					emailService.sendSimpleMessage(refrigeratorProdcut.getMail(), "소비기한 알림", str.toString());
//				}				
//				currentMail = refrigeratorProdcut.getMail();
//			}
//		}		
	}
	
	//만료된 물품과 만료될 물품의 정보를 가져옴
	private List<EmailSendDTO> getOverLimitProduct() {
		List<EmailSendDTO> overLimitProduct = commonMapper.getOverLimitProduct();		
		return overLimitProduct;
	}
	
	//소비기한이 만료된 물품과 만료될 물품을 분류
	private void classificationProductDate(EmailSendDTO refrigeratorProdcut, List<String> overLimitProduct, String[] nowDate) {
		String[] limitDate = refrigeratorProdcut.getLimit_date().toString().split("-");
		
		if (Integer.parseInt(limitDate[0]) < Integer.parseInt(nowDate[0])) {
			overLimitProduct.add(refrigeratorProdcut.getProduct_name() + "의 소비기한이 만료되었습니다");
		} else if (Integer.parseInt(limitDate[1]) < Integer.parseInt(nowDate[1])) {
			overLimitProduct.add(refrigeratorProdcut.getProduct_name() + "의 소비기한이 만료되었습니다");
		} else if (Integer.parseInt(limitDate[2]) < Integer.parseInt(nowDate[2])) {
			overLimitProduct.add(refrigeratorProdcut.getProduct_name() + "의 소비기한이 만료되었습니다");
		} else if (Integer.parseInt(limitDate[2]) < Integer.parseInt(nowDate[2]) + 3) {
			overLimitProduct.add(refrigeratorProdcut.getProduct_name() + "의 소비기한이 곧 만료됩니다");
		}	
	}
	
}

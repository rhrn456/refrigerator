package com.multi.personalfridge.payment;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.siot.IamportRestClient.IamportClient;

@RequestMapping("/pay")
@Controller
public class PayController {

	@Value("${imp.api.key}")
    private String apiKey;
    @Value("${imp.api.secretkey}")
    private String SecretKey;
    
	private IamportClient api;
	
//	@Autowired
//	private PayService payService;
	 
}

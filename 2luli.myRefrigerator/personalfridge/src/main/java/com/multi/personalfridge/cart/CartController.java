package com.multi.personalfridge.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.multi.personalfridge.dto.CartDTO;
import com.multi.personalfridge.dto.RecipeProductDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {

	@Autowired
	CartService cartService;
	
	
	@GetMapping("/insertCart")
	public String insertCart(@RequestParam("cartProducts") String cartProductsJson, HttpServletRequest request) {
	    // 세션에서 userId 가져오기
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("userId");

	    // userId가 null이거나 비어 있는지 확인
	    if (userId == null || userId.isEmpty()) {
	        // userId가 없으면 에러 반환
	        return "error";
	    }

	    try {
	        ObjectMapper objectMapper = new ObjectMapper(); 

	        // JSON 문자열을 CartDTO 배열로 변환
	        CartDTO[] cartProducts = objectMapper.readValue(cartProductsJson, CartDTO[].class);
	        
	        for (CartDTO product : cartProducts) {
	            // 변경된 데이터를 cartService에 전달
	            product.setUser_id(userId); // userId 설정
	            boolean result = cartService.insertCart(product);
	            if (!result) {
	                // 처리 중 문제 발생 시 에러 반환
	                return "error";
	            }
	        }
	        // 모든 제품이 성공적으로 처리된 경우에만 성공 반환
	        return "redirect:/mycart";
	    } catch (JsonProcessingException e) {
	        // JSON 파싱에 실패한 경우에 대한 예외 처리
	        e.printStackTrace();
	        return "error";
	    }
	}
	
}
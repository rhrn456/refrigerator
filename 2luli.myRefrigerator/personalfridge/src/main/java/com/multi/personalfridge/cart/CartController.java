package com.multi.personalfridge.cart;

import java.net.URI;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.multi.personalfridge.common.RandomStringGenerator;
import com.multi.personalfridge.dto.CartDTO;
import com.multi.personalfridge.dto.RecipeProductDTO;
import com.multi.personalfridge.dto.ShipDTO;
import com.multi.personalfridge.refrigerator.RefrigeratorService;
import com.multi.personalfridge.ship.ShipService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {

	@Autowired
	CartService cartService;
	@Autowired
	RandomStringGenerator random;
	@Autowired
	ShipService shipService;
	@Autowired
	RefrigeratorService refrigeratorService;
	
	@GetMapping("/insertCart")
	public String insertCart(@RequestParam("cartProducts") String cartProductsJson, HttpServletRequest request) {
	    // 세션에서 userId 가져오기
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("userId");
	    // userId가 null이거나 비어 있는지 확인
	    if (userId == null || userId.isEmpty()) {
	        // userId가 없으면 에러 반환
	        return "redirect:/loginPage";
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
	
	@PostMapping("/ItemToCart")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> ItemToCart(@RequestParam int product_id, @RequestParam int product_quantity, HttpServletRequest request) {
		CartDTO cart = new CartDTO();
		Map<String, Object> response = new HashMap<>();
		 HttpSession session = request.getSession();
		 String userId = (String) session.getAttribute("userId");
		 if (userId == null || userId.isEmpty()) {
		        // 리다이렉트 응답 반환
		        response.put("message", "로그인 후 이용해주세요.");
		        return ResponseEntity.ok(response);
		    }
		 cart.setUser_id(userId);
		 cart.setProduct_id(product_id);
		 cart.setProduct_quantity(product_quantity);
		 boolean result = cartService.insertCart(cart);
		 
		 int cartCountNormal = cartService.getCartCountNormal(userId);
		 int cartCountSpecial = cartService.getCartCountSpecial(userId);
		 int cartCount = cartCountNormal + cartCountSpecial;
		 session.setAttribute("cartCount", cartCount);
		    if (result) {
		        response.put("message", "장바구니에 추가되었습니다.");
		        response.put("cartCount", cartCount); // 세션의 cartCount 값 전달
		        return ResponseEntity.ok(response);
		    } else {
		        response.put("message", "장바구니 추가 실패");
		        return ResponseEntity.badRequest().body(response);
		    }
		}
	
	@GetMapping("/buyproduct")
	public String buyProduct(@RequestParam("cartProducts") String cartProductsJson, @RequestParam String arrive, @RequestParam String sub_adress, HttpServletRequest request) {
		String str = random.generateRandomString();
		// 세션에서 userId 가져오기
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("userId");
	    if (userId == null || userId.isEmpty()) {
	        // userId가 없으면 에러 반환
	        return "redirect:/loginPage";
	    }
	    try {
	        ObjectMapper objectMapper = new ObjectMapper(); 
	        
	        // JSON 문자열을 CartDTO 배열로 변환
	        CartDTO[] cartProducts = objectMapper.readValue(cartProductsJson, CartDTO[].class);
	        
	        for (CartDTO product : cartProducts) {
	            // 변경된 데이터를 cartService에 전달
	            product.setUser_id(userId); // userId 설정
	            cartService.removeCartItem(product.getProduct_id(),product.getUser_id());
	            product.setShip_code(str);
	            //카트에 제품이랑 송장 저장
	            boolean result = cartService.buyProduct(product);
	            if (!result) {
	                return "error";
	            }
	        }
	         //물품 택배 등록
	         ShipDTO ship = new ShipDTO();
	         ship.setShip_code(str);
	         ship.setArrive(arrive);
	         ship.setSub_adress(sub_adress);
			 ship.setNow_location("이루리");
			 ship.setUser_id(userId);
			 shipService.inserShipInfo(ship);
			 
			 //다저장되었으면 택배 조회창으로
	       	 int cartCountNormal = cartService.getCartCountNormal(userId);
			 int cartCountSpecial = cartService.getCartCountSpecial(userId);
			 int cartCount = cartCountNormal + cartCountSpecial;
			 session.setAttribute("cartCount", cartCount);
	        return "redirect:/mypage/checkshipload";
	    } catch (JsonProcessingException e) {
	        // JSON 파싱에 실패한 경우에 대한 예외 처리
	        e.printStackTrace();
	        return "error";
	    }
	}

}


package com.multi.personalfridge.refrigerator;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.multi.personalfridge.dto.RefrigeratorProdcutDTO;
import com.multi.personalfridge.dto.UserDTO;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;




@Controller
public class RefrigeratorController {
	
	@Autowired
	RefrigeratorService refrigeratorService;	
	
	//나의 냉장고 들어왔을때 메인페이지
	@GetMapping("/refrigerator")                      //세션 유저변수명
	public ModelAndView getMethodName(/*@SessionAttribute("user") UserDTO user*/) {
		ModelAndView mv = new ModelAndView();
		
		//소비기한과 비교를 위한 현재 날짜 받아오기
		java.util.Date now = new java.util.Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		UserDTO user = new UserDTO();/*테스트용 제거 할 것*/
		user.setUser_id("asd");/*테스트용 제거 할 것*/		
		
		//유저 아이디와 맞는 냉장고아이디를 불러옴
		int refrigeratorId = refrigeratorService.getRefrigeratorId(user.getUser_id());
		System.out.println(refrigeratorId);
		mv.addObject("refrigeratorId", refrigeratorId); /*테스트용 제거할 것*/ 
		
		//냉장고 아이디와 맞는 냉장고의 재료를 리스트로 불러옴
		List<RefrigeratorProdcutDTO> refrigeratorProductList = refrigeratorService.getRefrigeratorProduct(refrigeratorId);
		System.out.println(refrigeratorProductList);/*테스트용 제거 할 것*/		
		mv.addObject("refrigeratorProductList", refrigeratorProductList);		
		mv.setViewName("refrigeratorTest");
		
		String date = dateFormat.format(now).toString();
		String[] nowDate = date.split("-"); 
		List<String> overLimitProduct = new ArrayList<String>();
		for (RefrigeratorProdcutDTO refrigeratorProdcut : refrigeratorProductList) {
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
		
		mv.addObject("overLimitProduct", overLimitProduct);
		
		return mv;
	}
	
	//비동기로 재료을 추가
	@PostMapping("/insertRefrigeratorProduct")
	public ResponseEntity<String> postMethodName(@RequestBody RefrigeratorProdcutDTO refrigeratorProdcut) {
		System.out.println(refrigeratorProdcut);
		boolean result = refrigeratorService.insertRefrigeratorProdcut(refrigeratorProdcut);
		return ResponseEntity.ok("재료가 냉장고에 성공적으로 추가되었습니다.");
	}
	
	//비동기로 재료를 제거
	@PostMapping("/deleteRefrigeratorProduct")
	public ResponseEntity<String> deleteRefrigeratorProduct(@RequestParam("refrigeratorProductId") int refrigeratorProductId) {
		boolean result = refrigeratorService.deleteRefrigeratorProduct(refrigeratorProductId);

	    return ResponseEntity.ok("제품이 성공적으로 삭제되었습니다.");
	}
	
	//재료 수정
	@PutMapping("/updateRefrigeratorProduct")
	public ResponseEntity<String> updateRefrigeratorProduct(@RequestBody RefrigeratorProdcutDTO refrigeratorProdcut) {
//		RefrigeratorProdcutDTO refrigeratorProdcut = new RefrigeratorProdcutDTO();
		System.out.println(refrigeratorProdcut);
		boolean result = refrigeratorService.updateRefrigeratorProduct(refrigeratorProdcut);
		return ResponseEntity.ok("재료 정보가 성공적으로 업데이트 되었습니다");
		
	}
	
}

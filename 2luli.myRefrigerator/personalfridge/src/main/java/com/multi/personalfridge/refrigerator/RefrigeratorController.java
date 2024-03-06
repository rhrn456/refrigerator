package com.multi.personalfridge.refrigerator;

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



@Controller
public class RefrigeratorController {
	
	@Autowired
	RefrigeratorService refrigeratorService;	
	
	//나의 냉장고 들어왔을때 메인페이지
	@GetMapping("/refrigerator")                      //세션 유저변수명
	public ModelAndView getMethodName(/*@SessionAttribute("user") UserDTO user*/) {
		ModelAndView mv = new ModelAndView();
		
		UserDTO user = new UserDTO();/*테스트용 제거할 것*/
		user.setUserId("asd");/*테스트용 제거할 것*/		
		
		//유저 아이디와 맞는 냉장고아이디를 불러옴
		int refrigeratorId = refrigeratorService.getRefrigeratorId(user.getUserId());
		
		mv.addObject("refrigeratorId", refrigeratorId); /*테스트용 제거할 것*/ 
		
		//냉장고 아이디와 맞는 냉장고의 재료를 리스트로 불러옴
		List<RefrigeratorProdcutDTO> refrigeratorProductList = refrigeratorService.getRefrigeratorProduct(refrigeratorId);
		
		mv.addObject("refrigeratorProductList", refrigeratorProductList);		
		mv.setViewName("refrigeratorTest");
		
		return mv;
	}
	
	//비동기로 처리 할 예정
	@PostMapping("/insertRefrigeratorProduct")
	public ResponseEntity<String> postMethodName(@RequestBody RefrigeratorProdcutDTO refrigeratorProdcut) {
		refrigeratorProdcut.setRefrigeratorId(1);
		System.out.println(refrigeratorProdcut);
		boolean result = refrigeratorService.insertRefrigeratorProdcut(refrigeratorProdcut);
		return ResponseEntity.ok("재료가 냉장고에 성공적으로 추가되었습니다.");
	}
	
	@PostMapping("/deleteRefrigeratorProduct")
	public ResponseEntity<String> deleteRefrigeratorProduct(@RequestBody Integer refrigeratorProdcutId) {
		System.out.println(refrigeratorProdcutId);

	    return ResponseEntity.ok("제품이 성공적으로 삭제되었습니다.");
	}
	
	
}

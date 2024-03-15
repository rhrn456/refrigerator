package com.multi.personalfridge.refrigerator;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.multi.personalfridge.common.EmailService;
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
	@Autowired
	private EmailService emailService;
	
	//나의 냉장고 들어왔을때 메인페이지
	@GetMapping("/refrigerator")                      //세션 유저변수명
	public ModelAndView getMethodName(@SessionAttribute("userId") String user_id) {
		ModelAndView mv = new ModelAndView();
		System.out.println("현재접속중인 id : " + user_id);/*테스트용 추후 삭제*/
		
		//소비기한과 비교를 위한 현재 날짜 받아오기
		java.util.Date now = new java.util.Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
//		UserDTO user = new UserDTO();/*테스트용 제거 할 것*/
//		user.setUser_id("qwe");/*테스트용 제거 할 것*/		
		
		//유저 아이디와 맞는 냉장고아이디를 불러옴
		int refrigeratorId = refrigeratorService.getRefrigeratorId(user_id);
		System.out.println("현재 접속중인 냉장고 id : " + refrigeratorId);/*테스트용 추후 삭제*/
		mv.addObject("refrigeratorId", refrigeratorId); 
		
		//냉장고 아이디와 맞는 냉장고의 재료를 리스트로 불러옴
		List<RefrigeratorProdcutDTO> refrigeratorProductList = refrigeratorService.getRefrigeratorProduct(refrigeratorId);
		System.out.println("현재 냉장고의 제품 갯수 : " + refrigeratorProductList.size());/*테스트용 제거 할 것*/	
		mv.addObject("refrigeratorProductList", refrigeratorProductList);		
		mv.setViewName("refrigeratorTest");
		
		//현재날자와 소비기한을 비교해서 알려줌 (삭제예정)
//		String date = dateFormat.format(now).toString();
//		String[] nowDate = date.split("-"); 
//		List<String> overLimitProduct = new ArrayList<String>();
//		for (RefrigeratorProdcutDTO refrigeratorProdcut : refrigeratorProductList) {
//			String[] limitDate = refrigeratorProdcut.getLimit_date().toString().split("-");
//			if (Integer.parseInt(limitDate[0]) < Integer.parseInt(nowDate[0])) {
//				overLimitProduct.add(refrigeratorProdcut.getProduct_name() + "의 소비기한이 만료되었습니다");
//			} else if (Integer.parseInt(limitDate[1]) < Integer.parseInt(nowDate[1])) {
//				overLimitProduct.add(refrigeratorProdcut.getProduct_name() + "의 소비기한이 만료되었습니다");
//			} else if (Integer.parseInt(limitDate[2]) < Integer.parseInt(nowDate[2])) {
//				overLimitProduct.add(refrigeratorProdcut.getProduct_name() + "의 소비기한이 만료되었습니다");
//			} else if (Integer.parseInt(limitDate[2]) < Integer.parseInt(nowDate[2]) + 3) {
//				overLimitProduct.add(refrigeratorProdcut.getProduct_name() + "의 소비기한이 곧 만료됩니다");
//			}				
//		}
		
//		mv.addObject("overLimitProduct", overLimitProduct);/*테스트용 추후삭제*/
		
		//메일로 보낼 String으로 변환
//		StringBuilder str = new StringBuilder();
//		for (int i = 0; i < overLimitProduct.size() - 1; i++) {
//			str.append(overLimitProduct.get(i) + ", ");
//		}
//		str.append(overLimitProduct.get(overLimitProduct.size()-1) + ".");
		
		//이메일 보내기                     보낼이메일주소            제목              내용
//		emailService.sendSimpleMessage("dudans8wk@naver.com", "소비기한 알림", str.toString());
		
		return mv;
	}
	
	//비동기로 재료을 추가
	@PostMapping("/insertRefrigeratorProduct")
	public ResponseEntity<String> postMethodName(@RequestBody RefrigeratorProdcutDTO refrigeratorProdcut) {
		System.out.println(refrigeratorProdcut);/*확인용 추후삭제*/
		boolean result = refrigeratorService.insertRefrigeratorProdcut(refrigeratorProdcut);
		
		if (result) {
			return ResponseEntity.ok("재료가 냉장고에 성공적으로 추가되었습니다.");
		} else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("재료를 냉장고에 추가하는데 실패하였습니다.");
		}
	}
	
	//비동기로 재료를 제거
	@PostMapping("/deleteRefrigeratorProduct")
	public ResponseEntity<String> deleteRefrigeratorProduct(@RequestParam("refrigeratorProductId") int refrigeratorProductId) {
		boolean result = refrigeratorService.deleteRefrigeratorProduct(refrigeratorProductId);

		if (result) {
			return ResponseEntity.ok("재료가 성공적으로 삭제되었습니다.");
		} else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("재료 삭제에 실패하였습니다.");
		}
	}
	
	//재료 공유 refrigeratorProductId를 받아와서 게시판 폼에 관련정보를 받아와 쏴줄 예정
	@PostMapping("/shareProduct")
	public void shareProduct(@RequestParam("refrigeratorProductId") int refrigeratorProductId) {
		System.out.println(refrigeratorProductId);/*테스트용 추후삭제*/
	}
	
	//재료 수정
	@PutMapping("/updateRefrigeratorProduct")
	public ResponseEntity<String> updateRefrigeratorProduct(@RequestBody RefrigeratorProdcutDTO refrigeratorProdcut) {
		System.out.println(refrigeratorProdcut);/*확인용 추후삭제*/
		boolean result = refrigeratorService.updateRefrigeratorProduct(refrigeratorProdcut);
		
		if (result) {
			return ResponseEntity.ok("재료 정보가 성공적으로 업데이트 되었습니다");
		} else {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("재료 정보 업데이트에 실패했습니다.");
		}		
	}
	
	
	
}
// 레시피추천(재료별로검색할수있게해서 인기있는레시피 2~3가지 추천), 재료구매시 자동추가 (재료아이디정보를 받아와서 넣어줄것임), 정렬, my냉장고 연결

package com.multi.personalfridge.refrigerator;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.multi.personalfridge.common.EmailService;
import com.multi.personalfridge.dto.ProductDTO;
import com.multi.personalfridge.dto.RecipeProductDTO;
import com.multi.personalfridge.dto.RecipeDTO;
import com.multi.personalfridge.dto.RecipeProductDTO;
import com.multi.personalfridge.dto.RefrigeratorProdcutDTO;
import com.multi.personalfridge.dto.UserDTO;
import com.multi.personalfridge.product.ProductService;
import com.multi.personalfridge.recipe.RecipeProductService;
import com.multi.personalfridge.recipe.RecipeService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;




@Controller
public class RefrigeratorController {
	
	@Autowired
	private RefrigeratorService refrigeratorService;	
	@Autowired
	private ProductService productService;
	@Autowired
	private RecipeProductService recipeProductService;
	@Autowired
	private RecipeService recipeService;
	
	//나의 냉장고 들어왔을때 메인페이지
	@GetMapping("/mypage/refrigerator")                     //세션 유저변수명
	public ModelAndView getMethodName(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
	    HttpSession session = request.getSession();
	    String user_id = (String) session.getAttribute("userId");
		 if (user_id == "" || user_id == null || user_id.isEmpty()) {
		        return new ModelAndView("redirect:/loginPage");
		    }
		//유저 아이디와 맞는 냉장고아이디를 불러옴 (최초 접속시에는 생성)
		Integer refrigeratorId = refrigeratorService.getRefrigeratorId(user_id);
		if (refrigeratorId == null) {
			refrigeratorService.insertRefrigerator(user_id);
			refrigeratorId = refrigeratorService.getRefrigeratorId(user_id);			
		}
		
		mv.addObject("refrigeratorId", refrigeratorId); 
		
		//냉장고 아이디와 맞는 냉장고의 재료를 리스트로 불러옴
		List<RefrigeratorProdcutDTO> refrigeratorProductList = refrigeratorService.getRefrigeratorProduct(refrigeratorId);
		mv.addObject("refrigeratorProductList", refrigeratorProductList);	
		
		//냉장고 속 제품과 맞는 재료들 불러옴
		ArrayList<ProductDTO> productList = new ArrayList<ProductDTO>();
		ArrayList<Integer> idList = new ArrayList<Integer>();
		for (int i = 0; i < refrigeratorProductList.size(); i++) {
			productList.addAll(productService.getProductsBykeyword("", refrigeratorProductList.get(i).getProduct_name()));			
		}
		
		//중복제거
		for (int i = productList.size() - 1; i >= 0 ; i--) {
			for (Integer integer : idList) {
				if (productList.get(i).getProduct_id().equals(integer)) {
					productList.remove(i);
					if (i > 0) {
						i--;
					}
				}
			}
			idList.add(productList.get(i).getProduct_id());			
		}
		idList.clear();
		
		//불러온 재료가 들어간 레시피의 id를 불러옴
		ArrayList<Integer> recipeIdList = new ArrayList<Integer>();
		for (ProductDTO product : productList) {
			recipeIdList.addAll(recipeProductService.getRecipeIdByProductId(product.getProduct_id()));//프로덕트아이디로 레피시프로덕트에서 레시피아이디 중복제거하고 가져올 서비스 메서드 매퍼 만들어줘야함
		}
	
		//중복제거
		for (int i = recipeIdList.size() - 1; i >= 0 ; i--) {
			for (Integer integer : idList) {
				if (recipeIdList.get(i).equals(integer)) {
					recipeIdList.remove(i);
					if (i > 0) {
						i--;
					}
				}
			}
			idList.add(recipeIdList.get(i));			
		}
		
		ArrayList<RecipeDTO> recipeList = new ArrayList<RecipeDTO>();
		for (Integer recipeId : recipeIdList) {
			recipeList.add(recipeService.getRecipeById(recipeId));
		}
		
		mv.addObject("recipeList", recipeList);
		
		mv.setViewName("refrigeratorTest2");
		
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
	@GetMapping("/mypage/shareProduct")
	public ModelAndView shareProduct(@RequestParam("refrigeratorProductId") int refrigeratorProductId) {
		ModelAndView mv = new ModelAndView();
		RefrigeratorProdcutDTO refrigeratorProdcut = refrigeratorService.getRefrigeratorProductByRefrigeratorProductId(refrigeratorProductId);
		mv.addObject("refrigeratorProdcut",refrigeratorProdcut);
		mv.setViewName("/board/boardInsert");
		return mv;
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
// 레시피추천(재료별로검색할수있게해서 인기있는레시피 2~3가지 추천)// 맞는거 없으면 그냥 인기순, 재료구매시 자동추가 (재료아이디정보를 받아와서 넣어줄것임), 정렬, my냉장고 연결

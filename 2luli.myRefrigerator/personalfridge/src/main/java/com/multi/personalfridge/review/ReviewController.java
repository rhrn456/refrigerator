package com.multi.personalfridge.review;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.personalfridge.dto.PageRequestDTO;
import com.multi.personalfridge.dto.ProductDTO;
import com.multi.personalfridge.dto.ReviewDTO;

import jakarta.servlet.http.HttpSession;


@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	//리뷰 검색/페이징
		@GetMapping("/searchReview")
		@ResponseBody
		public Map<String, Object> getReviewBySearch(@RequestParam String category, @RequestParam String keyword, @RequestParam(defaultValue ="1") int page, @RequestParam int pageSize) {
		    Map<String, Object> parameters = new HashMap<>();
		    List<ReviewDTO> reviews = reviewService.getReviewBykeywordAndPage(category, keyword, page, pageSize);
		    List<ReviewDTO> reviewList = reviewService.getReviewBykeyword(category, keyword);
		    int totalReviews = reviewList.size();
		    int totalPages = (int) Math.ceil((double) totalReviews / pageSize); 
			if(totalPages >5) {
				totalPages = 5;
			}
		    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
											.total(totalReviews)
											.pageAmount(totalPages)
											.currentPage(page)
											.amount(pageSize)
											.build();  
		    parameters.put("reviews", reviews);
		    parameters.put("pageInfo", pageRequestDTO);
		    return parameters;
		}
		
		//리뷰 전체/카테고리 페이징
		@GetMapping("/getReviewByCategory")
		@ResponseBody
		public Map<String, Object> getReviewByCategory(@RequestParam String category, @RequestParam int page, @RequestParam int pageSize) {
		    Map<String, Object> parameters = new HashMap<>();
		    List<ReviewDTO> reviewList = reviewService.getAllReviewList(category);
		    List<ReviewDTO> reviews = reviewService.ReviewAndPage(category, page, pageSize);
		    int totalReviews = reviewList.size();
		    int totalPages = (int) Math.ceil((double) totalReviews / pageSize); 
			if(totalPages >5) {
				totalPages = 5;
			}
		    PageRequestDTO pageRequestDTO = new PageRequestDTO().builder()
											.total(totalReviews)
											.pageAmount(totalPages)
											.currentPage(page)
											.amount(pageSize)
											.build();
		    parameters.put("reviews", reviews);
		    parameters.put("pageInfo", pageRequestDTO);
		    return parameters;
		}
		

			
			//수정하기위에 데이터 던져주기
			@GetMapping("/getreviewInfo")
			@ResponseBody
			public ReviewDTO FindRecipe(@RequestParam int review_id) {
				System.out.println(review_id);
				ReviewDTO review =  reviewService.getReviewById(review_id);
				System.out.println(review);
				return review;
			}
			
			//레시피 리뷰 작성
			@PostMapping("/review/add")
			public String insertReview(String review_content, String recipe_id,HttpSession session) throws UnsupportedEncodingException {
				 String userId = (String) session.getAttribute("userId");			
				    // 로그인 여부 확인
				    if (userId == null) {
				        // 로그인되어 있지 않으면 로그인 페이지로 리다이렉트
				        return "redirect:/login";
				    }
				    
				ReviewDTO review = new ReviewDTO();
				int recipeId = Integer.parseInt(recipe_id);
				review.setRecipe_id(recipeId);
				review.setReview_content(review_content);
				review.setUser_id(userId);
				System.out.println(review);
				boolean result = reviewService.insertReview(review);
				if (result) {
					return "redirect:/recipedetail?recipe_id=" + URLEncoder.encode(String.valueOf(review.getRecipe_id()), "UTF-8");
				} else {
					return "redirect:/register?error=true";
				}

			}
			
			//레시피 리뷰 수정
			@PostMapping("/update")
			@ResponseBody
			public String updateReview(@RequestBody ReviewDTO review) throws UnsupportedEncodingException {
				System.out.println(review);
				boolean result = reviewService.updateReview(review);
				if (result) {
					return "redirect:/recipedetail?recipe_id=" + URLEncoder.encode(String.valueOf(review.getRecipe_id()), "UTF-8");
				} else {
					return "redirect:/register?error=true";
				}
			}
			
			//리뷰 삭제
			@GetMapping("/delete/{review_id}")
			public String deleteReview(@PathVariable int review_id,
										@RequestParam int recipe_id) throws UnsupportedEncodingException {
				boolean result = reviewService.deleteReview(review_id);
				if (result) {
					return "redirect:/recipedetail?recipe_id=" + URLEncoder.encode(String.valueOf(recipe_id), "UTF-8");
				} else {
					return "redirect:/register?error=true";
				}
			}
			
}

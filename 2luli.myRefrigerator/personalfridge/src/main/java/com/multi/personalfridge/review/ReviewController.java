package com.multi.personalfridge.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.personalfridge.dto.PageRequestDTO;
import com.multi.personalfridge.dto.ProductDTO;
import com.multi.personalfridge.dto.ReviewDTO;


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
		
		//상품 삭제
			@GetMapping("/reviewdeleteadmin/{review_id}")
			public String ReviewDeleteAdmin(@PathVariable int review_id) {
				System.out.println(review_id);
				boolean result = reviewService.reviewDeletById(review_id);
				if(result) {
					return "redirect:/ReviewRecipeAdmin";
				}else {
				return "error";
				}
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
}

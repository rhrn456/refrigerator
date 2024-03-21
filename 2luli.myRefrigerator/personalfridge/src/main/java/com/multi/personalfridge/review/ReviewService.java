package com.multi.personalfridge.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.personalfridge.dto.ReviewDTO;

@Service
public class ReviewService {
	@Autowired
	ReviewMapper reviewMapper;
	
	public List<ReviewDTO> getAllReviewList(String category) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("category", category);
		return reviewMapper.getAllReviewList(parameters);
	}
	
	public List<ReviewDTO> ReviewAndPage(String category, int page, int pageSize) {
		int offset = (page - 1) * pageSize;
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("category", category);
		parameters.put("pageSize", pageSize);
		parameters.put("offset", offset);
		return reviewMapper.ReviewAndPage(parameters);
	}

	public List<ReviewDTO> getReviewBykeyword(String category, String keyword) {
		 Map<String, Object> parameters = new HashMap<>();
	    parameters.put("category", category);
	    parameters.put("keyword", keyword);
		return reviewMapper.getReviewBykeyword(parameters);
	}

	public List<ReviewDTO> getReviewBykeywordAndPage(String category, String keyword, int page, int pageSize) {
		int offset = (page - 1) * pageSize;
	    Map<String, Object> parameters = new HashMap<>();
	    parameters.put("category", category);
	    parameters.put("keyword", keyword);
	    parameters.put("pageSize", pageSize);
	    parameters.put("offset", offset);
		return reviewMapper.getReviewBykeywordAndPage(parameters);
	}
	
	//리뷰 삭제하기
	public boolean reviewDeletById(int review_id) {	
		try {
			reviewMapper.reviewDeletById(review_id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}
	
	//리뷰 가져오기
	public ReviewDTO getReviewById(int review_id) {
		
		return reviewMapper.getReviewById(review_id);
	}

	public List<ReviewDTO> getReviewByRecipeId(int recipe_id) {
		// TODO Auto-generated method stub
		return reviewMapper.getReviewByRecipeId(recipe_id);
	}

	public boolean insertReview(ReviewDTO review) {
		try {
			reviewMapper.insertReview(review);
			return true; 
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}

	public boolean updateReview(ReviewDTO review) {
		try {
			reviewMapper.updateReview(review);
			return true; 
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}

	public boolean deleteReview(int review_id) {
		try {
			  reviewMapper.deleteReview(review_id);
			return true; 
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		}
	}


}

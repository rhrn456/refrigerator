package com.multi.personalfridge.review;

import java.util.List;
import java.util.Map;

import com.multi.personalfridge.dto.ReviewDTO;

public interface ReviewMapper {


	List<ReviewDTO> getAllReviewList(Map parameters);

	List<ReviewDTO> ReviewAndPage(Map parameters);

	List<ReviewDTO> getReviewBykeyword(Map parameters);

	List<ReviewDTO> getReviewBykeywordAndPage(Map parameters);

	int reviewDeletById(int review_id);

	ReviewDTO getReviewById(int review_id);
}

package com.spring.project.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.board.model.ReviewVO;
import com.spring.project.board.repository.IReviewRepository;

@Service
public class ReviewService implements IBoardService{
	
	@Autowired
	IReviewRepository reviewRepository;
	
	public ArrayList<ReviewVO> getReviewList(){
		return reviewRepository.getReviewList();
	}
	
	public ReviewVO getReview(String member_id) {
		return reviewRepository.getReview(member_id);
	}
	
	public void insertReview(String member_id,int product_id, int order_product_count, String review_content, byte[] review_img, int review_score) {
		reviewRepository.insertReview(member_id, product_id, order_product_count, review_content, review_img, review_score);
	}
	
	public void deleteReview(String member_id, int product_id) {
		reviewRepository.deleteReview(member_id, product_id);
	}
	
	public void updateReview(String member_id, int product_id) {
		reviewRepository.updateReview(member_id, product_id);
	}
}

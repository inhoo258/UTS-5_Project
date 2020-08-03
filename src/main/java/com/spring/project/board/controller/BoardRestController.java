package com.spring.project.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.project.board.model.ReviewVO;
import com.spring.project.board.service.EventService;
import com.spring.project.board.service.NoticeService;
import com.spring.project.board.service.QnAService;
import com.spring.project.board.service.ReviewService;

@RestController
@RequestMapping("/board/rest")
public class BoardRestController {
	
	@Autowired
	QnAService qnAService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	EventService eventService;
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping("/reviewList")
	public List<ReviewVO> getReviewsByProductId(@RequestParam("product_id") int product_id, @RequestParam("page")int page){
		List<ReviewVO> reviewList = reviewService.getReviewList(product_id,page);
		return reviewList;
	}

}

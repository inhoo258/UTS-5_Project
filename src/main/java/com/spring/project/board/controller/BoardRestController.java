package com.spring.project.board.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
	@PostMapping("/review/upload")
	public void reviewInsert(@RequestParam(value = "file", required = false) MultipartFile file, ReviewVO reviewVO, int order_number) {
		System.out.println("review new in");
		if (file != null&&!file.isEmpty()) {
			try {
				reviewVO.setReview_img(file.getBytes());
				reviewVO.setReview_img_name(file.getOriginalFilename());
			} catch (IOException e) {
				System.out.println("reivew without image");
			}
		}
		reviewService.insertReview(reviewVO, order_number);
		System.out.println(reviewVO.toString());
	}

}

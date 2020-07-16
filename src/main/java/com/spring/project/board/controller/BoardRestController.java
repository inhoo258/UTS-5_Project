package com.spring.project.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.spring.project.board.service.IBoardService;

@RestController
@RequestMapping("/board/rest")
public class BoardRestController {
	@Autowired
	@Qualifier("eventService")
	IBoardService eventService;
	@Autowired
	@Qualifier("noticeService")
	IBoardService noticeService;
	@Autowired
	@Qualifier("qnAService")
	IBoardService qnAService;
	@Autowired
	@Qualifier("reviewService")
	IBoardService reviewService;
	
	
	
	
	
	

}

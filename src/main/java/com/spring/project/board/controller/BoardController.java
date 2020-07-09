package com.spring.project.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.project.board.service.IBoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
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

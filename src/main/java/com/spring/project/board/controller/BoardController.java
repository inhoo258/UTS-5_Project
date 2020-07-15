package com.spring.project.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.project.board.service.NoticeService;

@Controller
@RequestMapping("/board")
public class BoardController {
//	@Autowired
//	@Qualifier("eventService")
//	IBoardService eventService;
//	@Autowired
//	@Qualifier("noticeService")
//	IBoardService noticeService;
//	@Autowired
//	@Qualifier("qnAService")
//	IBoardService qnAService;
//	@Autowired
//	@Qualifier("reviewService")
//	IBoardService reviewService;
	@Autowired
	NoticeService noticeService;
	
	@GetMapping("/notice/list")
	public void noticeList(Model model) {
		model.addAttribute("noticeList",noticeService.getNoticeList());
	}
	@GetMapping("/notice/{notice_rn}")
	public String noticeView(Model model, @PathVariable("notice_rn")int notice_rn) {
		model.addAttribute("notice",noticeService.getNotice(notice_rn));
		int listSize = noticeService.getListSize();
		model.addAttribute("listSize",listSize);
		System.out.println("listSize : "+listSize);
		System.out.println("notice_rn : "+notice_rn);
		return "board/notice/view";
	}
}

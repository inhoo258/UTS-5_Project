package com.spring.project.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.project.board.service.EventService;
import com.spring.project.board.service.NoticeService;
import com.spring.project.board.service.QnAService;
import com.spring.project.board.service.ReviewService;
import com.spring.project.common.PagingManager;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	QnAService qnAService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	EventService eventService;
	@Autowired
	NoticeService noticeService;
	
	//공지사항 게시판
	@GetMapping("/notice/list")
	public void noticeList(@RequestParam(value="page", required = false, defaultValue = "1")int page,Model model) {
		model.addAttribute("noticeList",noticeService.getNoticeList(page));
		PagingManager pagingManager = new PagingManager(noticeService.getTotalCount(), page);
//		System.out.println("now page : "+pagingManager.getNowPage());
//		System.out.println("now block : "+pagingManager.getNowBlock());
//		System.out.println("total page : "+pagingManager.getTotalPage());
//		System.out.println("total block : "+pagingManager.getTotalBlock());
		model.addAttribute("pagingManager",pagingManager);
	}
	@GetMapping("/notice/{notice_rn}")
	public String noticeView(Model model, @PathVariable("notice_rn")int notice_rn) {
		model.addAttribute("notice",noticeService.getNotice(notice_rn));
		int totalCount = noticeService.getTotalCount();
		model.addAttribute("totalCount",totalCount);
//		System.out.println("totalCount : "+totalCount);
//		System.out.println("notice_rn : "+notice_rn);
		return "board/notice/view";
	}
	@GetMapping("/notice/form")
	public void noticeForm() {
		
	}
	
	//이벤트 게시판
	@GetMapping("/event/list")
	public void eventList(@RequestParam(value="page", required = false, defaultValue = "1")int page, Model model) {
		model.addAttribute("eventList",eventService.getEventList(page));
		PagingManager pagingManager = new PagingManager(eventService.getTotalCount(), page);
		model.addAttribute("pagingManager",pagingManager);
	}
	
	@GetMapping("/event/{event_rn}")
	public String eventView(Model model, @PathVariable("event_rn")String event_rn) {
		int totalCount = eventService.getTotalCount();
		model.addAttribute("event",eventService.getEvent(event_rn));
		model.addAttribute("totalCount",totalCount);
		return "board/event/view";
	}
	
	@GetMapping("/event/form")
	public void eventForm() {
		
	}
	
	//qna 게시판
	@GetMapping("/qna/list")
	public void qnaList(@RequestParam(value="page", required = false, defaultValue = "1")int page, Model model) {
		model.addAttribute("eventList",eventService.getEventList(page));
		PagingManager pagingManager = new PagingManager(eventService.getTotalCount(), page);
		model.addAttribute("pagingManager",pagingManager);
	}
	
	@GetMapping("/qna/form")
	public void qnaForm() {
		
	}
	
	//리뷰 게시판
	@GetMapping("/review/list")
	public void reviewList(@RequestParam(value="page", required = false, defaultValue = "1")int page, Model model) {
		model.addAttribute("eventList",eventService.getEventList(page));
		PagingManager pagingManager = new PagingManager(eventService.getTotalCount(), page);
		model.addAttribute("pagingManager",pagingManager);
	}
	
	@GetMapping("/review/{member_id}")
	public String reviewView(Model model, @PathVariable("member_id")String member_id) {
		int totalCount = reviewService.getTotalCount();
		model.addAttribute("review",reviewService.getReview(member_id));
		model.addAttribute("totalCount",totalCount);
		return "board/event/view";
	}
	
	@GetMapping("/review/form")
	public void reviewForm() {
		
	}
	
}

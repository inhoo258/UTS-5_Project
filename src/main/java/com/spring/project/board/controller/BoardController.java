package com.spring.project.board.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.project.board.model.NoticeVO;
import com.spring.project.board.service.NoticeService;
import com.spring.project.common.PagingManager;

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
	public void noticeList(@RequestParam(value = "page", required = false, defaultValue = "1") int page, Model model) {
		System.out.println("requested page : "+page);
		model.addAttribute("noticeList", noticeService.getNoticeList(page));
		PagingManager pagingManager = new PagingManager(noticeService.getTotalCount(), page);
		System.out.println("now page : " + pagingManager.getNowPage());
		System.out.println("end page : " + pagingManager.getEndPage());
		System.out.println("now block : " + pagingManager.getNowBlock());
		System.out.println("total page : " + pagingManager.getTotalPage());
		System.out.println("total block : " + pagingManager.getTotalBlock());
		model.addAttribute("pagingManager", pagingManager);
	}

	@GetMapping("/notice/{notice_rn}")
	public String noticeView(Model model, @PathVariable("notice_rn") int notice_rn) {
		model.addAttribute("notice", noticeService.getNotice(notice_rn));
		int totalCount = noticeService.getTotalCount();
		model.addAttribute("totalCount", totalCount);
		System.out.println("totalCount : " + totalCount);
		System.out.println("notice_rn : " + notice_rn);
		return "board/notice/view";
	}

	@GetMapping("/notice/form")
	public void noticeForm() {
	}

	@PostMapping("/notice/new")
	public String noticeInsert(@ModelAttribute NoticeVO noticeVO,
			@RequestParam(value = "file", required = false) MultipartFile file) {
		if (file != null&&!file.isEmpty()) {
			try {
				noticeVO.setNotice_file(file.getBytes());
				System.out.println("getBytes : "+file.getBytes());
				noticeVO.setNotice_file_name(file.getOriginalFilename());
				System.out.println("originalFileName : "+file.getOriginalFilename());
			} catch (IOException e) {
			}
			noticeService.insertNoticeWithFile(noticeVO);
		}
		else noticeService.insertNotice(noticeVO);
		return "redirect:/board/notice/list";
	}
}

package com.spring.project.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.board.model.NoticeVO;
import com.spring.project.board.repository.INoticeRepository;

@Service
public class NoticeService implements IBoardService{

	@Autowired
	INoticeRepository noticeRepository;
	
	public ArrayList<NoticeVO> getNoticeList(){
		return noticeRepository.getNoticeList();
	}
	
	public NoticeVO getNotice(String notice_title) {
		return noticeRepository.getNotice(notice_title);
	}
	
	public void insertNotice(String notice_content, String notice_title, String notice_views) {
		noticeRepository.insertNotice(notice_content, notice_title, notice_views);
	}
	
	public void updateNotice(String notice_content) {
		noticeRepository.updateNotice(notice_content);
	}
	
	public void updateViews() {
		noticeRepository.updateViews();
	}
}

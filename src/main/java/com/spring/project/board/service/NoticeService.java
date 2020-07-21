package com.spring.project.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.board.model.NoticeVO;
import com.spring.project.board.repository.INoticeRepository;

@Service
public class NoticeService implements IBoardService{

	@Autowired
	INoticeRepository noticeRepository;
	
	public List<NoticeVO> getNoticeList(int page){
		int end = page*10;
		int start = end-9;
		return noticeRepository.getNoticeList(start,end);
	}
	
	public void updateNotice(String notice_content) {
		noticeRepository.updateNotice(notice_content);
	}
	
	public NoticeVO getNotice(int notice_rn) {
		NoticeVO notice = noticeRepository.getNotice(notice_rn);
		noticeRepository.updateViews(notice.getNotice_number());
		return notice;
	}

	public int getTotalCount() {
		return noticeRepository.getTotalCount();
	}

	public void insertNotice(NoticeVO noticeVO) {
		noticeVO.setNotice_number(noticeRepository.getMaxNoticeNumber()+1);
		noticeRepository.insertNotice(noticeVO);
	}

	public void insertNoticeWithFile(NoticeVO noticeVO) {
		noticeVO.setNotice_number(noticeRepository.getMaxNoticeNumber()+1);
		noticeRepository.insertNoticeWithFile(noticeVO);
	}
}

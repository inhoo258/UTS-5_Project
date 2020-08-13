package com.spring.project.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.board.model.NoticeVO;
import com.spring.project.board.repository.INoticeRepository;

@Service
public class NoticeService {

	@Autowired
	INoticeRepository noticeRepository;
	
	public List<NoticeVO> getNoticeList(int page){
		int end = page*10;
		int start = end-9;
		return noticeRepository.getNoticeList(start,end);
	}
	
	// 공지사항 조회 시 
	public NoticeVO getNotice(int notice_rn) {
		NoticeVO notice = noticeRepository.getNotice(notice_rn);
		noticeRepository.updateViews(notice.getNotice_number());
		return notice;
	}
	
	//공지사항 이전/다음 페이지 처리 
	public String getTitle(int notice_rn) {
		return noticeRepository.getTitle(notice_rn);
	}
	
	// 공지사항 수정 시 정보 가지고 오기
	public NoticeVO getNoticeInfo(int notice_rn) {
		return noticeRepository.getNotice(notice_rn);
	}

	//공지사항 수정
	public void updateView(NoticeVO noticeVo) {
		noticeRepository.updateView(noticeVo);
	}
	
	// 공지사항 view 삭제 
	public void deleteView(int notice_number) {
		noticeRepository.deleteView(notice_number);
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

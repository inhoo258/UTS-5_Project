package com.spring.project.board.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import com.spring.project.board.model.NoticeVO;

@Repository
public interface INoticeRepository {
	
	//전체 공지사항 목록
	@Select("select * from notice_board order by rownum desc")
	public ArrayList<NoticeVO> getNoticeList();
	
	//공지사항 하나 클릭(제목)
	@Select("select * from notice_board where notice_title=#{notice_title}")
	public NoticeVO getNotice(String notice_title);
	
	//공지사항 등록
	@Insert("insert into notice_board values(#{notice_content},sysdate,#{notice_title},#{notice_views})")
	public void insertNotice(String notice_content, String notice_title, String notice_views);
	
	//공지사항 내용 수정
	@Update("update notice_board set notice_content=#{notice_content}")
	public void updateNotice(String notice_content);
	
	//공지사항 조회수 +1증가
	@Update("update notice_board set notice_views=notice_views+1")
	public void updateViews();
}

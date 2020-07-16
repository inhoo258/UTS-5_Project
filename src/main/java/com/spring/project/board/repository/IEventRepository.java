package com.spring.project.board.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import com.spring.project.board.model.EventVO;

@Repository
public interface IEventRepository {
	
	//전체 이벤트 목록
	@Select("select * from event_board")
	public ArrayList<EventVO> getEventList();
	
	//이벤트 제목 클릭
	@Select("select * from event_board where event_title=#{event_title}")
	public EventVO getEvent(String event_title);
	
	//이벤트 등록(seller)만 가능
	@Insert("insert into event_board values(#{member_id},#{event_content},#{event_img},sysdate,0,#{event_group},"
			+ "#{event_step},#{event_title})")
	public void insertEvent(String member_id, String event_content, byte[] event_img, int event_group, 
			int event_step, String event_title);
	
	//이벤트 내용 수정
	@Update("update event_board set event_content=#{event_content}")
	public void updateEvent(String evnet_content);
	
	//이벤트 조회수 +1 증가
	@Update("update event_board set event_views=event_views+1")
	public void updateViews();
}

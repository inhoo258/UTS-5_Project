package com.spring.project.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.board.model.EventVO;
import com.spring.project.board.repository.IEventRepository;

@Service
public class EventService implements IBoardService {

	@Autowired
	IEventRepository eventRepository;

	public ArrayList<EventVO> getEventList(int page){
		int end = page*10;
		int start = end-9;
		return eventRepository.getEventList(start, end);
	}

	public EventVO getEvent(String event_title) {
		return eventRepository.getEvent(event_title);
	}

	public void insertEvent(String member_id, String event_content, byte[] event_img, int event_group, int event_step,
			String event_title) {
		eventRepository.insertEvent(member_id, event_content, event_img, event_group, event_step, event_title);
	}

	public void updateEvent(String evnet_content) {
		eventRepository.updateEvent(evnet_content);
	}

	public void updateViews() {
		eventRepository.updateViews();
	}

	public int getTotalCount() {
		return eventRepository.getTotalCount();
	}
}

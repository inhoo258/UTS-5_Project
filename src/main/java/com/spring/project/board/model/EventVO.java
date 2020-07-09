package com.spring.project.board.model;

import java.sql.Date;

public class EventVO {
	private String member_id;
	private String event_title;
	private String event_content;
	private byte[] event_img;
	private Date event_date;
	private int event_views;
	private int event_group;
	private int event_step;

	public String getEvent_title() {
		return event_title;
	}

	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}

	public int getEvent_views() {
		return event_views;
	}

	public void setEvent_views(int event_views) {
		this.event_views = event_views;
	}

	public int getEvent_group() {
		return event_group;
	}

	public void setEvent_group(int event_group) {
		this.event_group = event_group;
	}

	public int getEvent_step() {
		return event_step;
	}

	public void setEvent_step(int event_step) {
		this.event_step = event_step;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getEvent_content() {
		return event_content;
	}

	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}

	public byte[] getEvent_img() {
		return event_img;
	}

	public void setEvent_img(byte[] event_img) {
		this.event_img = event_img;
	}

	public Date getEvent_date() {
		return event_date;
	}

	public void setEvent_date(Date event_date) {
		this.event_date = event_date;
	}
}

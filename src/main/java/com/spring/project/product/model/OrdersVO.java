package com.spring.project.product.model;

import java.sql.Date;

public class OrdersVO {
	private String member_id;
	private int product_id; 
	private Date order_date;
	private String order_receiver_address;
	private String order_receiver_name;
	private String order_receiver_tel;
	private int order_product_count;
	private int order_price;
	private String order_request;
	private String order_status;
	

	@Override
	public String toString() {
		return "OrdersVO [member_id=" + member_id + ", product_id=" + product_id + ", order_date=" + order_date
				+ ", order_receiver_address=" + order_receiver_address + ", order_receiver_name=" + order_receiver_name
				+ ", order_receiver_tel=" + order_receiver_tel + ", order_product_count=" + order_product_count
				+ ", order_price=" + order_price + ", order_request=" + order_request + ", order_status=" + order_status
				+ "]";
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public int getOrder_price() {
		return order_price;
	}

	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}

	public String getOrder_request() {
		return order_request;
	}

	public void setOrder_request(String order_request) {
		this.order_request = order_request;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getOrder_receiver_name() {
		return order_receiver_name;
	}

	public void setOrder_receiver_name(String order_receiver_name) {
		this.order_receiver_name = order_receiver_name;
	}

	public String getOrder_receiver_tel() {
		return order_receiver_tel;
	}

	public void setOrder_receiver_tel(String order_receiver_tel) {
		this.order_receiver_tel = order_receiver_tel;
	}

	public int getOrder_product_count() {
		return order_product_count;
	}

	public void setOrder_product_count(int order_product_count) {
		this.order_product_count = order_product_count;
	}

	public String getOrder_receiver_address() {
		return order_receiver_address;
	}

	public void setOrder_receiver_address(String order_receiver_address) {
		this.order_receiver_address = order_receiver_address;
	}
}

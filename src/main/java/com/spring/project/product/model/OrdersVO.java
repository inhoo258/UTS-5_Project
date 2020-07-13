package com.spring.project.product.model;

import java.sql.Date;

public class OrdersVO {
	private String member_id;
	private int product_id; 
	private Date order_date;
	private String order_receiver_addr;
	private String order_receiver_name;
	private String order_receiver_tel;
	private int order_product_count;
	private int order_price;
	private String order_request;

	//주문서 작성(회원정보)를 가져오기 위한 변수 설정
	private String member_name;  
	private String member_tel; 
	private String member_addr;
	private String member_email;
	
	//주문서 작성(회원장바구니 정보)를 가져오기 위한 변수 설정
	private int cart_product_count;


	private String product_info;
	private String product_name;
	private String product_price;
	private String seller_name;
	
	//주문서 작성 (바로구매 정보)를 가져오기 위한 변수 설정
	private byte[] product_img;
	
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	
	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}

	public String getMember_addr() {
		return member_addr;
	}

	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}

	public int getCart_product_count() {
		return cart_product_count;
	}

	public void setCart_product_count(int cart_product_count) {
		this.cart_product_count = cart_product_count;
	}

	public String getProduct_info() {
		return product_info;
	}

	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_price() {
		return product_price;
	}

	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}

	public String getSeller_name() {
		return seller_name;
	}

	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
	}

	public byte[] getProduct_img() {
		return product_img;
	}

	public void setProduct_img(byte[] product_img) {
		this.product_img = product_img;
	}

	public int getProduct_count() {
		return product_count;
	}

	public void setProduct_count(int product_count) {
		this.product_count = product_count;
	}

	public int getProduct_weight() {
		return product_weight;
	}

	public void setProduct_weight(int product_weight) {
		this.product_weight = product_weight;
	}

	public String getProduct_img_name() {
		return product_img_name;
	}

	public void setProduct_img_name(String product_img_name) {
		this.product_img_name = product_img_name;
	}

	private int product_count;
	private int product_weight;
	private String product_img_name;
	
	
	
	

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

	public String getOrder_receiver_addr() {
		return order_receiver_addr;
	}

	public void setOrder_receiver_addr(String order_receiver_addr) {
		this.order_receiver_addr = order_receiver_addr;
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
}

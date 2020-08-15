package com.spring.project.product.model;

import java.sql.Date;

public class OrderedVO {
	private int order_group_number;
	private Date order_date;
	private int ordered_price;
	private String orderer_name;
	private int order_delivery_price;
	private String order_receiver_name;
	private String order_receiver_main_address;
	private String order_receiver_sub_address;
	private String order_receiver_tel;
	private String order_request;
	private String seller_bank_account;
	private String seller_bank_name;
	private String seller_company_name;
	
	
	@Override
	public String toString() {
		return "OrderedVO [order_group_number=" + order_group_number + ", order_date=" + order_date + ", ordered_price="
				+ ordered_price + ", orderer_name=" + orderer_name + ", order_delivery_price=" + order_delivery_price
				+ ", order_receiver_name=" + order_receiver_name + ", order_receiver_main_address="
				+ order_receiver_main_address + ", order_receiver_sub_address=" + order_receiver_sub_address
				+ ", order_receiver_tel=" + order_receiver_tel + ", order_request=" + order_request
				+ ", seller_bank_account=" + seller_bank_account + ", seller_bank_name=" + seller_bank_name
				+ ", seller_company_name=" + seller_company_name + "]";
	}

	public String getOrderer_name() {
		return orderer_name;
	}

	public void setOrderer_name(String orderer_name) {
		this.orderer_name = orderer_name;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public int getOrder_group_number() {
		return order_group_number;
	}

	public void setOrder_group_number(int order_group_number) {
		this.order_group_number = order_group_number;
	}

	public int getOrdered_price() {
		return ordered_price;
	}

	public void setOrdered_price(int ordered_price) {
		this.ordered_price = ordered_price;
	}
	public int getOrder_delivery_price() {
		return order_delivery_price;
	}
	public void setOrder_delivery_price(int order_delivery_price) {
		this.order_delivery_price = order_delivery_price;
	}
	public String getOrder_receiver_name() {
		return order_receiver_name;
	}
	public void setOrder_receiver_name(String order_receiver_name) {
		this.order_receiver_name = order_receiver_name;
	}
	public String getOrder_receiver_main_address() {
		return order_receiver_main_address;
	}
	public void setOrder_receiver_main_address(String order_receiver_main_address) {
		this.order_receiver_main_address = order_receiver_main_address;
	}
	public String getOrder_receiver_sub_address() {
		return order_receiver_sub_address;
	}
	public void setOrder_receiver_sub_address(String order_receiver_sub_address) {
		this.order_receiver_sub_address = order_receiver_sub_address;
	}
	public String getOrder_receiver_tel() {
		return order_receiver_tel;
	}
	public void setOrder_receiver_tel(String order_receiver_tel) {
		this.order_receiver_tel = order_receiver_tel;
	}
	public String getOrder_request() {
		return order_request;
	}
	public void setOrder_request(String order_request) {
		this.order_request = order_request;
	}
	public String getSeller_bank_account() {
		return seller_bank_account;
	}
	public void setSeller_bank_account(String seller_bank_account) {
		this.seller_bank_account = seller_bank_account;
	}
	public String getSeller_bank_name() {
		return seller_bank_name;
	}
	public void setSeller_bank_name(String seller_bank_name) {
		this.seller_bank_name = seller_bank_name;
	}
	public String getSeller_company_name() {
		return seller_company_name;
	}
	public void setSeller_company_name(String seller_company_name) {
		this.seller_company_name = seller_company_name;
	}
	
}

package com.spring.project.product.model;

public class CartVO {
	private String member_id;
	private int product_id;
	private int cart_product_count;
	private String product_info;
	private String product_name;
	private String product_price;
	private String seller_name;
	

	public String getSeller_name() {
		return seller_name;
	}

	public void setSeller_name(String seller_name) {
		this.seller_name = seller_name;
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

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getCart_product_count() {
		return cart_product_count;
	}

	public void setCart_product_count(int cart_product_count) {
		this.cart_product_count = cart_product_count;
	}
}

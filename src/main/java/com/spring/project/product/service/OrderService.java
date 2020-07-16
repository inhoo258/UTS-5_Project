package com.spring.project.product.service;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.product.model.OrdersVO;
import com.spring.project.product.repository.IOrderRepository;

@Service
public class OrderService{
	
	@Autowired
	IOrderRepository orderRepository;
	
	public ArrayList<OrdersVO> getOrderList(){
		return orderRepository.getOrderList();
	}
	
	public OrdersVO getOrderSheet(String member_id) {
		return orderRepository.getOrderSheet(member_id);
	}
	
	public OrdersVO paymentInOrder(String member_id) {
		return orderRepository.paymentInOrder(member_id);
	}
	public void insertOrder(String member_id, int product_id, Date order_date, String order_receiver_address,
			String order_receiver_name, String order_receiver_tel, int order_receiver_count, int order_price,
			String order_request) {
//		orderRepository.insertOrder(member_id, product_id, order_date, order_receiver_address, order_receiver_name, order_receiver_tel, order_receiver_count, order_price, order_request);
	}
	public void deleteOrder(String member_id, int product_id) {
		orderRepository.deleteOrder(member_id, product_id);
	}
	public void deliveryOrder(String member_id, int product_id, String order_status) {
		orderRepository.deliveryOrder(member_id, product_id, order_status);
	}
}

package com.spring.project.product.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.product.model.OrdersVO;
import com.spring.project.product.repository.IOrderRepository;

@Service
public class OrderService{
	
	@Autowired
	IOrderRepository orderRepository;
	
	//결제완료 된 주문 내역 
	public List<List<OrdersVO>> getOrderList(String member_id) {
		List<OrdersVO> totalList = orderRepository.getOrderList(member_id);
		List<OrdersVO> orderListByGroupNum = new ArrayList<OrdersVO>();
		List<List<OrdersVO>> orderList = new ArrayList<List<OrdersVO>>();
		for (int i = 0; i < totalList.size(); i++) {
			System.out.println(totalList.get(i).toString());
			if(i==0) {
				orderListByGroupNum.add(totalList.get(i));
				if(totalList.size()==1)orderList.add(orderListByGroupNum);
			}
			else if(totalList.get(i-1).getOrder_group_number()==totalList.get(i).getOrder_group_number()) {
				orderListByGroupNum.add(totalList.get(i));
				if(i==totalList.size()-1)orderList.add(orderListByGroupNum);
			}
			else {
				orderList.add(orderListByGroupNum);
				orderListByGroupNum = new ArrayList<OrdersVO>();
				orderListByGroupNum.add(totalList.get(i));
				if(i==totalList.size()-1)orderList.add(orderListByGroupNum);
			}
		}
		return orderList; 
	}
	
	public void paymentInOrder(OrdersVO ordersVO,int[] product_id,int[] order_product_count,int[] order_price) {
		for (int i = 0; i < product_id.length; i++) {
			System.out.println("Start : " + i);
			ordersVO.setProduct_id(product_id[i]);
			ordersVO.setOrder_product_count(order_product_count[i]);
			ordersVO.setOrder_price(order_price[i]);
			orderRepository.paymentInOrder(ordersVO);
		}
	}
//	public void deleteOrder(String member_id, int product_id) {
//		orderRepository.deleteOrder(member_id, product_id);
//	}
	public void deliveryOrder(String member_id, int product_id, String order_status) {
		orderRepository.deliveryOrder(member_id, product_id, order_status);
	}

	public OrdersVO getOrderByOrderNumber(int order_number) {
		return orderRepository.getOrderByOrderNumber(order_number);
	}

	public void deleteOrder(int order_number) {
		orderRepository.deleteOrder(order_number);
	}
}

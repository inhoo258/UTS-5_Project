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
//	public List<OrdersVO> getOrderList(String member_id){
//		return orderRepository.getOrderList(member_id);
//	}
	public void paymentInOrder(OrdersVO ordersVO,int[] product_id,int[] order_product_count,int[] order_price, String[] order_requests, String[] order_statuses) {
		ordersVO.setOrder_group_number(orderRepository.getMaxOrderGroupNumber()+1);
		for (int i = 0; i < product_id.length; i++) {
			System.out.println("Start : " + i);
			ordersVO.setOrder_number(orderRepository.getMaxOrderNumber()+1);
			ordersVO.setProduct_id(product_id[i]);
			ordersVO.setOrder_product_count(order_product_count[i]);
			ordersVO.setOrder_price(order_price[i]);
			ordersVO.setOrder_request(order_requests[i]);
			ordersVO.setOrder_status(order_statuses[i]);
			System.out.println(ordersVO);
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

	public void deleteOrder(int order_group_number, String member_id) {
		orderRepository.deleteOrder(order_group_number, member_id);
	}
	public List<List<OrdersVO>> getOrder(String member_id, int order_group_number) {
		List<OrdersVO> totalList = orderRepository.getOrder(member_id, order_group_number);
		List<OrdersVO> orderListByCompanyName = new ArrayList<OrdersVO>();
		List<List<OrdersVO>> orderList = new ArrayList<List<OrdersVO>>();
		for (int i = 0; i < totalList.size(); i++) {
			System.out.println(totalList.get(i).toString());
			if(i==0) {
				orderListByCompanyName.add(totalList.get(i));
				if(totalList.size()==1)orderList.add(orderListByCompanyName);
			}
			else if(totalList.get(i-1).getSeller_company_name().equals(totalList.get(i).getSeller_company_name())) {
				orderListByCompanyName.add(totalList.get(i));
				if(i==totalList.size()-1)orderList.add(orderListByCompanyName);
			}
			else {
				orderList.add(orderListByCompanyName);
				orderListByCompanyName = new ArrayList<OrdersVO>();
				orderListByCompanyName.add(totalList.get(i));
				if(i==totalList.size()-1)orderList.add(orderListByCompanyName);
			}
		}
		return orderList; 

	}
	public int getTotalCount(String member_id) {
		return orderRepository.getTotalCount(member_id);
	}
	public List<OrdersVO> getMyOrderList(String member_id) {
		return orderRepository.getMyOrderList(member_id);
	}
	public Object getOrderResult(int order_group_number) {
		return orderRepository.getOrderResult(order_group_number);
	}
}

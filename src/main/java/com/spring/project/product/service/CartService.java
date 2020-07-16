package com.spring.project.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.product.model.CartVO;
import com.spring.project.product.repository.ICartRepository;

@Service
public class CartService{
	
	@Autowired
	ICartRepository cartRepository;
	
	public List<CartVO> getCart(String member_id) {
		return cartRepository.getCart(member_id);
	}
	
	public void deleteCart(String member_id, int[] product_ids){
		for (int i = 0; i < product_ids.length; i++) {
			cartRepository.deleteCart(member_id, product_ids[i]);
		}
	}
	public void insertCart(String member_id, int product_id, int cart_product_count) {
		cartRepository.insertCart(member_id, product_id, cart_product_count);
	}
	public void updateCart(String member_id, List<Integer> product_id, List<Integer> cart_product_count) {
		for (int i = 0; i < product_id.size(); i++) {
			cartRepository.updateCart(member_id,product_id.get(i),cart_product_count.get(i));
		}
	}
}

package com.spring.project.product.service;

import java.util.ArrayList;
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
	public int insertCart(String member_id, int product_id, int cart_product_count) throws Exception {
		if(cartRepository.getMemberId(member_id,product_id)==null) {
			cartRepository.insertCart(member_id, product_id, cart_product_count);
			return 1;
		}else return 0;
	}
	public void updateCart(String member_id, List<Integer> product_ids, List<Integer> cart_product_counts) {
		for (int i = 0; i < product_ids.size(); i++) {
			cartRepository.updateCart(member_id,product_ids.get(i),cart_product_counts.get(i));
		}
	}

	public int checkCart(String member_id, int product_id) {
		if(cartRepository.getMemberId(member_id, product_id)==null)return 1;
		else return 0;
	}

	public List<CartVO> getSelectedCart(String member_id, int[] product_ids) {
		List<CartVO> cartList = new ArrayList<CartVO>();
		for (int i = 0; i < product_ids.length; i++) {
			cartList.add(cartRepository.getSelectedCart(member_id,product_ids[i]));
		}
		return cartList;
	}
}

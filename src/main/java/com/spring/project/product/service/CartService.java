package com.spring.project.product.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.product.model.CartVO;
import com.spring.project.product.repository.ICartRepository;

@Service
public class CartService implements IProductService{
	
	@Autowired
	ICartRepository cartRepository;
	
	public ArrayList<CartVO> getCartList(){
		return cartRepository.getCartList();
	}
	
	public CartVO getCart(String member_id) {
		return cartRepository.getCart(member_id);
	}
	
	public void deleteCart(String member_id, int product_id){
		cartRepository.deleteCart(member_id, product_id);
	}
	
	public void insertCart(String member_id, int product_id, int cart_product_count) {
		cartRepository.insertCart(member_id, product_id, cart_product_count);
	}
}

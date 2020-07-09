package com.spring.project.product.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.spring.project.product.model.CartVO;

@Repository
public interface ICartRepository {

	//장바구니 전체 목록(모든 client)
	@Select("select * from cart")
	public ArrayList<CartVO> getCartList();
	
	//내 장바구니 보기
	@Select("select * from cart where member_id=#{member_id}")
	public CartVO getCart(String member_id);
	
	//결제시 장바구니에서 삭제
	@Delete("delete from cart where member_id=#{member_id} and product_id=#{product_id}")
	public void deleteCart(String member_id, int product_id);

	//장바구니 담기
	@Insert("insert into cart values(#{member_id},#{product_id},#{cart_product_count})")
	public void insertCart(String member_id, int product_id, int cart_product_count);
}

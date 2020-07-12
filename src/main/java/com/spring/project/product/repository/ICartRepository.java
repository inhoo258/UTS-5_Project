package com.spring.project.product.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.spring.project.product.model.CartVO;

@Repository
public interface ICartRepository {

	//장바구니 전체 목록(모든 client)
//	@Select("select * from cart")
//	public ArrayList<CartVO> getCartList();
	
	//내 장바구니 보기(products, members 테이블 join - 추가적으로 필요한 정보 끌어옴
	@Select("select c.member_id as member_id, c.product_id as product_id, cart_product_count, product_info, product_name, product_price, product_img, m.member_name as seller_name " 
			+"from cart c " 
			+"join products p" 
			+"on c.product_id = p.product_id "
			+"join members m "
			+"on m.member_id = p.member_id"
			+"where c.member_id=#{member_id}")
	public List<CartVO> getCart(String member_id);
	
	//결제시 장바구니에서 삭제
	@Delete("delete from cart where member_id=#{member_id} and product_id=#{product_id}")
	public void deleteCart(String member_id, int product_id);

	//장바구니 담기
	@Insert("insert into cart values(#{member_id},#{product_id},#{cart_product_count})")
	public void insertCart(String member_id, int product_id, int cart_product_count);
}

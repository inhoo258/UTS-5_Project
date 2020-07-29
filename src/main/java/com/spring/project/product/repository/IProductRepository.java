package com.spring.project.product.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.spring.project.product.model.ProductsVO;

@Repository
public interface IProductRepository {
	
	//전체 목록 가져오기
	@Select("select * from products")
	public ArrayList<ProductsVO> getProductList();
	
	//상품 한개의 정보 가져오기
	@Select("select * from products where product_id=#{product_id}")
	public ProductsVO getProduct(int product_id);
	
	//재고 삭제
	@Delete("delete from products where product_id=#{product_id}")
	public void deleteProduct(int product_id);
	
	//물량 감소
	@Update("update products set product_count=product_count-#{minusCount} where product_id=#{product_id}")
	public void minusProductCount(int minusCount, int product_id);
	
	//물량 증가
	@Update("update products set product_count=product_count+#{plusCount} where product_id=#{product_id}")
	public void plusProductCount(int plusCount, int product_id);

	@Select("select nvl(max(product_id),0) from products")
	public int getMaxProductId();
	//상품입고
	@Insert("insert into products "
			+ "(product_id, member_id, product_info, product_name, product_img, product_count, product_price, product_weight, product_img_name) "
			+ "values(#{product_id}, #{member_id}, #{product_info}, #{product_name}, #{product_img}, #{product_count}, #{product_price}, #{product_weight}, #{product_img_name})")
	public void insertProduct(ProductsVO product);
	
	//주문 완료 후 총 수량 수정
	@Update("update products set product_count=#{1} where product_id=#{0}")
	public void afterPayment(int product_id, int discount);
	
}

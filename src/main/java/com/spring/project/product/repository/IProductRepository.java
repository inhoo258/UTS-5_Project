package com.spring.project.product.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.*;
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
	
	//상품 입고
	@Insert("insert into products values(products_seq.nextval,#{manager_id},#{product_info},#{product_img},"
			+ "#{product_name},#{product_count},#{product_price},#{product_weight})")
	public void insertProduct(String manager_id, String product_info, byte[] product_img,
			String product_name, int product_count, int product_price, int product_weight);
	
	//재고 삭제
	@Delete("delete from products where product_id=#{product_id}")
	public void deleteProduct(int product_id);
	
	//물량 감소
	@Update("update products set product_count=product_count-#{minusCount} where product_id=#{product_id}")
	public void minusProductCount(int minusCount, int product_id);
	
	//물량 증가
	@Update("update products set product_count=product_count+#{plusCount} where product_id=#{product_id}")
	public void plusProductCount(int plusCount, int product_id);
}

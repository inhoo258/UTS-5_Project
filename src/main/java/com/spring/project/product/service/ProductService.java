package com.spring.project.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.product.model.ProductsVO;
import com.spring.project.product.repository.IProductRepository;

@Service
public class ProductService {
	
	@Autowired
	IProductRepository productRepository;
	
	public List<ProductsVO> getProductList(){
		return productRepository.getProductList();
	}
	
	public List<ProductsVO> getSellerProductList(String member_id){
		return productRepository.getSellerProductList(member_id);
	}
	
	public ProductsVO getProduct(int product_id) {
		return productRepository.getProduct(product_id);
	}
	
	public void minusProductCount(int minusCount, int product_id) {
		productRepository.minusProductCount(minusCount, product_id);
	}
	public void plusProductCount(int plusCount, int product_id) {
		productRepository.plusProductCount(plusCount, product_id);
	}
	public void insertProduct(ProductsVO product) {
			product.setProduct_id(productRepository.getMaxProductId()+1);
			productRepository.insertProduct(product);
	}
	//각 상품들의 상품수량을 주문완료 후 빼는 역할
	public void afterPayment(int[] product_ids,int[] order_product_counts) {
		for(int i =0; i<product_ids.length; i++) {
			productRepository.afterPayment(product_ids[i], order_product_counts[i]);
		}
	}
	// 등록된 상품 수정
	public void updateProduct(ProductsVO productVo) {
		productRepository.updateProduct(productVo);
		
	}

	public void updateProductWithImage(ProductsVO productVo) {
		productRepository.updateProductWithImage(productVo);
		
	}
	//판매자 페이지에서 등록된 상품 삭제
	public void deleteSellerProduct(int[] product_ids) {
		for (int i = 0; i < product_ids.length; i++) {
			productRepository.deleteSellerProduct(product_ids[i]);
		}
	}
	//판매자 페이지 페이징 처리 &판매자 등록 상품 총 갯수
	public int getTotalCount(String member_id) {
		return productRepository.getTotalCount(member_id);
	}
	//메인 페이지 오늘의 신상품
	public List<ProductsVO> getNewestProducts() {
		return productRepository.getNewestProducts();
	}
	//메인 페이지 인기상품
	public  List<ProductsVO> getPopularProductList() {
		return productRepository.getPopularProductList();
	}

	public  List<ProductsVO> getProductListBySearch(String search) {
		return productRepository.getProductListBySearch(search);
	}


}

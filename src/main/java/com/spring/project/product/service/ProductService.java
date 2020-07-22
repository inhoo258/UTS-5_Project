package com.spring.project.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.product.model.ProductsVO;
import com.spring.project.product.repository.IProductRepository;

@Service
public class ProductService{
	
	@Autowired
	IProductRepository productRepository;
	
	public List<ProductsVO> getProductList(){
		return productRepository.getProductList();
	}
	public ProductsVO getProduct(int product_id) {
		return productRepository.getProduct(product_id);
	}
	public void deleteProduct(int product_id) {
		productRepository.deleteProduct(product_id);
	}
	public void minusProductCount(int minusCount, int product_id) {
		productRepository.minusProductCount(minusCount, product_id);
	}
	public void plusProductCount(int plusCount, int product_id) {
		productRepository.plusProductCount(plusCount, product_id);
	}
	public void insertProduct(ProductsVO product) {
		for (int i = 0; i < 100; i++) {
			product.setProduct_id(productRepository.getMaxProductId()+1);
			productRepository.insertProduct(product);
		}
	}
	//각 상품들의 상품수량을 주문완료 후 빼는 역할
	public void afterPayment(int[] product_ids,int[] order_product_counts) {
		for(int i =0; i<product_ids.length; i++) {
			int discount = (productRepository.getProduct(product_ids[i]).getProduct_count()-order_product_counts[i]); 
			productRepository.afterPayment(product_ids[i], discount);
		}
	} 
}

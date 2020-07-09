package com.spring.project.product.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.product.model.ProductsVO;
import com.spring.project.product.repository.IProductRepository;

@Service
public class ProductService implements IProductService{
	
	@Autowired
	IProductRepository productRepository;
	
	public ArrayList<ProductsVO> getProductList(){
		return productRepository.getProductList();
	}
	public ProductsVO getProduct(int product_id) {
		return productRepository.getProduct(product_id);
	}
	public void insertProduct(String manager_id, String product_info, byte[] product_img,
			String product_name, int product_count, int product_price, int product_weight) {
		productRepository.insertProduct(manager_id, product_info, product_img, product_name, product_count, product_price, product_weight);
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
	
	
}

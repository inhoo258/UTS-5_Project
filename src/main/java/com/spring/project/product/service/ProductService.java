package com.spring.project.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.product.model.ProductsVO;
import com.spring.project.product.repository.IProductRepository;

@Service
public class ProductService implements IProductService{
	
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
		product.setProduct_id(productRepository.getMaxProductId()+1);
		productRepository.insertProduct(product);
	}
	
	
}

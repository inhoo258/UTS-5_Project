package com.spring.project.product.repository;

import java.sql.Date;
import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.spring.project.product.model.OrdersVO;

@Repository
public interface IOrderRepository {
	
	//주문목록 전체 출력(모든 client)
	@Select("select * from orders")
	public ArrayList<OrdersVO> getOrderList();
	
	//client 한명의 주문목록
	@Select("select * from oreders where member_id=#{member_id}")
	public OrdersVO getOrder(String member_id);
	
	//주문목록에 등록
	@Insert("insert into orders values(#{member_id},#{product_id},#{order_date},#{order_receiver_address},"
			+ "#{order_receiver_name},#{order_receiver_tel},#{order_receiver_count},#{order_price},#{order_option})")
	public void insertOrder(String member_id, int product_id, Date order_date, String order_receiver_address,
			String order_receiver_name, String order_receiver_tel, int order_receiver_count, int order_price,
			String order_option);
	
	//주문취소시 삭제
	@Delete("delete from orders where member_id=#{member_id} and product_id=#{product_id}")
	public void deleteOrder(String member_id, int product_id);
	
	//배송전/중/완료 수정
	@Update("update orders set 배송column=#{delivery}")
	public void deliveryOrder(String member_id, int product_id, String delivery);
}

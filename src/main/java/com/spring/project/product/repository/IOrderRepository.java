package com.spring.project.product.repository;

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
	
	//회원이 주문을 눌렀을 때 주문서에 회원 정보, 장바구니 목록을 띄워줄 때 사용하는 sql
	@Select("select m.member_id, m.member_name, m.member_tel,m.member_email, m.member_addr,"
			+ "p.product_img,p.product_name,p.PRODUCT_COUNT,p.product_price,p.product_weight "
			+ "from members m, products p, cart c where m.member_id = #{member_id}")
	public OrdersVO getOrderSheet(String member_id);
	
	// 결제하기 버튼 클릭 후 주문완료 페이지 띄우기 전에 주문목록에 넣어주는 sql
	@Insert("insert into orders"
			+ "(member_id,product_id,order_date,order_receiver_address,order_receiver_name,order_receiver_tel,order_product_count,order_price,order_option,order_status) "
			+ "values(#{member_id},#{product_id},sysdate,#{order_receiver_addr},#{order_receiver_name},#{order_receiver_tel},#{order_product_count},#{order_price},#{order_request},#{order_status})")
	public void paymentInOrder(OrdersVO ordersVO);
	
	//주문취소시 삭제
	@Delete("delete from orders where member_id=#{member_id} and product_id=#{product_id}")
	public void deleteOrder(String member_id, int product_id);
	
	//배송전/중/완료 수정
	@Update("update orders set order_status=#{order_status}")
	public void deliveryOrder(String member_id, int product_id, String order_status);
}

package com.spring.project.product.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.spring.project.product.model.OrdersVO;

@Repository
public interface IOrderRepository {
	//결제 완료된 나의 주문내역
//	@Select("select ord.product_id product_id, ord.member_id member_id,pr.product_name product_name, "
//			+ "order_date, order_receiver_main_address,order_receiver_sub_address, order_receiver_name, "
//			+ "order_receiver_tel,order_product_count, order_price, order_request, order_status, order_number, "
//			+ "review_check, order_group_number "
//			+ "from orders ord "
//			+ "join products pr "
//			+ "on ord.product_id = pr.product_id "
//			+ "where ord.member_id=#{member_id} "
//			+ "order by order_group_number desc")
//	public List<OrdersVO> getOrderList(String member_id);
	@Select("select ord.member_id member_id, order_group_number,prd.product_name product_name, order_date, order_price * order_product_count as order_price, "
			+ "order_receiver_main_address, order_receiver_sub_address, order_receiver_tel, order_delivery_price "
			+ "from orders ord "
			+ "join products prd "
			+ "on ord.product_id = prd.product_id "
			+ "where ord.member_id = #{member_id} "
			+ "order by order_group_number desc")
	public List<OrdersVO> getOrderList(String member_id);
	
	
	// 결제하기 버튼 클릭 후 주문완료 페이지 띄우기 전에 주문목록에 넣어주는 sql
	@Insert("insert into orders"
			+ "(member_id,product_id,order_date,order_receiver_address,order_receiver_name,order_receiver_tel,order_product_count,order_price,order_option,order_status) "
			+ "values(#{member_id},#{product_id},sysdate,#{order_receiver_address},#{order_receiver_name},#{order_receiver_tel},#{order_product_count},#{order_price},#{order_request},#{order_status})")
	public void paymentInOrder(OrdersVO ordersVO);
	
//	//주문취소시 삭제
//	@Delete("delete from orders where member_id=#{member_id} and product_id=#{product_id}")
//	public void deleteOrder(String member_id, int product_id);
	
	//배송전/중/완료 수정
	@Update("update orders set order_status=#{order_status}")
	public void deliveryOrder(String member_id, int product_id, String order_status);

	@Select("select ord.member_id member_id, order_date, ord.product_id product_id, prd.product_name product_name, order_product_count, order_number, product_weight "
			+ "from orders ord "
			+ "join products prd "
			+ "on ord.product_id = prd.product_id "
			+ "where ord.order_number=#{order_number}")
	public OrdersVO getOrderByOrderNumber(int order_number);

	@Update("update orders set review_check = 1 where order_number=#{order_number}")
	public void updateReviewCheck(int order_number);

	@Delete("delete orders where order_group_number=#{0} and member_id=#{1}")
	public void deleteOrder(int order_group_number, String member_id);

	@Select("select ord.product_id product_id, order_number, prd.product_name, order_price, order_product_count, order_request, order_status, "
			+ "ord.member_id, review_check, order_delivery_price, seller_company_name "
			+ "from orders ord "
			+ "join products prd "
			+ "on ord.product_id = prd.product_id "
			+ "join seller_info sel "
			+ "on sel.member_id = prd.member_id "
			+ "where ord.member_id =#{0} and order_group_number =#{1} "
			+ "order by seller_company_name desc")
	public List<OrdersVO> getOrder(String member_id, int order_group_number);

	@Select("select count(*) from orders where member_id = #{member_id}")
	public int getTotalCount(String member_id);

	@Select("select * from orders where member_id = #{member_id}")
	public List<OrdersVO> getMyOrderList(String member_id);
}

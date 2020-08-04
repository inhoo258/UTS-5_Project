package com.spring.project.board.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.spring.project.board.model.ReviewVO;

@Repository
public interface IReviewRepository {
	//client별 작성 목록
	@Select("select * from review_board where member_id=#{member_id}")
	public ReviewVO getReview(String member_id);
	
	//글작성
	@Insert("insert into review_board values(#{member_id},#{product_id},sysdate,#{order_product_count},#{review_content},"
			+ "#{review_img},#{review_score})")
	public void insertReview(String member_id,int product_id, int order_product_count, String review_content, byte[] review_img, int review_score);
	
	//글 삭제
	@Delete("delete from review_board where member_id=#{member_id} and product_id=#{product_id}")
	public void deleteReview(String member_id, int product_id);
	
	//리뷰 수정
	@Update("update review_board set review_content=#{review_content} where member_id=#{member_id} and product_id=#{product_id}")
	public void updateReview(String member_id, int product_id);
	
	@Select("select count(*) from review_board where product_id = #{product_id}")
	public int getTotalCount(int product_id);
	@Select("select * from (select rownum review_rn, re.* from (select * from review_board where product_id = #{0} order by review_number desc)re)where review_rn between #{1} and #{2}")
	public List<ReviewVO> getReviewList(int product_id, int start, int end);
}

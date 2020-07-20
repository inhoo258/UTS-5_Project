package com.spring.project.board.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import com.spring.project.board.model.ReviewVO;

@Repository
public interface IReviewRepository {
	
	//전체 글목록 내림차순 정렬
	@Select("select * from review_board order by rownum desc")
	public ArrayList<ReviewVO> getReviewList();
	
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
	
	@Select("select count(*) from review_board")
	public int getTotalCount();
}

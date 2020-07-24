package com.spring.project.board.repository;

import java.util.ArrayList;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import com.spring.project.board.model.QnAVO;

@Repository
public interface IQnARepository {
	
	//qna 전체 목록 출력
	@Select("select * from(select rownum qna_rn,n.* from (select * from q_n_a_board order by q_group) n)where qna_rn between #{0} and #{1} order by qna_rn desc")
	public ArrayList<QnAVO> getQnAList(int start, int end);
	
	//qna 수정
	@Update("update Q_N_A_board set q_title=#{q_title},q_content=#{q_content} where member_id=#{member_id}")
	public void updateQnA(String q_title, String q_content, String member_id);
	
	//qna 작성
	@Insert("insert into Q_N_A_board values(#{member_id},sysdate,#{q_title},#{q_category},#{q_content},#{q_group},"
			+ "#{q_step},#{q_img})")
	public void inserQnA(String member_id, String q_title, String q_category, String q_content,
			int q_group,int q_step, byte[] q_img);
	
	//qna 답변 작성
	@Insert("insert int Q_N_A_board values(#{member_id},sysdate,#{q_title},#{q_category},#{q_content},#{q_group},#{q_step})")
	public void answerQnA(String member_id, String q_title, String q_category, String q_content,
			int q_group,int q_step);
	
	//qna 삭제
	@Delete("delete from Q_N_A_board where member_id=#{member_id} and q_title=#{q_title}")
	public void deleteQnA(String member_id, String q_title);
	
	@Select("select count(*) from q_n_a_board")
	public int getTotalCount();
	
}

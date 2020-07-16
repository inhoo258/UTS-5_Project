package com.spring.project.board.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.spring.project.board.model.NoticeVO;

@Repository
public interface INoticeRepository {
	
	//전체 공지사항 목록
	@Select("select * from(select rownum notice_rn,n.* from (select * from notice_board order by notice_number) n)where notice_rn between #{0} and #{1} order by notice_rn desc")
	public List<NoticeVO> getNoticeList(int start, int end);
	
	//공지사항 하나 클릭(제목)
	@Select("select * from(select rownum notice_rn,n.* from(select * from notice_board order by notice_number)n)where notice_rn=#{notice_rn}")
	public NoticeVO getNotice(int notice_rn);
	
	//공지사항 등록
	@Insert("insert into notice_board values(#{notice_content},sysdate,#{notice_title},#{notice_views})")
	public void insertNotice(String notice_content, String notice_title, String notice_views);
	
	//공지사항 내용 수정
	@Update("update notice_board set notice_content=#{notice_content}")
	public void updateNotice(String notice_content);
	
	//공지사항 조회수 +1증가
	@Update("update notice_board set notice_views=notice_views+1 where notice_number =#{notice_number}")
	public void updateViews(int notice_number);
	@Select("select count(*) from notice_board")
	public int getTotalCount();
}

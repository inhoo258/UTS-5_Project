package com.spring.project.board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.project.board.model.QnAVO;
import com.spring.project.board.repository.IQnARepository;

@Service
public class QnAService implements IBoardService{

	@Autowired
	IQnARepository qnARepository;
	
	public ArrayList<QnAVO> getQnAList(){
		return qnARepository.getQnAList();
	}
	
	public void updateQnA(String q_title, String q_content, String member_id) {
		qnARepository.updateQnA(q_title, q_content, member_id);
	}
	
	public void inserQnA(String member_id, String q_title, String q_category, String q_content,
			int q_group,int q_step, byte[] q_img) {
		qnARepository.inserQnA(member_id, q_title, q_category, q_content, q_group, q_step, q_img);
	}
	
	public void answerQnA(String member_id, String q_title, String q_category, String q_content,
			int q_group,int q_step) {
		qnARepository.answerQnA(member_id, q_title, q_category, q_content, q_group, q_step);
	}
	
	public void deleteQnA(String member_id, String q_title) {
		qnARepository.deleteQnA(member_id, q_title);
	}
}

package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.DAO.MemberDAO;
import com.spring.DAO.NoticeDAO;
import com.spring.dto.MemberVO;
import com.spring.dto.NoticeVO;

@Service(value = "MemberService")
public class MemberService {

	@Autowired
	private MemberDAO dao;

	public MemberVO selectMember(MemberVO memberVO) {
		MemberVO member = dao.selectMember(memberVO);
		return member;
	}

	public void insertMember(MemberVO memberVO) {
		dao.insertMember(memberVO);
	}
}

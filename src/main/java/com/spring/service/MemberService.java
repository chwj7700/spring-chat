package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.MemberDAO;
import com.spring.domain.Member;

@Service(value = "MemberService")
public class MemberService {

	@Autowired
	private MemberDAO dao;

	public Member selectMember(Member memberVO) {
		Member member = dao.selectMember(memberVO);
		return member;
	}

	public void insertMember(Member memberVO) {
		dao.insertMember(memberVO);
	}
}

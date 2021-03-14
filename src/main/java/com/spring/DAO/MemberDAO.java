package com.spring.DAO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.dto.MemberVO;

@Repository(value = "MemberDAO")
public class MemberDAO{
	
	@Autowired
	private SqlSession sql;
	
	private static String namespace = "com.spring.mapper.MemberMapper";
	
	public void insertMember(MemberVO vo){
		sql.insert(namespace + ".insertMember", vo);
	}
	
	public MemberVO selectMember(MemberVO vo){
		return sql.selectOne(namespace + ".selectMember", vo);
	}
	
}

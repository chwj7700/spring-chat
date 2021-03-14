package com.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.domain.Member;

@Repository(value = "MemberDAO")
public class MemberDAO{
	
	@Autowired
	private SqlSession sql;
	
	private static String namespace = "com.spring.mapper.MemberMapper";
	
	public void insertMember(Member vo){
		sql.insert(namespace + ".insertMember", vo);
	}
	
	public Member selectMember(Member vo){
		return sql.selectOne(namespace + ".selectMember", vo);
	}
	
}

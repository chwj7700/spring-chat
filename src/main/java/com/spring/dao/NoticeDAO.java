package com.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Notice;

@Service
public class NoticeDAO {

	@Autowired
	private SqlSession sql;

	private static String namespace = "com.spring.mapper.NoticeMapper";

	public List<Notice> selectNotices() {
		List<Notice> notices = sql.selectList(namespace + ".selectNotices");
		return notices;
	}

	public void insertNotice(String comment) {
		sql.insert(namespace + ".insertNotice", comment);
	}
//	
}

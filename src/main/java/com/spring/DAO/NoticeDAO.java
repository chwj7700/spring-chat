package com.spring.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.NoticeVO;

@Service
public class NoticeDAO {

	@Autowired
	private SqlSession sql;

	private static String namespace = "com.spring.mapper.NoticeMapper";

	public List<NoticeVO> selectNotices() {
		List<NoticeVO> notices = sql.selectList(namespace + ".selectNotices");
		return notices;
	}

	public void insertNotice(String comment) {
		sql.insert(namespace + ".insertNotice", comment);
	}
//	
}

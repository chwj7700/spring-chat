package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.NoticeDAO;
import com.spring.domain.Notice;

@Service(value = "NoticeService")
public class NoticeService {

	@Autowired
	private NoticeDAO dao;

	public List<Notice> selectNotices() {
		List<Notice> notices = dao.selectNotices();
		return notices;
	}

	public void insertNotice(String comment) {
		dao.insertNotice(comment);
	}
}

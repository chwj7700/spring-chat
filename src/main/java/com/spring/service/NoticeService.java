package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.DAO.NoticeDAO;
import com.spring.dto.NoticeVO;

@Service(value = "NoticeService")
public class NoticeService {

	@Autowired
	private NoticeDAO dao;

	public List<NoticeVO> selectNotices() {
		List<NoticeVO> notices = dao.selectNotices();
		return notices;
	}

	public void insertNotice(String comment) {
		dao.insertNotice(comment);
	}
}

package com.spring.chat;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.dto.NoticeVO;
import com.spring.dto.RoomVO;
import com.spring.service.NoticeService;
import com.spring.service.RoomService;
import com.spring.chat.HomeController;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	private RoomService roomService;

	@Autowired
	private NoticeService noticeService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<NoticeVO> noticeVoList = noticeService.selectNotices();

		model.addAttribute("notice", noticeVoList);

		List<RoomVO> room = roomService.selectRoomsWithPaging(10, 0);
		int roomCount = roomService.selectRoomTotalCount();

		model.addAttribute("room", room);
		model.addAttribute("roomCount", roomCount);
		model.addAttribute("pageName", "chatList");
		return "home";
	}
}

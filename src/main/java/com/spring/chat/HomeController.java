package com.spring.chat;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.service.NoticeService;
import com.spring.service.RoomService;
import com.spring.chat.HomeController;
import com.spring.domain.Notice;
import com.spring.domain.Room;

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
		List<Notice> notices = noticeService.selectNotices();

		model.addAttribute("notice", notices);
		
		Room roomVO = new Room();
		roomVO.setLength(10);
		roomVO.setStart(0);
		List<Room> room = roomService.selectRoomsWithPaging(roomVO);
		int roomCount = roomService.selectRoomTotalCount();

		model.addAttribute("room", room);
		model.addAttribute("roomCount", roomCount);
		model.addAttribute("pageName", "chatList");
		return "home";
	}
}

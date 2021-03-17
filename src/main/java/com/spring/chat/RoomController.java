package com.spring.chat;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.Member;
import com.spring.domain.Room;
import com.spring.service.RoomService;
import com.spring.vo.RoomVO;

@Controller
public class RoomController {
    
	@Autowired
	private RoomService roomService;
	
	private Logger logger = LoggerFactory.getLogger(RoomController.class);
	
    @RequestMapping(value="/delete", method=RequestMethod.POST)
    public String PostDelete(int roomId, HttpServletResponse response, HttpServletRequest req) throws Exception{
    	
    	roomService.deleteRoom(roomId);
    	
    	response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();	 
		out.println("<script>alert('방이 삭제되었습니다.'); opener.parent.location.reload(); window.close();</script>");
		out.flush();
		 
    	return null;
    }
    
    @RequestMapping(value = "/make", method=RequestMethod.GET)
    public void getmake() throws Exception {}
    
    @RequestMapping(value="/make", method=RequestMethod.POST)
    public String postmake(@Valid Room room, HttpServletResponse response,RedirectAttributes rttr, HttpServletRequest req, BindingResult bindingResult) throws Exception{
    	HttpSession session = req.getSession();
    	List<Room> roomList = roomService.selectRooms();
        
    	int roomId = 1;
    	for(Room e : roomList) {
    		if(e.getId() != roomId) {
    			break;
    		}
    		roomId +=1;
    	}
	
    	room.setId(roomId);
    	room.setMaster(((Member)session.getAttribute("loginid")).getId());
    	roomService.insertRoom(room);
    	
    	response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();	 
		out.println("<script>opener.parent.location.reload(); window.close();</script>");
		out.flush();
		return null;
    }
    
    @RequestMapping(value = "/chat", method=RequestMethod.GET)
    public String chat(Model model, @RequestParam(value="roomId")int roomId, HttpServletRequest req) {
    	HttpSession session = req.getSession();
    	Member login = new Member();
    	
    	login = (Member)session.getAttribute("loginid");
    	String loginid = login.getId();
    	
    	session.setAttribute("roomId", roomId);
    	model.addAttribute("id", loginid);
    	
    	Room room = roomService.selectRoom(roomId);
    	model.addAttribute("subject", room.getSubject());
    	model.addAttribute("master", room.getMaster());
    	
    	System.out.println(loginid + "   1  " + room.getMaster());
    	return "chat";
    }
    
    @RequestMapping(value="/roomSearch", method=RequestMethod.POST)
    @ResponseBody
    public RoomVO roomSearch(@RequestBody Room room) throws Exception{
		List<Room> rooms = roomService.selectRoomsWithPaging(room);
		int roomCount = roomService.selectRoomTotalCount(room);
		RoomVO roomVO =  RoomVO.createRoomVO(rooms, roomCount);
		return roomVO;
    }
}

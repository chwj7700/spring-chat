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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.dto.MemberVO;
import com.spring.dto.RoomVO;
import com.spring.service.RoomService;

@Controller
public class RoomController {
	
    @Autowired
    private SqlSession sqlSession;
    
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
    public String postmake(@Valid RoomVO dto, HttpServletResponse response,RedirectAttributes rttr, HttpServletRequest req, BindingResult bindingResult) throws Exception{
    	HttpSession session = req.getSession();
    	List<RoomVO> roomDtoList = roomService.selectRooms();
        
    	int roomId = 1;
    	for(RoomVO roomDto : roomDtoList) {
    		if(roomDto.getId() != roomId) {
    			break;
    		}
    		roomId +=1;
    	}
	
		dto.setId(roomId);
    	dto.setMaster(((MemberVO)session.getAttribute("loginid")).getId());
    	roomService.insertRoom(dto);
    	
    	response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();	 
		out.println("<script>opener.parent.location.reload(); window.close();</script>");
		out.flush();
		return null;
    }
    
    @RequestMapping(value = "/chat", method=RequestMethod.GET)
    public String chat(Model model, @RequestParam(value="roomId")int roomId, HttpServletRequest req) {
    	HttpSession session = req.getSession();
    	MemberVO login = new MemberVO();
    	
    	login = (MemberVO)session.getAttribute("loginid");
    	String loginid = login.getId();
    	
    	session.setAttribute("roomId", roomId);
    	model.addAttribute("id", loginid);
    	
    	RoomVO room = roomService.selectRoom(roomId);
    	model.addAttribute("subject", room.getSubject());
    	model.addAttribute("master", room.getMaster());
    	
    	System.out.println(loginid + "   1  " + room.getMaster());
    	return "chat";
    }
}

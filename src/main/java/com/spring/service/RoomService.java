package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.DAO.RoomDAO;
import com.spring.dto.RoomVO;

@Service(value = "RoomService")
public class RoomService {

	@Autowired
	private RoomDAO dao;

	public List<RoomVO> selectRoomsWithPaging(int length, int start) {
		List<RoomVO> rooms = dao.selectRoomsWithPaging(length, start);
		return rooms;
	}

	public int selectRoomTotalCount() {
		int cnt = dao.selectRoomTotalCount();
		return cnt;
	}

	public List<RoomVO> selectRooms() {
		List<RoomVO> rooms = dao.selectRooms();
		return rooms;
	}

	public RoomVO selectRoom(int roomId) {
		RoomVO room = dao.selectRoom(roomId);
		return room;
	}
	
	public void insertRoom(RoomVO roomDTO) {
		dao.insertRoom(roomDTO);
	}

	public void deleteRoom(int roomId) {
		dao.DeleteRoom(roomId);
	}

}

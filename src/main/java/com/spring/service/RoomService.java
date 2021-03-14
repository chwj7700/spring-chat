package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dao.RoomDAO;
import com.spring.domain.Room;

@Service(value = "RoomService")
public class RoomService {

	@Autowired
	private RoomDAO dao;

	public List<Room> selectRoomsWithPaging(Room roomVO) {
		List<Room> rooms = dao.selectRoomsWithPaging(roomVO);
		return rooms;
	}

	public int selectRoomTotalCount() {
		int cnt = dao.selectRoomTotalCount();
		return cnt;
	}

	public List<Room> selectRooms() {
		List<Room> rooms = dao.selectRooms();
		return rooms;
	}

	public Room selectRoom(int roomId) {
		Room room = dao.selectRoom(roomId);
		return room;
	}
	
	public void insertRoom(Room roomDTO) {
		dao.insertRoom(roomDTO);
	}

	public void deleteRoom(int roomId) {
		dao.DeleteRoom(roomId);
	}

}

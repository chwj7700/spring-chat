package com.spring.vo;

import java.util.List;

import com.spring.domain.Room;

public class RoomVO {

	private List<Room> rooms;
	private int count;

	public List<Room> getRoom() {
		return rooms;
	}

	public int getCount() {
		return count;
	}
	
	public static RoomVO createRoomVO(List<Room> rooms, int count) {
		RoomVO roomVO = new RoomVO();
		roomVO.rooms = rooms;
		roomVO.count = count;
		return roomVO;
	}


}

package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.dto.RoomDTO;

public interface RoomMapper {
	 public List<RoomDTO> selectRooms();
	 public RoomDTO selectRoomInfo(String roomId);
	 public void InsertRoom(RoomDTO data);
	 public int countColumns();
	 public void DeleteRoom(int roomId);
	 public List<RoomDTO> selectRoomsWithPaging(@Param("length") int length, @Param("start")int start);
}

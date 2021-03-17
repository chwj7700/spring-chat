package com.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.Room;

@Service
public class RoomDAO {

	@Autowired
	private SqlSession sql;

	private static String namespace = "com.spring.mapper.RoomMapper";

	public void insertRoom(Room dto) {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".insertRoom", dto);
	}

	public List<Room> selectRooms() {
		// TODO Auto-generated method stub
		List<Room> rooms = sql.selectList(namespace + ".selectRooms");
		return rooms;
	}

	public Room selectRoom(int id) {
		Room room = sql.selectOne(namespace + ".selectRoom", id);
		return room;
	};

	public void DeleteRoom(int roomId) {
		sql.delete(namespace + ".DeleteRoom", roomId);
	};

	
	public List<Room> selectRoomsWithPaging(Room room){
		List<Room> rooms = sql.selectList(namespace + ".selectRoomsWithPaging", room);
		return rooms;
	}
	
	public int selectRoomTotalCount(Room room) {
		int cnt = sql.selectOne(namespace + ".selectRoomTotalCount", room);
		return cnt;
	}

}

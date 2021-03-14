package com.spring.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.dto.RoomVO;

@Service
public class RoomDAO {

	@Autowired
	private SqlSession sql;

	private static String namespace = "com.spring.mapper.RoomMapper";

	public void insertRoom(RoomVO dto) {
		// TODO Auto-generated method stub
		sql.insert(namespace + ".insertRoom", dto);
	}

	public List<RoomVO> selectRooms() {
		// TODO Auto-generated method stub
		List<RoomVO> rooms = sql.selectList(namespace + ".selectRooms");
		return rooms;
	}

	public RoomVO selectRoom(int id) {
		RoomVO room = sql.selectOne(namespace + ".selectRoom", id);
		return room;
	};

	public void DeleteRoom(int roomId) {
		sql.delete(namespace + ".DeleteRoom", roomId);
	};

	
	public List<RoomVO> selectRoomsWithPaging(@Param("length") int length, @Param("start") int start){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("length", length);
		map.put("start", start);
		
		List<RoomVO> rooms = sql.selectList(namespace + ".selectRoomsWithPaging", map);
		return rooms;
	}
	
	public int selectRoomTotalCount() {
		int cnt = sql.selectOne(namespace + ".selectRoomTotalCount");
		return cnt;
	}

}

package com.spring.dto;

//room ���̺�
public class RoomDTO {

	private int id;
	private String master;
	private String subject;

	public RoomDTO() {
	}

	public int getId() {
		return id;
	}

	public String getSubject() {
		return subject;
	}

	public String getMaster() {
		return master;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setMaster(String master) {
		this.master = master;
	}

}

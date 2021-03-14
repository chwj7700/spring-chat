package com.spring.dto;

//room ���̺�
/**
 * @author chwj7
 *
 */
public class RoomVO {

	private int id;
	private String master;
	private String subject;
	private int cnt;

	public RoomVO() {
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

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

}

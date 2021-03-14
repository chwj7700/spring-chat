package com.spring.domain;

/**
 * @author chwj7700
 */
public class Room {

	private int id;
	private String master;
	private String subject;
	private int length;
	private int start;

	public Room() {
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
	
	public int getLength() {
		return length;
	}

	public void setLength(int length) {
		this.length = length;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

}

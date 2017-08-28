package com.nezha.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Club implements Serializable{

	private String name ; //名字
	private Timestamp createDate;//俱乐部创建时间
	private int number;//球员人数
	private String info;//俱乐部信息
	private String address;//俱乐部地址
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}

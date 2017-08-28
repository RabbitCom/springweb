package com.nezha.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Athlete implements Serializable{

	private String name;//姓名
	private int age;//年龄
	private Timestamp joinDate;//加入时间
	private String job;//位置
	private String address;//家庭住址
	private String clubId;//所属俱乐部
	private String clotherNumber;//球衣号
	
	private  String info;//球员信息

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Timestamp getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getClubId() {
		return clubId;
	}

	public void setClubId(String clubId) {
		this.clubId = clubId;
	}

	public String getClotherNumber() {
		return clotherNumber;
	}

	public void setClotherNumber(String clotherNumber) {
		this.clotherNumber = clotherNumber;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	
	
}

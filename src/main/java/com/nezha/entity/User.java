package com.nezha.entity;

import java.io.Serializable;

public class User implements Serializable{

	private int id;
	private String name;
	private String password;
	
	private String phoneNumber;

	private String account;
	
	
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", 姓名=" + name + ", 密码=" + password + ", 电话号码=" + phoneNumber + ", 账号=" + account + "]";
	}

	
}

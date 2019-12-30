package com.ineat.oxo.vo;

import java.sql.*;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.*;

// mVO
public class MemberVO {
	private int mno;
	private String id;
	private String pw;
	private String name;
	private String email;
	private String nname;
	private String tel;
	private Date wDate;
	private String sDate;
	private Time wTime;
	private String sTime;
	
	

	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNname() {
		return nname;
	}
	public void setNname(String nname) {
		this.nname = nname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getwDate() {
		return wDate;
	}
	public void setwDate(Date wDate) {
		this.wDate = wDate;
		setsDate();
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate() {
		SimpleDateFormat form = new SimpleDateFormat("yyyy/MM/dd");
		this.sDate = form.format(wDate);
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public Time getwTime() {
		return wTime;
	}
	public void setwTime(Time wTime) {
		this.wTime = wTime;
		setsTime();
	}
	public String getsTime() {
		return sTime;
	}
	public void setsTime() {
		SimpleDateFormat form = new SimpleDateFormat("HH:mm:SS");
		this.sTime = form.format(wTime);
	}
	public void setsTime(String sTime) {
		this.sTime = sTime;
	}
	
	
}

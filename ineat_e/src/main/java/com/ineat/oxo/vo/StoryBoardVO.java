package com.ineat.oxo.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

// sbVO
public class StoryBoardVO {
	private int cnt;
	private int bno;
	private int mno;
	private int fno;
	private int writer;
	private String mid;
	private String title;
	private String content;
	private Date sbDate;
	private int views;
	private MultipartFile sFile;
	private MultipartFile[] file;
	
	
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public MultipartFile getsFile() {
		return sFile;
	}
	public void setsFile(MultipartFile sFile) {
		this.sFile = sFile;
	}
	public MultipartFile[] getFile() {
		return file;
	}
	public void setFile(MultipartFile[] file) {
		this.file = file;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSbDate() {
		return sbDate;
	}
	public void setSbDate(Date sbDate) {
		this.sbDate = sbDate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String toString() {
		return 
				"bno : " + bno + 
				" | mid : " + mid +
				" | title : " + title +
				" | content : " + content
				; 
	}
	
}

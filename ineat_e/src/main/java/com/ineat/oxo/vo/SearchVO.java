package com.ineat.oxo.vo;

public class SearchVO {
	private int num; 
	private String contents; // 검색 키워드
	private int price[];  // 가격대 필터 저장 배열 
	private int ml_count;
	private int favorite;
	private int ml_no;
	private String tag;
	private String order;
	
	
	
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getMl_count() {
		return ml_count;
	}
	public void setMl_count(int ml_count) {
		this.ml_count = ml_count;
	}
	public int getFavorite() {
		return favorite;
	}
	public void setFavorite(int favorite) {
		this.favorite = favorite;
	}
	public int getMl_no() {
		return ml_no;
	}
	public void setMl_no(int ml_no) {
		this.ml_no = ml_no;
	}
	public int[] getPrice() {
		return price;
	}
	public void setPrice(int[] price) {
		this.price = price;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
}

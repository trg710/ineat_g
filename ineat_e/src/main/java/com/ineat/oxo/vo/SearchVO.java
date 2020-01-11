package com.ineat.oxo.vo;

public class SearchVO {
	private int num; 
	private String contents; // 검색 키워드
	private int price[];  // 가격대 필터 저장 배열 
	
	
	
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

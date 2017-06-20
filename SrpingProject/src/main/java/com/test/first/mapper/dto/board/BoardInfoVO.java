package com.test.first.mapper.dto.board;

import java.sql.Timestamp;

public class BoardInfoVO {
	
	private int board_num;
	private String member_id;
	private String member_name;
	private Timestamp board_datetime;
	private String title;
	private String contents;
	private String tour_date;
	private String tour_time;
	private int cost;
	private String location;
	private String place_name;
	private int hits;
	
	
	
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Timestamp getBoard_datetime() {
		return board_datetime;
	}
	public void setBoard_datetime(Timestamp board_datetime) {
		this.board_datetime = board_datetime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getTour_date() {
		return tour_date;
	}
	public void setTour_date(String tour_date) {
		this.tour_date = tour_date;
	}
	public String getTour_time() {
		return tour_time;
	}
	public void setTour_time(String tour_time) {
		this.tour_time = tour_time;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	
	@Override
	public String toString() {
		return "BoardInfoVO [board_num=" + board_num + ", member_id=" + member_id + ", member_name=" + member_name
				+ ", board_datetime=" + board_datetime + ", title=" + title + ", contents=" + contents + ", tour_date="
				+ tour_date + ", tour_time=" + tour_time + ", cost=" + cost + ", location=" + location + ", place_name="
				+ place_name + ", hits=" + hits + "]";
	}
	
	
	
	
	

}

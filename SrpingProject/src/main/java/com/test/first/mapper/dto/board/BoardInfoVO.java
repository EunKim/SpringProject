package com.test.first.mapper.dto.board;

public class BoardInfoVO {
	
	private int bonumber;
	private String botitle;
	private String bodate;
	private String botime;
	private String bocost;
	private String bocontent;
	private String bouname;
	
	public int getBonumber() {
		return bonumber;
	}
	public void setBonumber(int bonumber) {
		this.bonumber = bonumber;
	}
	public String getBotitle() {
		return botitle;
	}
	public void setBotitle(String botitle) {
		this.botitle = botitle;
	}
	public String getBodate() {
		return bodate;
	}
	public void setBodate(String bodate) {
		this.bodate = bodate;
	}
	public String getBotime() {
		return botime;
	}
	public void setBotime(String botime) {
		this.botime = botime;
	}
	public String getBocost() {
		return bocost;
	}
	public void setBocost(String bocost) {
		this.bocost = bocost;
	}
	public String getBocontent() {
		return bocontent;
	}
	public void setBocontent(String bocontent) {
		this.bocontent = bocontent;
	}
	public String getBouname() {
		return bouname;
	}
	public void setBouname(String bouname) {
		this.bouname = bouname;
	}
	
	@Override
	public String toString() {
		return "BoardInfoVO [bonumber=" + bonumber + ", botitle=" + botitle + ", bodate=" + bodate + ", botime="
				+ botime + ", bocost=" + bocost + ", bocontent=" + bocontent + ", bouname=" + bouname + "]";
	}
	
	

}

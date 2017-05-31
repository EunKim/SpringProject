package com.test.first.mapper.dto.board;

import java.sql.Date;

public class BoardInfoVO {
	
	private int bonumber;
	private String botitle;
	private String bomeetdate;
	private String bomeettime;
	private String boplace;
	private String bocost;
	private String bocontent;
	private String bouname;
	private Date boregdate;
	private int bocount;
	
	public Date getBoregdate() {
		return boregdate;
	}
	public void setBoregdate(Date boregdate) {
		this.boregdate = boregdate;
	}
	public int getBocount() {
		return bocount;
	}
	public void setBocount(int bocount) {
		this.bocount = bocount;
	}
	
	public String getBomeetdate() {
		return bomeetdate;
	}
	public void setBomeetdate(String bomeetdate) {
		this.bomeetdate = bomeetdate;
	}
	public String getBomeettime() {
		return bomeettime;
	}
	public void setBomeettime(String bomeettime) {
		this.bomeettime = bomeettime;
	}
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
	public String getBoplace() {
		return boplace;
	}
	public void setBoplace(String boplace) {
		this.boplace = boplace;
	}
	@Override
	public String toString() {
		return "BoardInfoVO [bonumber=" + bonumber + ", botitle=" + botitle + ", bomeetdate=" + bomeetdate
				+ ", bomeettime=" + bomeettime + ", boplace=" + boplace + ", bocost=" + bocost + ", bocontent="
				+ bocontent + ", bouname=" + bouname + ", boregdate=" + boregdate + ", bocount=" + bocount + "]";
	}
	
	
	
	

}

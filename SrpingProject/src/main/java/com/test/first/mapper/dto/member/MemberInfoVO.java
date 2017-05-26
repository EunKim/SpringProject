package com.test.first.mapper.dto.member;

public class MemberInfoVO {
	
	private int unumber;
	private String uid;
	private String upw;
	private String uname;
	private String ugender;
	private String ubirth;
	
	
	public String getUbirth() {
		return ubirth;
	}
	public void setUbirth(String ubirth) {
		this.ubirth = ubirth;
	}
	public int getUnumber() {
		return unumber;
	}
	public void setUnumber(int unumber) {
		this.unumber = unumber;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUgender() {
		return ugender;
	}
	public void setUgender(String ugender) {
		this.ugender = ugender;
	}
	@Override
	public String toString() {
		return "MemberInfoVO [unumber=" + unumber + ", uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", ugender="
				+ ugender + ", ubirth=" + ubirth + "]";
	}
	

	

	
	
	

}

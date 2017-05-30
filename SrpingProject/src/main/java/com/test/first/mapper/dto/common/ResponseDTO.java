package com.test.first.mapper.dto.common;

public class ResponseDTO {
	private int code = 99; //99:성공
	private String msg = null;
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	

}

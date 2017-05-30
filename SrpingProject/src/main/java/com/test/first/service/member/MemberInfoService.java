package com.test.first.service.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.test.first.mapper.dto.member.MemberInfoVO;

public interface MemberInfoService {
	
	//메인에서 -> 회원관리 누를시에
	public List<MemberInfoVO> memberList();
	
	//메인에서 -> 회원가입 폼 입력시에
	public void insertMember(MemberInfoVO vo);
	
	//로그인 할시에 db에 해당되는 정보가 있는지에 대해 확인
	public boolean loginConfirm(MemberInfoVO vo, HttpSession session);
	
	//로그아웃 : 세션을 초기화 시키기 때문에 세션 파라미터 받음.
	public void logout(HttpSession session);
	
	//해당되는 이름(닉네임)의 아이디로 select해주기
	public MemberInfoVO viewMember(String uid);
	
	//회원정보에서, 수정 삭제시 기존 비밀번호를 입력해서 일치하면 처리 하게 해주는 메소드. : 비밀번호 체크
	public boolean checkPw(String uid,String upw);
	
	//회원정보에서 수정처리
	public void updateMember(MemberInfoVO vo);
	
	//회원정보에서 삭제처리 -> 삭제처리 하면서 로그아웃 기능도 필요하기 때문에 session 파라미터 필요
	public void deleteMember(String uid,HttpSession session);
	
	//아이디 중복 검사 처리
	public boolean isAvailableId(String uid);
	
	//이름(닉네임) 중복 검사 처리
	public boolean isAvailableName(String uname);
	
	
	
	
	public MemberInfoVO viewMember(MemberInfoVO vo);
	
	

	
}

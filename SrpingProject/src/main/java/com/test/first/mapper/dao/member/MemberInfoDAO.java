package com.test.first.mapper.dao.member;

import java.util.List;

import com.test.first.mapper.dto.member.MemberInfoVO;

public interface MemberInfoDAO {
	
	//메인에서 -> 회원관리 누를시에
	public List<MemberInfoVO> memberList();
	
	//메인에서 -> 회원가입 폼 입력시에
	public void insertMember(MemberInfoVO vo);
	
	//로그인 할시에 db에 해당되는 정보가 있는지에 대해 확인
	public boolean loginConfirm(MemberInfoVO vo);
	
	//로그아웃 처리 -> 필요한 쿼리문이 존재하지 않기때문에 DAO를 거치지 않고 서비스단에서 해결가능.
	
	//해당되는 이름(닉네임)의 아이디로 select해주기  
	public MemberInfoVO viewMember(String uid);
	
	//회원정보에서, 수정 삭제시 기존 비밀번호를 입력해서 일치하면 처리 하게 해주는 메소드. : 비밀번호 체크
	public boolean checkPw(String uid,String upw);
	
	//회원정보에서 수정처리
	public void updateMember(MemberInfoVO vo);
	
	//회원정보에서 삭제처리
	public void deleteMember(String uid);
	
	//회원가입시 아이디 중복검사에 사용
	public MemberInfoVO selectId(String uid);
	
	//회원가입시 이름(닉네임) 중복검사에 사용
	public MemberInfoVO selectName(String uname);
	
	
	
	public MemberInfoVO viewMember(MemberInfoVO vo);
	
	
	
	

	

}

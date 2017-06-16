package com.test.first.mapper.dao.member;


import com.test.first.mapper.dto.member.MemberInfoVO;

public interface MemberInfoDAO {
	
	
	//메인에서 -> 회원가입 폼 입력시에
	public void insertMember(MemberInfoVO vo);
	
	//회원가입시 아이디 중복검사에 사용
	public boolean selectId(String member_id);
	
	//회원가입시 이름(닉네임) 중복검사에 사용
	public boolean selectName(String member_name);
	
	//로그인 할시에 db에 해당되는 정보가 있는지에 대해 확인
	public boolean loginConfirm(MemberInfoVO vo);
	
	//회원정보에서, 수정 삭제시 기존 비밀번호를 입력해서 일치하면 처리 하게 해주는 메소드. : 비밀번호 체크
	public boolean checkPw(String member_id,String member_pw);
	
	//회원정보에서 삭제처리
	public void deleteMember(String member_id);
	
	//회원정보에서 수정처리
	public void updateMember(MemberInfoVO vo);
	
	//로그아웃 처리 -> 필요한 쿼리문이 존재하지 않기때문에 DAO를 거치지 않고 서비스단에서 해결가능.
	
	//해당되는 이름(닉네임)의 아이디로 select해주기  
	public MemberInfoVO viewMember(String member_id);
	
	//로그인시 db에 정보가 있으면 해당되는 객체의 session을 등록하기 위해
	public MemberInfoVO viewMember(MemberInfoVO vo);
	
	//회원정보에서 회원의 비밀번호 수정시
	public void updatePwd(String member_id, String member_pw);


}


/*//메인에서 -> 회원관리 누를시에
public List<MemberInfoVO> memberList();*/


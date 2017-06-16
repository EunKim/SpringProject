package com.test.first.service.member;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.test.first.mapper.dao.member.MemberInfoDAOImpl;
import com.test.first.mapper.dto.member.MemberInfoVO;

@Service
public class MemberInfoServiceImpl implements MemberInfoService {

	@Inject
	MemberInfoDAOImpl memberInfoDAO;


	// 메인에서 -> 회원가입 폼 입력시에 : 전체 입력
	@Override
	public void insertMember(MemberInfoVO vo) {
		// TODO Auto-generated method stub
		memberInfoDAO.insertMember(vo);
	}
	
	
	// 회원가입시 아이디 중복 확인
	@Override
	public boolean isAvailableId(String member_id) {
		// TODO Auto-generated method stub
		boolean result = memberInfoDAO.selectId(member_id);
		if (result == false) {
			return false;
		} else {
			return true;
		}
	}
	
	//회원가입시 이름(닉네임) 중복 확인용
	@Override
	public boolean isAvailableName(String member_name) {
		
		boolean result = memberInfoDAO.selectName(member_name);
		if(result == false){
			return false;
		}else{
			return true;
		}
	}
	
	// 로그인 할시에 db에 해당되는 정보가 있는지에 대해 확인
	@Override
	public boolean loginConfirm(MemberInfoVO vo, HttpSession session) {
		// TODO Auto-generated method stub

		boolean result = memberInfoDAO.loginConfirm(vo); // 해당되는 쿼리(db에 있는 회원인지
		if (result) { // true일 경우 세션 등록
			MemberInfoVO vo2 = viewMember(vo);

			// 세션변수 등록
			session.setAttribute("member_id", vo2.getMember_id());
			session.setAttribute("member_name", vo2.getMember_name());
		}
		return result;
	}
	
	// 회원정보에서, 수정 삭제시 기존 비밀번호를 입력해서 일치하면 처리 하게 해주는 메소드.
	@Override
	public boolean checkPw(String member_id, String member_pw) {
		// TODO Auto-generated method stub
		return memberInfoDAO.checkPw(member_id, member_pw);
	}
	
	// 해당 id를 가진 회원을 삭제처리하며 session들을 모두 삭제 처리하여 로그아웃처리
	@Override
	public void deleteMember(String member_id, HttpSession session) {
		// TODO Auto-generated method stub
		session.invalidate();
		memberInfoDAO.deleteMember(member_id);
	}
	
	// 회원정보의 비밀번호까지 맞으면 회원정보 수정 처리
	@Override
	public void updateMember(MemberInfoVO vo) {
		// TODO Auto-generated method stub
		memberInfoDAO.updateMember(vo);
	}

	// 로그아웃 처리 : session을 초기화 시킨다.
	@Override
	public void logout(HttpSession session) {

		// 개별 로 삭제하는 방법
		// session.removeAttribute("uid");

		// 세션 정보를 초기화 시킴
		session.invalidate();
	}
	
	// 맨위의 해당되는 이름(닉네임)의 닉네임을 통하여 그에 해당하는 회원정보만을 가져와서 뿌려는 단계
	@Override
	public MemberInfoVO viewMember(String member_id) {
		// TODO Auto-generated method stub
		return memberInfoDAO.viewMember(member_id);
	}
	
	//loginConfirm에서 회원db확인후에 일치하면 해당되는 정보의 db를 객체화 시켜와서 session변수로 등록하기 위해서 필요
	@Override
	public MemberInfoVO viewMember(MemberInfoVO vo) {
		// TODO Auto-generated method stub
		return memberInfoDAO.viewMember(vo);
	}
	
	//회원정보에서 비밀번호 수정시에 필요
	@Override
	public void updatePwd(String member_id, String member_pw) {
		// TODO Auto-generated method stub
		memberInfoDAO.updatePwd(member_id, member_pw);
	}



}




/*// 메인에서 -> 회원관리 누를시에 MemberInfoDAOImpl 에서 사용할 메소드 선택
@Override
public List<MemberInfoVO> memberList() {
	// TODO Auto-generated method stub
	return memberInfoDAO.memberList();
}*/

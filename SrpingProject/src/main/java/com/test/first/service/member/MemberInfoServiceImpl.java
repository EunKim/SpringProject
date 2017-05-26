package com.test.first.service.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.test.first.mapper.dao.member.MemberInfoDAOImpl;
import com.test.first.mapper.dto.member.MemberInfoVO;

@Service
public class MemberInfoServiceImpl implements MemberInfoService {
	
	@Inject
	MemberInfoDAOImpl memberInfoDAO;

	//메인에서 -> 회원관리 누를시에  MemberInfoDAOImpl 에서 사용할 메소드 선택
	@Override
	public List<MemberInfoVO> memberList() {
		// TODO Auto-generated method stub
		return memberInfoDAO.memberList();
	}

	//메인에서 -> 회원가입 폼 입력시에 : 전체 입력
	@Override
	public void insertMember(MemberInfoVO vo) {
		// TODO Auto-generated method stub
		memberInfoDAO.insertMember(vo);
	}

	//로그인 할시에 db에 해당되는 정보가 있는지에 대해 확인
	@Override
	public boolean loginConfirm(MemberInfoVO vo, HttpSession session) {
		// TODO Auto-generated method stub
		
		boolean result = memberInfoDAO.loginConfirm(vo); //해당되는 쿼리(db에 있는 회원인지 아닌지)가 참인지 거짓인지 확인
		if(result){ //true일 경우 세션 등록
			MemberInfoVO vo2 = viewMember(vo);
			
			//세션변수 등록
			session.setAttribute("uid", vo2.getUid());
			session.setAttribute("uname", vo2.getUname());
		}
		return result;
	}
	
	//로그아웃 처리 : session을 초기화 시킨다.
	@Override
	public void logout(HttpSession session) {
		
		//개별 로 삭제하는 방법
		//session.removeAttribute("uid");
		
		//세션 정보를 초기화 시킴
		session.invalidate();
	}
	
	
	//맨위의 해당되는 이름(닉네임)의 닉네임을 통하여 그에 해당하는 회원정보만을 가져와서 뿌려는 단계
	@Override
	public MemberInfoVO viewMember(String uid) {
		// TODO Auto-generated method stub
		return memberInfoDAO.viewMember(uid);
	}

	//회원정보에서, 수정 삭제시 기존 비밀번호를 입력해서 일치하면 처리 하게 해주는 메소드.
	@Override
	public boolean checkPw(String uid, String upw) {
		// TODO Auto-generated method stub
		return memberInfoDAO.checkPw(uid, upw);
	}
	
	//회원정보의 비밀번호까지 맞으면 회원정보 수정 처리
	@Override
	public void updateMember(MemberInfoVO vo) {
		// TODO Auto-generated method stub
		memberInfoDAO.updateMember(vo);
	}
	
	//해당 id를 가진 회원을 삭제처리하며 session들을 모두 삭제 처리하여 로그아웃처리
	@Override
	public void deleteMember(String uid,HttpSession session) {
		// TODO Auto-generated method stub
		session.invalidate();
		memberInfoDAO.deleteMember(uid);
	}

	

	

	

	@Override
	public MemberInfoVO viewMember(MemberInfoVO vo) {
		// TODO Auto-generated method stub
		return memberInfoDAO.viewMember(vo);
	}

	



	

}

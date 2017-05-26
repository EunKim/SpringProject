package com.test.first.mapper.dao.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.first.mapper.dto.member.MemberInfoVO;

@Repository
public class MemberInfoDAOImpl implements MemberInfoDAO {

	@Inject
	SqlSession sqlSession;

	// 메인에서 -> 회원관리 누를시에 memberMapper에서 해당되는 login아이디를 가진 매퍼에서, memInfoList를 찾아옴.
	@Override
	public List<MemberInfoVO> memberList() {

		return sqlSession.selectList("login.memInfoList");
	}

	// 메인에서 -> 회원가입을 누를시에 memberMapper에서 해당되는 login아이디를 가진 매퍼에서, memInfoInsert를 찾아옴. / vo : 회원정보 전체를 입력할꺼기 때문에 필요
	@Override
	public void insertMember(MemberInfoVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert("login.memInfoInsert", vo);
	}

	
	// 로그인 할시에 해당 매퍼를 통해서 db에 정보가 있는지 없는지 확인, 회원이름이 정보가있는지 없는지 확인
	@Override
	public boolean loginConfirm(MemberInfoVO vo) {
		String uid = sqlSession.selectOne("login.loginConfirm", vo);

		return (uid == null) ? false : true;
	}
	
	//로그아웃 처리 -> 필요한 쿼리문이 존재하지 않기때문에 DAO를 거치지 않고 서비스단에서 해결가능.
	
	
	//맨위의 해당되는 이름(닉네임)의 아이디를  통하여 그에 해당하는 회원정보만을 가져와서 뿌려는 단계
	@Override
	public MemberInfoVO viewMember(String uid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("login.memInfoView", uid);
	}
	
	//회원정보에서, 수정 삭제시 기존 비밀번호를 입력해서 일치하면 처리 하게 해줌.
	@Override
	public boolean checkPw(String uid, String upw) {
		// TODO Auto-generated method stub
		boolean result = false;
		// 값을 두개를 넘겨야 할때는 hahsmap으로
		Map<String, String> map = new HashMap<String, String>();
		map.put("uid", uid);
		map.put("upw", upw);
		int count = sqlSession.selectOne("login.checkPw", map);

		if (count == 1)result = true;

		return result;
	}
	
	//회원정보의 비밀번호까지 맞으면 회원정보 수정에 해당하는 쿼리문을 가진것을 불러옴.
	@Override
	public void updateMember(MemberInfoVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update("login.memInfoUpdate", vo);
	}	

	//회원정보의 비밀번호까지 일치하면 회원정보 삭제하는 쿼리문 가져옴.
	@Override
	public void deleteMember(String uid) {
		// TODO Auto-generated method stub
		sqlSession.update("login.memInfoDelete", uid);
	}

	

	@Override
	public MemberInfoVO viewMember(MemberInfoVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("login.viewMember", vo);
	}



}

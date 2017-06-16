package com.test.first.mapper.dao.member;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.first.mapper.dto.member.MemberInfoVO;

@Repository
public class MemberInfoDAOImpl implements MemberInfoDAO {

	@Inject
	SqlSession sqlSession;

	// 메인에서 -> 회원가입을 누를시에 memberMapper에서 해당되는 login아이디를 가진 매퍼에서, memInfoInsert를 찾아옴. / vo : 회원정보 전체를 입력할꺼기 때문에 필요
	@Override
	public void insertMember(MemberInfoVO vo) {
		sqlSession.insert("login.insertMember", vo);
	}

	// 회원가입시 아이디 중복검사에 사용
	@Override
	public boolean selectId(String member_id) {

		// 1이면 해당되는 id가 있는거고, 0이면 false
		boolean result = false;
		int count = sqlSession.selectOne("login.selectMemberId", member_id);

		if (count == 1)
			result = true;
		return result;
	}

	// 회원가입시 이름(닉네임) 중복검사에 사용
	@Override
	public boolean selectName(String member_name) {

		// 1이면 해당되는 id가 있는거고, 0이면 false
		boolean result = false;
		int count = sqlSession.selectOne("login.selectMemberName", member_name);

		if (count == 1)
			result = true;
		return result;

	}

	// 로그인 할시에 해당 매퍼를 통해서 db에 정보가 있는지 없는지 확인, 회원이름이 정보가있는지 없는지 확인
	@Override
	public boolean loginConfirm(MemberInfoVO vo) {
		boolean result = false;
		int count = sqlSession.selectOne("login.selectMember", vo);
		// String uid = sqlSession.selectOne("login.loginConfirm", vo);
		
		// return (uid == null) ? false : true;
		
		if (count == 1)
			result = true;
		
		return result;
		
	}
	
	// 회원정보에서, 수정 삭제시 기존 비밀번호를 입력해서 일치하면 처리 하게 해줌.
	@Override
	public boolean checkPw(String member_id, String member_pw) {
		boolean result = false;
		// 값을 두개를 넘겨야 할때는 hahsmap으로
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		map.put("member_pw", member_pw);
		int count = sqlSession.selectOne("login.selectMember", map);
		
		if (count == 1)
			result = true;
		
		return result;
	}
	
	// 회원정보의 비밀번호까지 일치하면 회원정보 삭제하는 쿼리문 가져옴.
	@Override
	public void deleteMember(String member_id) {
		sqlSession.update("login.deleteMember", member_id);
	}
	
	// 회원정보의 비밀번호까지 맞으면 회원정보 수정에 해당하는 쿼리문을 가진것을 불러옴.
	@Override
	public void updateMember(MemberInfoVO vo) {
		sqlSession.update("login.updateMember", vo);
	}
	
	// 로그아웃 처리 -> 필요한 쿼리문이 존재하지 않기때문에 DAO를 거치지 않고 서비스단에서 해결가능.
	

	// 맨위의 해당되는 이름(닉네임)의 아이디를 통하여 그에 해당하는 회원정보만을 가져와서 뿌려는 단계 ,
	@Override
	public MemberInfoVO viewMember(String member_id) {
		return sqlSession.selectOne("login.infoViewMember", member_id);
	}
	
	//로그인시 db에 정보가 있으면 해당되는 객체의 session을 등록하기 위해
	@Override
	public MemberInfoVO viewMember(MemberInfoVO vo) {
		return sqlSession.selectOne("login.viewMember", vo);
	}
	
	
	// 회원정보에서 비밀번호수정시 이루어지는 쿼리.
	@Override
	public void updatePwd(String member_id, String member_pw) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		map.put("member_pw", member_pw);
		sqlSession.update("login.updateMemberPwd", map);
	}
	

}





/*// 메인에서 -> 회원관리 누를시에 memberMapper에서 해당되는 login아이디를 가진 매퍼에서, memInfoList를 찾아옴.
@Override
public List<MemberInfoVO> memberList() {

	return sqlSession.selectList("login.memInfoList");
}*/

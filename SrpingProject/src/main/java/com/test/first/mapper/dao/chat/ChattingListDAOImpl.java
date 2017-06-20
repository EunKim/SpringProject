package com.test.first.mapper.dao.chat;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ChattingListDAOImpl implements ChattingListDAO {

	@Inject
	SqlSession sqlSession;
	
	//채팅방의 멤버인지 아닌지 유무를 확인
	@Override
	public boolean confirmChatMember(int room_num, String chat_member_id) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("room_num", room_num);
		map.put("chat_member_id", chat_member_id);
		
		boolean result = false;
		int count = sqlSession.selectOne("chattingList.selectListMember", map);
		
		if(count == 1) result = true;
		System.out.println("3333");
		return result;
	}

	//채팅방에 처음 입장시 정보 입력
	@Override
	public void insertChatMember(int room_num, String chat_member_id) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("room_num", room_num);
		map.put("chat_member_id", chat_member_id);
		System.out.println(chat_member_id);
		
		sqlSession.insert("chattingList.insertList", map);
		
	}

}

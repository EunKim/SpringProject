package com.test.first.service.chat;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.first.mapper.dao.chat.ChattingListDAOImpl;


@Service
public class ChattingListServiceImpl implements ChattingListService {
	
	@Inject
	ChattingListDAOImpl chattingListDAO;

	//해당하는 채팅방에 있는 멤버인지 확인
	@Override
	public boolean confirmChatMember(int room_num, String chat_member_id) {
		boolean result = chattingListDAO.confirmChatMember(room_num, chat_member_id);
		return result;
	}

	//처음이라면 해당되는 멤버를 정보 삽입
	@Override
	public void insertChatMember(int room_num, String chat_member_id) {
		chattingListDAO.insertChatMember(room_num, chat_member_id);
	}

}

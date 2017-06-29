package com.test.first.service.chat;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.first.mapper.dao.chat.ChattingListDAOImpl;
import com.test.first.mapper.dto.board.BoardInfoVO;


@Service
public class ChattingListServiceImpl implements ChattingListService {
	
	@Inject
	ChattingListDAOImpl chattingListDAO;
	
	//특정 id가 참여하고 있는 글의 갯수
	@Override
	public int countMeList(String chat_member_id) {
		return chattingListDAO.countMeList(chat_member_id);
	}

	//특정 id가 참여하고 있는 글의 정보
	@Override
	public List<BoardInfoVO> infoMyChattingList(String chat_member_id) {
		return chattingListDAO.infoMyChattingList(chat_member_id);
	}
	
	
	

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

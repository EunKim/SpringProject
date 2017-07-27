package com.test.first.mapper.dao.chat;

import java.util.List;

import com.test.first.mapper.dto.board.BoardInfoVO;

public interface ChattingListDAO {
	
	//특정 id가 참여하고있는 채팅방의 갯수
	public int countMeList(String chat_member_id);
	
	//특정 id가 참여하고 있는 채팅방의 정보들
	public List<BoardInfoVO> infoMyChattingList(String chat_member_id);
	
	//내가 입장한 시간에 대한 정보만 가지고 나올때
	public long insertTime(int room_num, String chat_member_id);
	
	//채팅방에서 나가기 클릭했을시
	public void deleteChatList(int room_num, String chat_member_id);
	
	
	
	//해당되는 방번호에 해당되는 멤버아이디를 가진 사람이 있는지 없는지 확인 (처음 입장 유무를 확인하기 위해)
	public boolean confirmChatMember(int room_num, String chat_member_id);
	
	//채딩방 처음 입장시 정보 입력
	public void insertChatMember(int room_num, String chat_member_id);


}

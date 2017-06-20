package com.test.first.mapper.dao.chat;

public interface ChattingListDAO {
	
	//해당되는 방번호에 해당되는 멤버아이디를 가진 사람이 있는지 없는지 확인 (처음 입장 유무를 확인하기 위해)
	public boolean confirmChatMember(int room_num, String chat_member_id);
	
	//채딩방 처음 입장시 정보 입력
	public void insertChatMember(int room_num, String chat_member_id);


}

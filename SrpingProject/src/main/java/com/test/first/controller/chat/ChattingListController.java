package com.test.first.controller.chat;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.first.service.chat.ChattingListService;

@Controller
public class ChattingListController {
	
	@Inject
	ChattingListService chattingListSerivce;
	
	//mian.jsp로 갈수 있는 컨트롤
	@RequestMapping("chatting/chatting.do")
	public String chatPage(){
		return "board/chatting";
	}
	
	//해당되는 방에 존재하는 회원인지 아닌지 확인
	@RequestMapping("chattingMember/confirm.do")
	@ResponseBody
	public boolean chatMemberConfirm(int room_num, String chat_member_id){
		boolean result = chattingListSerivce.confirmChatMember(room_num, chat_member_id);
		if(result == false){
			chatMeberInsert(room_num,chat_member_id);
		}
		return result;
	}
	
	//해당되는 방에 정보가 없으면 처음은 정보 입력
	
	public void chatMeberInsert(int room_num, String chat_member_id){
		System.out.println("여기여기" + chat_member_id);
		chattingListSerivce.insertChatMember(room_num, chat_member_id);
	}

}

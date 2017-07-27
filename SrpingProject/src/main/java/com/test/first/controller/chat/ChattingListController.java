package com.test.first.controller.chat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.first.mapper.dto.board.BoardInfoVO;
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
	
	
	//채팅목록에 갯수 및 채팅목록을 가져옴
	@RequestMapping("chattingList/me.do")
	@ResponseBody
	public Object confirmChatLsit( String chat_member_id){
		
		//id가 참여하고 있는 글의 갯수
		//int countMeList  = chattingListSerivce.countMeList(chat_member_id);
		
		
		//특정 id가 참여 하고있는 글의 정보
		List<BoardInfoVO> list = chattingListSerivce.infoMyChattingList(chat_member_id);
		System.out.println(list.get(0).getBoard_num());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		//map.put("countMeList", countMeList);
		
		
		return map;
	}
	
	//해당되는 방에 정보가 없으면 처음은 정보 입력
	public void chatMeberInsert(int room_num, String chat_member_id){
		chattingListSerivce.insertChatMember(room_num, chat_member_id);
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
	
	
	//방번호를 클릭할때마다 실시간으로 다시 돌려주는 컨트롤러
	@RequestMapping("chattingList/room_number.do")
	@ResponseBody
	public Object returnroomNumber(int board_number, String chat_member_id){
		
		Long insertTime = chattingListSerivce.insertTime(board_number, chat_member_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_number", board_number);
		map.put("insertTime", insertTime);
		
		return map;
		
		
	}
	
	//채팅방 나가기 처리
	@RequestMapping("chattingList/deleteChat.do")
	public String deleteChatList(int board_number, String chat_member_id){
		chattingListSerivce.deleteChatList(board_number, chat_member_id);
		return "redirect:/member/main.do";
	}
	
	
	
	
	

	/*@RequestMapping("chattingList/mesub.do")
	@ResponseBody
	public Object confirmChatLsitSub(String chat_member_id){
		System.out.println(chat_member_id + "@@@@@");
		
		//id媛� 李몄뿬�븯怨� �엳�뒗 湲��쓽 媛��닔
		//int countMeList  = chattingListSerivce.countMeList(chat_member_id);
	
		//�듅�젙 id媛� 李몄뿬 �븯怨좎엳�뒗 湲��쓽 �젙蹂�
		List<BoardInfoVO> list = chattingListSerivce.infoMyChattingList(chat_member_id);
		System.out.println(list.get(0).getBoard_num());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		//map.put("countMeList", countMeList);
		
		System.out.println("@@@@@" + list);
		
		return map;
	}*/
	
	

}

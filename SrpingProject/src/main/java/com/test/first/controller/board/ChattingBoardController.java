package com.test.first.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.test.first.mapper.dto.board.BoardInfoVO;
import com.test.first.service.board.ChattingBoardService;
import com.test.first.service.board.Pager;

@Controller
public class ChattingBoardController {

	@Inject
	ChattingBoardService chattingBoardService;
	

	// 메인에서 -> 글목록 누를시 나타나는 채팅방 목록 리스트
	@RequestMapping("board/list.do")
	public ModelAndView chattingList(@RequestParam(defaultValue="1")int curPage,
			@RequestParam(defaultValue="all") String search_option, 
			@RequestParam(defaultValue="") String keyword) {
		
		//레코드 갯수 계산
		int count = chattingBoardService.countArticle(search_option, keyword);
		
		//페이지 나누기 관련 처리
		Pager pager = new Pager(count,curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		
		System.out.println("start" + start + "end" + end);
		
		List<BoardInfoVO> list = chattingBoardService.ChattingBoardList(start,end,search_option,keyword);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/chattingBoard_info");
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("list",list);
		map.put("count",list.size());
		map.put("search_option",search_option);
		map.put("keyword",keyword);
		map.put("pager", pager);
		mav.addObject("map",map);
		
		return mav;
	}

	//채팅 목록에서 눌렀을때에 상세보기로 할수 있게 하는것.
	@RequestMapping(value="board/viewList.do",method=RequestMethod.GET)
	public ModelAndView chattingInfo(@RequestParam int bonumber )throws Exception{
		//조회수 증가처리
		chattingBoardService.increaseViewcnt(bonumber);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/chattingBoard_view");
		mav.addObject("dto", chattingBoardService.viewInfo(bonumber));
		return mav;
	}
	
	//글 목록에서 -> 글쓰기 버튼을 눌러서 글을 작성할수 있는 폼으로 이동하는것
	@RequestMapping("board/writeform.do")
	public String writeform(){
		return "board/chattingBoard_write";
	}
	
	//채팅방만드는 형식을 다 채우고 -> 확인 버튼을 누를시
	@RequestMapping("board/writeList.do")
	public String insertChat(@ModelAttribute BoardInfoVO vo){
		chattingBoardService.insertChatting(vo);
		return "redirect:/board/list.do";
	}
	
	//글 쓰기에서 상세 주소의 지도 선택시 지도쪽으로 이동
	@RequestMapping("board/googlemap.do")
	public String googlemap(){
		return "include/googlemap";
	}

	//글에서 수정 버튼 누를시 수정할수 있는 폼으로 이동
	@RequestMapping(value="board/updateBoard.do",method=RequestMethod.GET)
	public ModelAndView updateboard(@RequestParam int bonumber )throws Exception{
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/chattingBoard_update");
		mav.addObject("dto", chattingBoardService.viewInfo(bonumber));
		return mav;
	}
	
	//채팅방에서 수정완료후에 다시 채팅방 리스트로 돌아가게 하는것.
	@RequestMapping(value="board/updateForm.do",method=RequestMethod.GET)
	public String updateConfirm(@ModelAttribute BoardInfoVO vo){
		chattingBoardService.updateChatting(vo);
		return "redirect:/board/list.do";
	}
	
	@RequestMapping("board/deletchat.do")
	public String deleteChat(int bonumber){
		chattingBoardService.deleteChatting(bonumber);
		return "redirect:/board/list.do";
	}
	
}









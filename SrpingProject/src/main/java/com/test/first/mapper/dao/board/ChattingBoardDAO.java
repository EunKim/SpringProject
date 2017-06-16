package com.test.first.mapper.dao.board;

import java.util.List;

import com.test.first.mapper.dto.board.BoardInfoVO;

public interface ChattingBoardDAO {
	
	//채팅방 목록을 만드는 부분(입력)
	public void insertChatting(BoardInfoVO vo);
	
	//메인에서 -> 글 목록 누를시에
	public List<BoardInfoVO> ChattingBoardList(int start, int end,String search_option, String keyword);
	
	//글 갯수 체크
	public int countArticle(String search_option, String keyword);
	
	//글 목록에서 -> 글을 누르면 상세 페이지로 넘어가는 부분
	public BoardInfoVO viewInfo(int board_num);
	
	//목록을 볼때마다 카운트 되서 조회수 증가하게 하는것
	public void increaseViewcnt(int board_num);
	
	//채팅방 내용을 수정할떄 부분
	public void updateChatting(BoardInfoVO vo);
	
	//채팅방 삭제처리
	public void deleteChatting(int board_num);

}

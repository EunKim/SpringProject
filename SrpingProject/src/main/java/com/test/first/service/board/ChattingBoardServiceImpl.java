package com.test.first.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.test.first.mapper.dao.board.ChattingBoardDAOImpl;
import com.test.first.mapper.dto.board.BoardInfoVO;

@Service
public class ChattingBoardServiceImpl implements ChattingBoardService {
	
	@Inject
	ChattingBoardDAOImpl chattingBoardDAO;

	//채팅 방 목록 보여주는 단계
	@Override
	public List<BoardInfoVO> ChattingBoardList() {
		return chattingBoardDAO.ChattingBoardList();
	}

	//채팅방 목록-> 상세보기로 들어가는 단계
	@Override
	public BoardInfoVO viewInfo(int bonumber) {
		return chattingBoardDAO.viewInfo(bonumber);
	}

	//특정 채팅방의 조회수가 증가할수 있도록하기 위해
	@Override
	public void increaseViewcnt(int bonumber) {
		chattingBoardDAO.increaseViewcnt(bonumber);
	}

	//채팅방을 입력해서 처리하는 부분
	@Override
	public void insertChatting(BoardInfoVO vo) {
		chattingBoardDAO.insertChatting(vo);
	}

}
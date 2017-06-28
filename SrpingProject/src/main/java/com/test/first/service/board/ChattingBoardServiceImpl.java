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

	// 채팅방을 입력해서 처리하는 부분
	@Override
	public void insertChatting(BoardInfoVO vo) {
		chattingBoardDAO.insertChatting(vo);
	}

	// 채팅 방 목록 보여주는 단계
	@Override
	public List<BoardInfoVO> ChattingBoardList(int start, int end, String search_option, String keyword) {
		return chattingBoardDAO.ChattingBoardList(start, end, search_option, keyword);
	}

	// 글 갯수 체크시 사용
	@Override
	public int countArticle(String search_option, String keyword) {
		return chattingBoardDAO.countArticle(search_option, keyword);
	}

	// 채팅방 목록-> 상세보기로 들어가는 단계
	@Override
	public BoardInfoVO viewInfo(int board_num) {
		return chattingBoardDAO.viewInfo(board_num);
	}

	// 특정 채팅방의 조회수가 증가할수 있도록하기 위해
	@Override
	public void increaseViewcnt(int board_num) {
		chattingBoardDAO.increaseViewcnt(board_num);
	}

	// 내가 쓴 게시글 목록
	public List<BoardInfoVO> postingByMe(String member_id, int start, int end) {
		return chattingBoardDAO.postingByMe(member_id, start, end);
	}

	// 내가 쓴 최신 게시글 5개
	public List<BoardInfoVO> postingByMeLimit4(String member_id) {
		return chattingBoardDAO.postingByMeLimit4(member_id);
	}

	// 내가 쓴 게시글 갯수
	public int postingCountByMe(String member_id) {
		System.out.println(chattingBoardDAO.postingCountByMe(member_id));
		return chattingBoardDAO.postingCountByMe(member_id);
	}

	// 채팅방에서 수정버튼 클릭시
	@Override
	public void updateChatting(BoardInfoVO vo) {
		// TODO Auto-generated method stub
		chattingBoardDAO.updateChatting(vo);
	}

	// 채팅방에서 삭제처리 시도시
	@Override
	public void deleteChatting(int board_num) {
		chattingBoardDAO.deleteChatting(board_num);
	}
}
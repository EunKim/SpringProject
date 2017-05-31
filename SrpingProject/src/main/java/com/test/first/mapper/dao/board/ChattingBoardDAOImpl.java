package com.test.first.mapper.dao.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.first.mapper.dto.board.BoardInfoVO;

@Repository
public class ChattingBoardDAOImpl implements ChattingBoardDAO {

	@Inject
	SqlSession sqlSession;
	
	//메인에서 -> 글 목록 선택시 만들어져 있는 채팅방의 목록의 전체 쿼리를 가져옴.
	@Override
	public List<BoardInfoVO> ChattingBoardList() {
		return sqlSession.selectList("chattingBoard.chattingList");
	}

	//글목록에서 -> 누르면 상세로 보기로 넘어가는 부분
	@Override
	public BoardInfoVO viewInfo(int bonumber) {
		return sqlSession.selectOne("chattingBoard.chattingInfo",bonumber);
	}

	//조회수를 볼때마다 증가시킬수 있게하는것
	@Override
	public void increaseViewcnt(int bonumber) {
		sqlSession.update("chattingBoard.increaseViewcnt",bonumber);
	}

	//채팅방을 만들기 위해서 입력을 하는 부분.
	@Override
	public void insertChatting(BoardInfoVO vo) {
		sqlSession.insert("chattingBoard.chattingWrite", vo);
	}
}

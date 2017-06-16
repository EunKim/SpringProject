package com.test.first.mapper.dao.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.first.mapper.dto.board.BoardInfoVO;

@Repository
public class ChattingBoardDAOImpl implements ChattingBoardDAO {

	@Inject
	SqlSession sqlSession;
	
	//채팅방을 만들기 위해서 입력을 하는 부분.
	@Override
	public void insertChatting(BoardInfoVO vo) {
		sqlSession.insert("chattingBoard.insertBoard", vo);
	}
	
	//메인에서 -> 글 목록 선택시 만들어져 있는 채팅방의 목록의 전체 쿼리를 가져옴.
	@Override
	public List<BoardInfoVO> ChattingBoardList(int start, int end,String search_option, String keyword) {
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		//between #{start} and #{end} 에 들어갈 값
		map.put("start", start);
		map.put("end", end);
		
		System.out.println("start1 : " + start);
		System.out.println("end1 : " + end);
		System.out.println("search_option1 : " + search_option);
		System.out.println("keyword1 : " + keyword);
		System.out.println("sqlsession : " + sqlSession.selectList("chattingBoard.selectBoard",map));
		
		
		return sqlSession.selectList("chattingBoard.selectBoard",map);
	}
	
	//글 갯수 체크시 사용
	@Override
	public int countArticle(String search_option, String keyword) {
		Map<String,String> map = new HashMap<String, String>();
		
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("chattingBoard.countArticle",map);
	}
	
	//글목록에서 -> 누르면 상세로 보기로 넘어가는 부분
	@Override
	public BoardInfoVO viewInfo(int board_num) {
		return sqlSession.selectOne("chattingBoard.selectBoardId",board_num);
	}
	
	//조회수를 볼때마다 증가시킬수 있게하는것
	@Override
	public void increaseViewcnt(int board_num) {
		sqlSession.update("chattingBoard.increaseHits",board_num);
	}

	//채팅방에서 수정버튼을 누르고 수정할시에 들어가는 부분
	@Override
	public void updateChatting(BoardInfoVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update("chattingBoard.updateBoard", vo);
	}

	//채팅방 삭제 버튼 클릭시
	@Override
	public void deleteChatting(int board_num) {
		sqlSession.delete("chattingBoard.deleteBoard",board_num);
	}

	
}	
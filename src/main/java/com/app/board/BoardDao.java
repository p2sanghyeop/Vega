package com.app.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
		
	//게시글 저장
	public int boardInsert(BoardDto dto) {
		return sqlSession.insert("board_sql.boardInsert", dto);
	}
	//게시글 상세조회
	public BoardDto boardRead(int board_number) {
		return sqlSession.selectOne("board_sql.boardRead", board_number);
	}

	//게시글 수정
	public int boardUpate(BoardDto dto) {
		return sqlSession.update("board_sql.boardUpdate", dto);
	}
	//게시글 삭제
	public int boardDelete(int board_number) {
		return sqlSession.delete("board_sql.boardDelete", board_number);
	}
	//게시글 총 횟수
	public int getBoardListCnt() {
		return sqlSession.selectOne("board_sql.getBoardListCnt");
	}
	//게시글 조회 페이징
	public List<BoardDto> getBoardList(Pagination pagination) {
		return sqlSession.selectList("board_sql.getBoardList", pagination);
	}

}

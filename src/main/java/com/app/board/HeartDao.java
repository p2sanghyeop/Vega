package com.app.board;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HeartDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public HeartDto findHeart(int board_number) {
		return sqlSession.selectOne("heart_sql.findHeart", board_number);
	}
	
	public HeartDto findHeart(HeartDto dto) {
		return sqlSession.selectOne("heart_sql.findHeart", dto);
	}
	
	public int insertHeart(HeartDto heart) {
		return sqlSession.insert("heart_sql.insertHeart", heart);
	}
	
	public void deleteHeart(HeartDto heart_cnt) {
		sqlSession.delete("heart_sql.deleteHeart",heart_cnt);
	}
}

package com.app.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class RippleDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//댓글 리스트 조회
	public List<RippleDto> getRippleList(RippleDto dto) {
		return sqlSession.selectList("ripple_sql.getRippleList", dto);
	}
	
	//댓글 저장
	public int rippleInsert(RippleDto dto) {
		return sqlSession.insert("ripple_sql.rippleInsert", dto);
	}
	
	//댓글 수정
	public int rippleUpate(RippleDto dto) {
		return sqlSession.update("ripple_sql.rippleUpdate", dto);
	}
		
	//댓글 삭제
	public int rippleDelete(RippleDto dto) {
		return sqlSession.delete("ripple_sql.rippleDelete", dto);
	}
}

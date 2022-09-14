package com.app.board;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * Handles requests for the application home page.
 */

@Controller
public class BoardController {
	
	@Autowired
	BoardDao BoardDao;
	@Autowired
	RippleDao RippleDao;
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//게시글 전체조회 페이징
	@RequestMapping(value="/boardlist", method = RequestMethod.GET)
	public String boardList(Model model, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range, Pagination pagination) {
		
		//전체 게시글 개수
		int listCnt = BoardDao.getBoardListCnt();
		
		//Pagination 객체생성		
		/*Pagination pagination = new Pagination();*/
		pagination.pageInfo(page, range, listCnt);
		
		model.addAttribute("pagination", pagination);		
		model.addAttribute("boardList", BoardDao.getBoardList(pagination));
		
		return "boardlist";
	}
		
		//글 작성페이지 이동
		@RequestMapping(value="/write")
		public String boardWrite() {
			return "write";
		}
		
		//게시글 작성
		@ResponseBody
		@RequestMapping(value="/write",  method = RequestMethod.POST)
		public int boardInsert(@RequestBody BoardDto dto) {
			return BoardDao.boardInsert(dto);
		}
		
		//게시글 상세보기
		
		@RequestMapping(value="/check", method = RequestMethod.GET)
		public String boardCheck(@RequestParam("board_number") int board_number, Model model, Pagination pagination, RippleDto dto) {
			BoardDto boardRead = BoardDao.boardRead(board_number);
			model.addAttribute("boardRead", boardRead);			
			model.addAttribute("pagination", pagination);
			
			System.out.println("RippleDao : "+RippleDao);
			
			List<RippleDto> rippleList = RippleDao.getRippleList(dto);
			System.out.println("rippleList : "+rippleList);
			model.addAttribute("rippleList", rippleList);			
			return "check";
		}
		
		//게시글 수정
		@ResponseBody
		@RequestMapping(value="/check/list", method = RequestMethod.POST)
		public int boardUpdate(@RequestBody BoardDto dto) {
			return BoardDao.boardUpate(dto);
		}
		
		//게시글 삭제
		@ResponseBody
		@RequestMapping(value="/check/list", method = RequestMethod.DELETE)
		public int boardDelete(@RequestParam("board_number") int board_number) {
			return BoardDao.boardDelete(board_number);
		}
		
		//댓글작성
		@ResponseBody
		@RequestMapping(value="/check/ripple",  method = RequestMethod.POST)
		public int rippleInsert(@RequestBody RippleDto dto) {
			return RippleDao.rippleInsert(dto);
		}
		
		//댓글 수정
		@ResponseBody
		@RequestMapping(value="/check/ripple/update", method = RequestMethod.POST)
		public int rippleUpdate(@RequestBody RippleDto dto) {
			return RippleDao.rippleUpate(dto);
		}
				
		//댓글 삭제
		@ResponseBody
		@RequestMapping(value="/check/ripple", method = RequestMethod.DELETE)
		public int rippleDelete(@RequestBody RippleDto dto) {
			return RippleDao.rippleDelete(dto);
		}
		
		
		
//		@ResponseBody
//		@RequestMapping(value="/check", method = RequestMethod.GET)
//		public void boardRead(Model model) {
//			model.addAttribute("boarRead", 0);			
//		}
		
}

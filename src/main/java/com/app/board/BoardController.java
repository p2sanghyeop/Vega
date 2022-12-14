package com.app.board;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	@Autowired
	HeartDao HeartDao;
	
	
	
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
			
			HeartDto heart = new HeartDto();
			heart = HeartDao.findHeart(board_number);

			model.addAttribute("heart", heart);
			
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
		
		//댓글조회
		@RequestMapping(value="/check/ripple",  method = RequestMethod.GET)
		public List<RippleDto> rippleList(RippleDto dto){
			return RippleDao.getRippleList(dto);
			
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
		
		@RequestMapping(value="heart",method=RequestMethod.POST)
		public @ResponseBody int heart(@ModelAttribute HeartDto dto) {
			int result = 0;
			// 좋아요가 이미 있는지 확인하는 코드
			HeartDto find = HeartDao.findHeart(dto);
			
			// find가 null이면 좋아요가 없는 상태이므로 정보 저장
			// find가 null이 아니면 좋아요가 있는 상태이므로 정보 삭제
			if(find==null) {
				// insert의 리턴값은 DB에 성공적으로 insert된 갯수를 보내므로 result가 1이 됨
				result = HeartDao.insertHeart(dto);
			} else {
				HeartDao.deleteHeart(dto);
			}
			return result;
		}
		
//		@ResponseBody
//		@RequestMapping(value="/check", method = RequestMethod.GET)
//		public void boardRead(Model model) {
//			model.addAttribute("boarRead", 0);			
//		}
		
}

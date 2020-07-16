package com.myweb.springweb;


import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.common.Pagination;
import com.myweb.common.Search;
import com.myweb.service.BaordService;
import com.myweb.vo.BoardVO;
import com.myweb.vo.CommantVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BaordService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/board", method = RequestMethod.GET) 
	public String home(Locale locale, Model model,@RequestParam(required=false,defaultValue = "1") int page
			,@RequestParam(required=false,defaultValue = "1") int range
			, @RequestParam(required=false,defaultValue = "title") String searchType
			,@RequestParam(required=false) String keyword
			,@ModelAttribute("search") Search search) throws Exception{
		 
        logger.info("home");
        
        model.addAttribute("search",search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);

        
        //전체 게시글 개수
        int listCnt = service.getBoardListCnt(search);
        //pagination객체
//        Pagination pagination = new Pagination();
//        pagination.pageInfo(page, range, listCnt);
        search.pageInfo(page, range, listCnt);
        List<BoardVO> boardList = service.getBoardList(search);
        model.addAttribute("pagination",search);
        model.addAttribute("boardList", boardList);
 
        return "board/index";
    }
	
	
	
	
	/** 글쓰기  **/
	@RequestMapping("board/boardForm") 
	public String boardForm(@ModelAttribute("boardVO") BoardVO vo, Model model) {
		return "board/boardForm";
	}
	
	@RequestMapping(value = "board/saveBoard", method = RequestMethod.POST)
	public String saveBoard(@ModelAttribute("boardVO") BoardVO boardVO, @RequestParam("mode") String mode, RedirectAttributes rttr) throws Exception {

		if (mode.equals("edit")) {
			service.updateBoard(boardVO);
		} else {
			service.insertBoard(boardVO);
		}
		return "redirect:/board";

	}
	
	/** 내용보기 **/
	@RequestMapping(value = "board/getBoardContent", method = RequestMethod.GET)
	public String getBoardContent(Model model, @RequestParam("bid") int bid)throws Exception{
		
		model.addAttribute("boardContent", service.getBoardContent(bid));
		model.addAttribute("CommantVO",new CommantVO());
		
		return "board/boardContent";
		
	}
	
	/** 수정하기 **/
	@RequestMapping(value = "board/editForm", method = RequestMethod.GET)
	public String editForm(@RequestParam("bid") int bid, @RequestParam("mode") String mode, Model model)throws Exception{
		model.addAttribute("boardContent", service.getBoardContent(bid));
		model.addAttribute("mode",mode);
		model.addAttribute("boardVO",new BoardVO());
	
	
		return "board/boardForm";
		
	}
	
	/** 삭제하기 **/
	@RequestMapping(value = "board/deleteBoard", method = RequestMethod.GET)
	public String deleteBoard(@RequestParam("bid") int bid, RedirectAttributes rttr)throws Exception{
		
		service.deleteBoard(bid);
	
		 return "redirect:/board";
		
	}
	
	/**에러처리**/
	@ExceptionHandler(RuntimeException.class)
	public String exceptionHandler(Model model, Exception e) {
		logger.info("Excpetion:" + e.getMessage()) ;
		model.addAttribute("exception",e);
		return "error/exception";
	}

	
	
	
}

package com.myweb.springweb;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.service.BaordService;
import com.myweb.vo.CommantVO;

@RestController
@RequestMapping(value="/restBoard")
public class RestBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(RestBoardController.class);
	
	@Inject
	private BaordService service;
	
	
	@ResponseBody
	@RequestMapping(value = "/getCommantList", method = RequestMethod.POST)
	public List<CommantVO> getCommantList(@RequestParam("bid") int bid) throws Exception{
		return service.getCommantList(bid);
		
	}
	
	/* 댓글 저장  */
	@RequestMapping(value = "/saveCommant", method = RequestMethod.POST)
	public Map<String,Object> saveCommant(@RequestBody CommantVO commantVO) throws Exception{
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			service.saveCommant(commantVO);
			result.put("status", "OK");
			
		}catch(Exception e) {
			
			e.printStackTrace();
			result.put("status", "False");
		}
		
		return result;
	}
	
	/* 댓글 수정  */
	@RequestMapping(value = "/updateCommant", method = RequestMethod.POST)
	public Map<String,Object> updateCommant(@RequestBody CommantVO commantVO) throws Exception{
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			service.updateCommant(commantVO);
			result.put("status", "OK");
			
		}catch(Exception e) {
			
			e.printStackTrace();
			result.put("status", "False");
		}
		
		return result;
	}
	/* 댓글 삭제  */
	@RequestMapping(value = "/deleteCommant", method = {RequestMethod.GET, RequestMethod.POST})
	public Map<String,Object> deleteCommant(@RequestBody CommantVO commantVO) throws Exception{
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			service.delelteCommant(commantVO.getRid());
			result.put("status", "OK");
			
		}catch(Exception e) {
			
			e.printStackTrace();
			result.put("status", "False");
		}
		
		return result;
	}
}

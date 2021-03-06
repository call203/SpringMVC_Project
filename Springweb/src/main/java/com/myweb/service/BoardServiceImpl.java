package com.myweb.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
 
import org.springframework.stereotype.Service;

import com.myweb.common.Pagination;
import com.myweb.common.Search;
import com.myweb.dao.BoardDAO;
import com.myweb.vo.BoardVO;
import com.myweb.vo.CommantVO;
 
@Service
public class BoardServiceImpl implements BaordService {
 
    @Inject
    private BoardDAO dao; 

	@Override
	public List<BoardVO> getBoardList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return dao.getBoardList(search);
	}

	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		  dao.insertBoard(boardVO);
	}

	@Override
	public BoardVO getBoardContent(int bid) throws Exception {
		// TODO Auto-generated method stub
		dao.updateViewCnt(bid);
		return dao.getBoardContent(bid);
	}

	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		dao.updateBoard(boardVO);
		
	}

	@Override
	public void deleteBoard(int bid) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteBoard(bid);
		
	}
	

	@Override
	public int getBoardListCnt(Search search) throws Exception {
		// TODO Auto-generated method stub
		return dao.getBoardListCnt(search);
	}
	
	/**
	 * 댓글
	 */
	@Override
	public List<CommantVO> getCommantList(int bid) throws Exception {
		// TODO Auto-generated method stub
		return dao.getCommantList(bid);
	}

	@Override
	public void saveCommant(CommantVO commantVO) throws Exception {
		// TODO Auto-generated method stub
		dao.saveCommant(commantVO);
		
	}

	@Override
	public void updateCommant(CommantVO CommantVO) throws Exception {
		// TODO Auto-generated method stub
		dao.updateCommant(CommantVO);
	}

	@Override
	public void delelteCommant(int rid) throws Exception {
		// TODO Auto-generated method stub
		dao.delelteCommant(rid);
		
	}
    

}


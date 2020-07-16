package com.myweb.service;
import java.util.List;
import java.util.Map;

import com.myweb.common.Pagination;
import com.myweb.common.Search;
import com.myweb.vo.BoardVO;
import com.myweb.vo.CommantVO;

 
public interface BaordService {
    
    public List<BoardVO> getBoardList(Search search) throws Exception;
    
    public void insertBoard(BoardVO boardVO) throws Exception; 
    
    public BoardVO getBoardContent(int bid) throws Exception;
    
    public void updateBoard(BoardVO boardVO) throws Exception;
      
    public void deleteBoard(int bid) throws Exception;
    
    public int getBoardListCnt(Search search) throws Exception;
    
     //댓글
  	 public List<CommantVO> getCommantList(int bid) throws Exception;
  	 
  	 public void saveCommant(CommantVO commantVO) throws Exception;
  	 
  	 public void updateCommant(CommantVO CommantVO) throws Exception;
  	 
  	 public void delelteCommant(int rid) throws Exception;
    
}

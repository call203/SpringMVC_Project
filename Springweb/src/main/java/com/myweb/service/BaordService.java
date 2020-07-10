package com.myweb.service;
import java.util.List;
import java.util.Map;

import com.myweb.common.Pagination;
import com.myweb.common.Search;
import com.myweb.vo.BoardVO;

 
public interface BaordService {
    
    public List<BoardVO> getBoardList(Search search) throws Exception;
    
    public void insertBoard(BoardVO boardVO) throws Exception; 
    
    public BoardVO getBoardContent(int bid) throws Exception;
    
    public void updateBoard(BoardVO boardVO) throws Exception;
      
    public void deleteBoard(int bid) throws Exception;
    
    public int getBoardListCnt(Search search) throws Exception;
    
}

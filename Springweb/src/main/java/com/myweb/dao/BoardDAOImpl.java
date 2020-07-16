package com.myweb.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myweb.common.Pagination;
import com.myweb.common.Search;
import com.myweb.vo.BoardVO;
import com.myweb.vo.CommantVO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	
	private static final String Namespace="com.myweb.mybatis.sql.test";
	private static final String Namespace2="com.myweb.mybatis.sql.commantMapper";

	@Override
	public List<BoardVO> getBoardList(Search search) throws Exception {
		// TODO Auto-generated method stub		
		return sqlSession.selectList(Namespace+".getBoardList",search);
	}

	@Override
	public BoardVO getBoardContent(int bid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".getBoardContent",bid);
	}


	@Override
	 public void insertBoard(BoardVO boardVO) throws Exception{
		// TODO Auto-generated method stub
		 sqlSession.insert(Namespace+".insertBoard",boardVO);
	}

	@Override
	public void deleteBoard(int bid) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(Namespace+".deleteBoard", bid);
	}

	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		 sqlSession.update(Namespace+".updateBoard", boardVO);
	}

	@Override
	public int updateViewCnt(int bid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(Namespace+".updateViewCnt",bid);
	}

	@Override
	public int getBoardListCnt(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace + ".getBoardListCnt",search);
	}

	/**
	 * 댓글
	 */
	@Override
	public List<CommantVO> getCommantList(int bid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace2+".getCommantList",bid);
	}

	@Override
	public void saveCommant(CommantVO commantVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(Namespace2+".saveCommant", commantVO);
		
	}

	@Override
	public void updateCommant(CommantVO CommantVO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(Namespace2+".updateCommant", CommantVO);
		
	}

	@Override
	public void delelteCommant(int rid) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(Namespace2+".deleteCommant", rid);
	}
	

}

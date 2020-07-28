package com.myweb.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myweb.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Inject
	private SqlSession sqlSession;
		
	private static final String Namespace="com.myweb.mybatis.sql.userMapper";
	

	@Override
	public List<UserVO> getUserList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(Namespace+".getUserList");
	}

	@Override
	public UserVO getUserInfo(String uid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(Namespace+".getUserInfo",uid);
		
	}

	@Override
	public void insertUser(UserVO uservo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert(Namespace+".insertUser",uservo);
		
	}

	@Override
	public void updateUser(UserVO uservo) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update(Namespace+".updateUser",uservo);
		
	}

	@Override
	public void deleteUser(String uid) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.delete(Namespace+".User",uid);
		
	}

}

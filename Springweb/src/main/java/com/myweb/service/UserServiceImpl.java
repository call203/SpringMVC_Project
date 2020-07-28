package com.myweb.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.dao.BoardDAO;
import com.myweb.dao.UserDAO;
import com.myweb.vo.UserVO;

@Service

public class UserServiceImpl implements UserService{
	
	 @Inject
	 private UserDAO dao; 

	@Override
	public List<UserVO> getUserList() throws Exception {
		// TODO Auto-generated method stub
		return dao.getUserList();
	}

	@Override
	public UserVO getUserInfo(String uid) throws Exception {
		// TODO Auto-generated method stub
		return dao.getUserInfo(uid);
	}

	@Override
	public void insertUser(UserVO uservo) throws Exception {
		// TODO Auto-generated method stub
		dao.insertUser(uservo);
	}

	@Override
	public void updateUser(UserVO uservo) throws Exception {
		// TODO Auto-generated method stub
		dao.updateUser(uservo);
	}

	@Override
	public void deleteUser(String uid) throws Exception {
		// TODO Auto-generated method stub
		dao.deleteUser(uid);
	}

}

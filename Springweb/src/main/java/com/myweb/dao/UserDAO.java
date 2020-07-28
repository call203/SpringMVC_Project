package com.myweb.dao;

import java.util.List;

import com.myweb.common.Search;
import com.myweb.vo.BoardVO;
import com.myweb.vo.UserVO;

public interface UserDAO {
	
	public List<UserVO> getUserList() throws Exception;
	 
	public UserVO getUserInfo(String uid) throws Exception;
	 
	public void insertUser(UserVO uservo) throws Exception;
	
	public void updateUser(UserVO uservo) throws Exception;
	 
	public void deleteUser(String uid) throws Exception;


}

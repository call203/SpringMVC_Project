package com.myweb.springweb;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myweb.service.BaordService;
import com.myweb.service.UserService;
import com.myweb.vo.UserVO;

@Controller
@RequestMapping(value="/user")
public class UserController {
	
private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Inject
	private UserService service;
	
	
	
	@RequestMapping(value = "/getuserList",method = {RequestMethod.GET,RequestMethod.POST})
	public String getUserList(Model model) throws Exception{
		
		logger.info("getUserList()....");
		
		model.addAttribute("userList",service.getUserList());
		
		return "user/userList";	
	}
	
	@RequestMapping(value = "/insertuser",method = RequestMethod.POST)
	public String insertUser(@ModelAttribute("UserVO") UserVO uservo, RedirectAttributes rttr) throws Exception{
		
		logger.info("getUserList()....");
		
		service.insertUser(uservo);
		
		return "redirect:/user/getuserList";	
	}
	
	@RequestMapping(value = "/signupForm",method = RequestMethod.GET)
	public String insertUser(Model model) throws Exception{
		
		model.addAttribute("userVO", new UserVO());
		
		return "user/signupForm";	
	}

}

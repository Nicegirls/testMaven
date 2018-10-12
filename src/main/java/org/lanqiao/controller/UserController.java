package org.lanqiao.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.lanqiao.entity.Fee;
import org.lanqiao.entity.User;
import org.lanqiao.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@Resource
	private UserService userService;
	
	@RequestMapping("/login")
	public String userlogin(User user,Model model,HttpSession session){
		return "account/account_list";
	}
	
	@RequestMapping("/logout")
	public String userLogout(HttpSession session){
		User user = (User) session.getAttribute("user");
		User userFee = userService.getUserById(user);
		System.out.println(user.getDet_htime());
		Fee fee = userFee.getFee();
		if(fee.getFee_type()==1){
			user.setDet_fee(0.0);
		}
		if(fee.getFee_type()==2){
			if(userFee.getDet_htime()/3600.0<=fee.getFee_btime()){
				user.setDet_fee(0.0);
			}else{
				user.setDet_fee(fee.getFee_ufee()*(userFee.getDet_sumtime()/3600.0));
			}
		}
		if(fee.getFee_type()==3){
			user.setDet_fee(fee.getFee_ufee()*(userFee.getDet_sumtime()/3600.0));
		}
		userService.updateDetail(user);
		session.removeAttribute("user");
		return "user/userlogin";
	}
}

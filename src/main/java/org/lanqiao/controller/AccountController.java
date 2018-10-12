package org.lanqiao.controller;

import java.io.PrintWriter;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.lanqiao.entity.Account;
import org.lanqiao.entity.Page;
import org.lanqiao.entity.Service;
import org.lanqiao.service.AccountService;
import org.lanqiao.service.ServiceService;
import org.lanqiao.util.JudgeIdcard;
import org.lanqiao.util.RegExpValidatorUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Resource
	private AccountService accountService;
	@Resource
	private ServiceService serviceService ; 	
	//跳转到添加页面
	@RequestMapping("/insert.action")
	public String insertAccount(){
		return "account/account_add";
	}
	
	//添加验证
	@RequestMapping("/check.action")
	public void checkAccount(Account account,String acc_repsw,PrintWriter out){
		if(account.getAcc_name()==null||"".equals(account.getAcc_name())){
			out.print("3");
			return;
		}
		if(!RegExpValidatorUtils.isFee_name(account.getAcc_name().trim())){
			//out.print("姓名格式有误！");
			out.print("s");
			return;
		}
		if(account.getAcc_idcard()==null||"".equals(account.getAcc_idcard())){
			out.print("33");
			return;
		}
		if(!JudgeIdcard.judge(account.getAcc_idcard().trim())){
			
			//out.print("身份证号格式有误！");
			out.print("1");
			return;
		}
		if(account.getAcc_account()==null||"".equals(account.getAcc_account())){
			//out.print("账务账号格式有误！");
			out.print("333");
			return;
		}
		if(!RegExpValidatorUtils.isAccount(account.getAcc_account().trim())){
			//out.print("账务账号格式有误！");
			out.print("11");
			return;
		}
		if(account.getAcc_psw()==null||"".equals(account.getAcc_psw())){
			//out.print("密码格式有误！");
			out.print("3333");
			return;
		}
		if(!RegExpValidatorUtils.isPassword(account.getAcc_psw())){
			//out.print("密码格式有误！");
			out.print("111");
			return;
		}
		if(!acc_repsw.equals(account.getAcc_psw())){
			//out.print("两次密码不一致！");
			out.print("1111");
			return;
		}
		if(account.getAcc_telnum()==null||"".equals(account.getAcc_telnum())){
	           //out.print("手机号码格式有误！");
			out.print("33333");
			return;
		}
		if(!RegExpValidatorUtils.isHandset(account.getAcc_telnum().trim())){
	           //out.print("手机号码格式有误！");
			out.print("11111");
			return;
		}
		
		if(account.getAcc_rec_idcard()!=null&&!"".equals(account.getAcc_rec_idcard())&&!JudgeIdcard.judge(account.getAcc_idcard().trim())){
			//out.print("身份证号格式有误！");
			out.print("111111");
			return;
		}
		if(account.getAcc_email()!=null&&!"".equals(account.getAcc_email())&&!RegExpValidatorUtils.isEmail(account.getAcc_email().trim())){
			//out.print("邮件格式有误！");
			out.print("1111111");
			return;
		}
		if(account.getAcc_postcode()!=null&&!"".equals(account.getAcc_postcode())&&!RegExpValidatorUtils.isPostalcode(account.getAcc_postcode().trim())){
			//out.print("邮编格式有误！");
			out.print("11111111");
			return;
		}
		if(account.getAcc_qq()!=null&&!"".equals(account.getAcc_qq())&&!RegExpValidatorUtils.isQQ(account.getAcc_qq())){
			out.print("2");
			return;
		}
		out.print("true");
		
	}
	
	//添加账务账号信息
	@RequestMapping("/add.action")
	public void insertAccount(Account account,PrintWriter out){
		Date date1=new Date();
		Timestamp acc_cretime=new Timestamp(date1.getTime());
		Timestamp acc_otime=new Timestamp(date1.getTime());
		account.setAcc_cretime(acc_cretime);
		account.setAcc_otime(acc_otime);
		account.setAcc_status(1);
		Boolean b=accountService.insertAccount(account);

		if(b){
			out.print("true");
		}else{
			out.print("false");
		}
	}
	
	//删除账务账号信息
	@RequestMapping("/delete.action")
	public void deleteAccount(HttpServletRequest request,PrintWriter out){
		Account account=new Account();
		String s=request.getParameter("acc_id");
		int acc_id=Integer.parseInt(s);
		account.setAcc_id(acc_id);
		account.setAcc_status(0);
		Date date1=new Date();
		Timestamp acc_dtime=new Timestamp(date1.getTime());
		account.setAcc_dtime(acc_dtime);
		Service service=new Service();
		service.setAcc_id(acc_id);
		Boolean b=accountService.deleteAccount(account);
		Boolean b1=serviceService.deleteServiceByID1(service);
		if(b){
			out.print("true");
		}else{
			out.print("false");
		}
	}
	
	//跳转到账务账号主界面
	@RequestMapping("/se.action")
	public String select(){
		return "forward:/account/select.action";
	}
	
	//通过账务账号ID查询所有信息
	@RequestMapping("/update.action")
	public String selectAccountByID(HttpServletRequest request,Model model){
		Account account=new Account();
		String s=request.getParameter("acc_id");
		int acc_id=Integer.parseInt(s);
		account.setAcc_id(acc_id);
		Account lac=accountService.selectAccountByID(account);
		if(lac==null){
			model.addAttribute("syi","false");
			return "error";
		}else{
			model.addAttribute("accc",lac);
			return "account/account_detail";
		}
	}
	
	//修改账务账号状态
	@RequestMapping("/update1.action")
	public void updateAccountState(HttpServletRequest request,PrintWriter out){
		Account account=new Account();
		Service service=new Service();
		String s=request.getParameter("acc_id");
		int acc_id=Integer.parseInt(s);
		String s1=request.getParameter("acc_status");
		int a=Integer.parseInt(s1);
		Date date=new Date();
		Timestamp ts=new Timestamp(date.getTime());
		Boolean b=null;
		Boolean b1=null;
		if(a==1){
			int acc_status=2;
			account.setAcc_id(acc_id);
			account.setAcc_status(acc_status);
			account.setAcc_ptime(ts);
			service.setAcc_id(acc_id);
			service.setSer_status(acc_status);
			b=accountService.updateAccountState(account);
			b1=serviceService.stopServiceByID1(service);
		}else{
			int acc_status=1;
			account.setAcc_id(acc_id);
			account.setAcc_status(acc_status);
			account.setAcc_otime(ts);
			service.setAcc_id(acc_id);
			service.setSer_status(acc_status);
			b=accountService.updateAccountState1(account);
			
		}
		if(b){
			out.print("true");
		}else{
			out.print("false");
		}
	}
	
	//将指定ID的账务账号信息显示在修改界面上
	@RequestMapping("/modify.action")
	public String modifyAccount(HttpServletRequest request,Model model){
		Account account=new Account();
		String s=request.getParameter("acc_id");
		int acc_id=Integer.parseInt(s);
		account.setAcc_id(acc_id);
		Account account1=accountService.selectAccountByID(account);
		String s1=account1.getAcc_idcard();
		String month=s1.substring(10,12);
		String day=s1.substring(12,14);
		String acc_birth=month+"-"+day;
		account1.setAcc_birth(acc_birth);
		model.addAttribute("accco",account1);
		return "/account/account_modi";
	}
	
	
	//修改验证
	@RequestMapping("/updateCheck.action")
	public void updateCheck(Account account,PrintWriter out,String acc_repsw,String acc_oldpsw){
		Account account2=accountService.selectAccountByID(account);
		String psw=account2.getAcc_psw();
		if(account.getAcc_name()==null||"".equals(account.getAcc_name())){
			out.print("3");
			return;
		}
		if(!RegExpValidatorUtils.isFee_name(account.getAcc_name().trim())){
			out.print("s");
			return;
		}
	

		if(account.getAcc_telnum()==null||"".equals(account.getAcc_telnum())){
	           //out.print("手机号码格式有误！");
			out.print("33");
			return;
		}
		if(!RegExpValidatorUtils.isHandset(account.getAcc_telnum().trim())){
			//out.print("手机号码格式有误！");
			out.print("11111");
			return;
		}
		if(account.getAcc_rec_idcard()==null&&!"".equals(account.getAcc_rec_idcard())&&!JudgeIdcard.judge(account.getAcc_idcard().trim())){
			//out.print("身份证号格式有误！");
			out.print("1");
			return;
		}
		if(account.getAcc_email()==null&&!"".equals(account.getAcc_email())&&!RegExpValidatorUtils.isEmail(account.getAcc_email().trim())){
			//out.print("邮件格式有误！");
			out.print("1111111");
			return;
		}
		if(account.getAcc_postcode()==null&&!"".equals(account.getAcc_postcode())&&!RegExpValidatorUtils.isPostalcode(account.getAcc_postcode().trim())){
			//out.print("邮编格式有误！");
			out.print("11111111");
			return;
		}
		
		if(account.getAcc_qq()==null&&!"".equals(account.getAcc_qq())&&!RegExpValidatorUtils.isQQ(account.getAcc_qq())){
			out.print("2");
			return;
		}
		//out.print("true");
		System.out.println(1);
		Boolean b=accountService.updateAllAccount(account);
		System.out.println(2);
		if(b){
			out.print("true");
		}else{
			out.print("false");
		}
	}
	//修改账务账号所有信息
	@RequestMapping("/update2.action")
	public void updateAccount(Account account,PrintWriter out){
		Boolean b=accountService.updateAllAccount(account);

		if(b){
			out.print("true");
		}else{
			out.print("false");
		}
	}
	
	//多条件查询账务账号信息
	@RequestMapping("/select.action")
	public String selectAccountByCondition(HttpServletRequest request,Model model){
		String acc_idcard=request.getParameter("acc_idcard1");
		String acc_name=request.getParameter("acc_name1");
		String acc_account=request.getParameter("acc_account1");
		String s=request.getParameter("acc_status1");
		
		int acc_status=-1;
		if("全部".equals(s)){
			acc_status=-1;
		}else if("开通".equals(s)){
			acc_status=1;
		}else if("暂停".equals(s)){
			acc_status=2;
		}else if("删除".equals(s)){
			acc_status=0;
		}
		Account account1=new Account();
		account1.setAcc_idcard(acc_idcard);
		account1.setAcc_name(acc_name);
		account1.setAcc_status(acc_status);
		account1.setAcc_account(acc_account);
		model.addAttribute("mo",account1);
		//当前页面数
		int curPage=1;
		//每页记录数
		int pageSize=2;
		//总记录数
		List<Account> la1=accountService.selectAllAccounts(account1);
		int totleSize=la1.size();
		//总页数
		int totlePage=0;
		if(totleSize%pageSize==0){
			totlePage=totleSize/pageSize;
		}else{
			totlePage=totleSize/pageSize+1;
		}
		
		//获取当前页面数
		String s1=request.getParameter("curPage");
		if(s1!=null&&!"0".equals(s1)){
			curPage=Integer.parseInt(s1);
		}else{
			curPage=1;
		}
		//起始记录数
		int start=(curPage-1)*pageSize;
		Map<String,Object> map =new HashMap<String,Object>();
		map.put("account",account1);
		map.put("start",start);
		map.put("pageSize",pageSize);
		List<Account> lacco=accountService.selectAccountByCondition(map);
		model.addAttribute("pageindex",curPage);
		model.addAttribute("p",totlePage);
		model.addAttribute("acc",lacco);
		return "account/account_list";
	}
	
	
}

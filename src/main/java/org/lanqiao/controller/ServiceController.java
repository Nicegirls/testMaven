package org.lanqiao.controller;

import java.io.PrintWriter; 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.servlet.http.HttpServletRequest;

import org.lanqiao.entity.Account;
import org.lanqiao.entity.Fee;
import org.lanqiao.entity.Service;
import org.lanqiao.service.AccountService;
import org.lanqiao.service.FeeService;
import org.lanqiao.service.ServiceService;
import org.lanqiao.util.RegExpValidatorUtils;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/service")
public class ServiceController {

	@Resource
	private ServiceService serviceService;
	@Resource
	private FeeService feeService;
	@Resource
	private AccountService accountService;
	final int PAGE=2 ;
	int tatolPages = 0 ;
	int tatolSizes = 0 ;
	int pageSize   = 0 ;
	int pageIndex = 0 ;
	int startSize = 0 ;
	//查询业务信息，分页及条件查询
	@RequestMapping("/getAllService.action")
	public String selectServiceByCondition(HttpServletRequest request, Model model,String pageIndex) {
		
		try{
			this.pageIndex = Integer.parseInt(pageIndex) ;
		}catch(Exception e){
			this.pageIndex = 1 ;
		}
		
		Service service = new Service();
		String ser_os = request.getParameter("ser_os1") ;
		String ser_ip = request.getParameter("ser_ip1") ;
		String ser_status = request.getParameter("ser_status1") ;
		String acc_idcard = request.getParameter("acc_idcard1"); ;
		String acc_status = request.getParameter("acc_status") ;
		
		if(ser_os==null) {
			ser_os="" ;
		}else{
			ser_os = ser_os.trim() ;
		}
		if(ser_ip==null){
			ser_ip="" ;
		}else{
			ser_ip = ser_ip.trim() ;
		}
		if(ser_status==null || "".equals(ser_status))  ser_status="-1" ;
		if(acc_idcard!=null){
			acc_idcard = acc_idcard.trim() ;
		}
		if(acc_idcard!="" && acc_idcard!=null){
			
			Account account = new Account();
			account.setAcc_idcard(acc_idcard);
			account.setAcc_status(Integer.parseInt(acc_status));
			Account account1 = accountService.selectAccountByIDCard(account);
			if (account1 != null) {
				service.setAcc_id(account1.getAcc_id());
			}else{
				service.setAcc_id(-1);
			}
		}else{
			service.setAcc_id(0);
		}
		
		service.setSer_os(ser_os);
		service.setSer_ip(ser_ip);
		service.setSer_status(Integer.parseInt(ser_status));
		List<Service> ls1 = serviceService.getServiceByCondition(service);
		if(ls1!=null&&ls1.size()>0){
			tatolSizes = ls1.size() ;
			pageSize = PAGE ;
			if(tatolSizes%pageSize==0){
				tatolPages = tatolSizes/pageSize ;
			}else{
				tatolPages = tatolSizes/pageSize+1 ;
			}
			startSize = (this.pageIndex-1)*pageSize ;
		}else{
			tatolPages=0 ;
			this.pageIndex=0;
			startSize=0;
			pageSize=0;
		}
		
	
		
		Map<String,Object> map = new HashMap<String,Object>() ;
		map.put("service", service) ;
		map.put("startSize", startSize) ;
		map.put("pageSize", pageSize);
		List<Service> ls = serviceService.getServiceByPaging(map) ;
		
		model.addAttribute("AllService", ls);
		model.addAttribute("Service", service);
		model.addAttribute("acc_idcard",acc_idcard) ;
		model.addAttribute("pageIndex",this.pageIndex) ;
		model.addAttribute("tatolPages",tatolPages) ;
		return "service/service_list";
	}
	//进入添加界面
	@RequestMapping("/addService.action")
	public String addService(Model model) {
		List<Fee> lf = feeService.getAllFeesByState();
		model.addAttribute("AllFee", lf);
		return "service/service_add";
	}
	//通过身份证号获取账务信息
	@RequestMapping("/getAccountByIdcard.action")
	@ResponseBody
	public Account getAccountByIdcard(String acc_idcard,String acc_status) {
		Account account = new Account();
		if(acc_idcard!=null&&!"".equals(acc_idcard)){
			account.setAcc_idcard(acc_idcard.trim());
		}else{
			account.setAcc_idcard("");
		}
		
		account.setAcc_status(Integer.parseInt(acc_status));
		System.out.println(account.getAcc_idcard());
		Account account1 = accountService.selectAccountByIDCard(account);
		return account1;
	}
	//添加业务信息检查
	@RequestMapping("/checkService.action")
	public void checkService(Service service,String ser_repsw,PrintWriter out){
		int acc_id = service.getAcc_id() ;
		if(acc_id<=0){
			out.print("acc_iderror");
			return ;
		}
		
		Service service1 = serviceService.getServiceByOs(service);
		if(!RegExpValidatorUtils.isAccount(service.getSer_os())){
			out.print("oserror");
			return ;
		}
		if(service1!=null){
			out.print("oshave");
			return ;
		}
		if(!(ser_repsw!=null&&ser_repsw.equals(service.getSer_psw()))){
			out.print("repswerror");
			return ;
		}
		if(!RegExpValidatorUtils.isIP(service.getSer_ip())){
			out.print("iperror");
			return ;
		}
		if(!RegExpValidatorUtils.isPassword(service.getSer_psw())){
			out.print("pswerror");
			return ;
		}
		out.print("yes");
	}
	//添加业务信息
	@RequestMapping("/addService2.action")
	public void addService2(HttpServletRequest request , Service service,String ser_repsw, Model model,PrintWriter out) {
		service.setSer_ip(service.getSer_ip().trim()) ;
		service.setSer_os(service.getSer_os().trim()) ;
		service.setSer_psw(service.getSer_psw().trim()) ;
		boolean b = serviceService.addService(service);
		if (b){
			out.print("yes");
		}else{
			out.print("no");
		}
	}
	//进入修改业务信息界面
	@RequestMapping("/updateService.action")
	public String updateService(Service service, Model model) {
		List<Fee> lf = feeService.getAllFeesByState();
		Service service1 = serviceService.getServiceByID(service);

		model.addAttribute("AllFee", lf);
		model.addAttribute("service", service1);

		return "service/service_modi";
	}
	//修改业务信息
	@RequestMapping("/updateService2.action")
	public void updateService2(Service service, Model model,PrintWriter out) {
		boolean b = serviceService.updateServiceFeeID(service);
		if (b) {
			out.print("yes");
		} else {
			out.print("no");
		}
	}
	//删除业务信息
	@RequestMapping("/deleteService.action")
	public void deleteService(Service service, PrintWriter out) {
		boolean b = serviceService.delServiceByID(service);
		if (b) {
			out.print("" + service.getSer_id());
		} else
			out.print("no");
	}
	//开通业务
	@RequestMapping("/openService.action")
	public void openService(Service service, PrintWriter out) {
		int acc_id=service.getAcc_id();
		Account account=new Account();
		account.setAcc_id(acc_id);
		Account account1=accountService.selectAccountByID(account);
		int acc_status=account1.getAcc_status();
		Boolean b=null;
		if(acc_status==1){
			b = serviceService.openServiceByID(service) ;
			if(b){
				out.print("true") ;
			}else{
				out.print("false");
			}
		}else{
			out.print("false");
		}
	}
	//暂停业务
	@RequestMapping("/stopService.action")
	public void stopService(Service service, PrintWriter out) {
		boolean b = serviceService.stopServiceByID(service);
		if (b) {
			out.print("true");
		} else {
			out.print("false");
		}
	}

	//显示业务信息
	@RequestMapping("/detailService.action")
	public String detailService(Service service, Model model) {
		Service service1 = serviceService.getServiceByID(service);
		model.addAttribute("service", service1);
		return "service/service_detail";
	}
}

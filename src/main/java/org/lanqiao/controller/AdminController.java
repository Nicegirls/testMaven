package org.lanqiao.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.lanqiao.entity.Admin;
import org.lanqiao.entity.Privilege;
import org.lanqiao.entity.Role;
import org.lanqiao.service.AdminService;
import org.lanqiao.util.RegExpValidatorUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/admin")
public class AdminController {

	//验证码部分参数
	private int width = 90;// 定义图片的width
    private int height = 30;// 定义图片的height
    private int codeCount = 4;// 定义图片上显示验证码的个数
    private int xx = 15;
    private int fontHeight = 20;
    private int codeY = 23;
    char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
            'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };

	
	@Resource
	private AdminService adminService;
	//登录功能验证
	@RequestMapping("/login.action")
	public void login(Admin admin,Model modle,String code,PrintWriter out , HttpServletRequest request){
		HttpSession session=request.getSession();
		if("".equals(admin.getAdm_account())||"".equals(admin.getAdm_psw())){
			//modle.addAttribute("errorinfo","用户名或密码为空") ;
			out.print("infonull");
			return ;	
		}
		
		//返回用户的权限信息
		List<Privilege> adminPri = adminService.loginPri(admin);
		//数据库验证，判断此用户是否存在
		if(adminPri.size()<1){
			//modle.addAttribute("errorinfo","用户名或密码错误") ;
			out.print("infoerror");
			return ;
		}
		if (!(code.equalsIgnoreCase(session.getAttribute("code").toString()))) { // 忽略验证码大小写
			//modle.addAttribute("errorinfo","验证码错误") ;
			out.print("infocode");
			return;
		}
		Admin user_info = adminService.showUserInfo(admin);
		session.setAttribute("adminPri",adminPri);
		session.setAttribute("adminPri", adminPri);
		session.setAttribute("user_info", user_info);	//存储主页个人信息显示
		out.print("yes");
	}
	@RequestMapping("/login1.action")
	public String login2(){
		return "index" ;
	}
	//退出
	@RequestMapping("/out")
	public String out(ModelAndView md,HttpServletRequest request){
		request.getSession().invalidate();
		return "../login";
	}
	@RequestMapping("/checkAccount")
	@ResponseBody
	public void checkAccount(Admin admin,PrintWriter out){
		Admin adm_id = adminService.checkAdm_Account(admin);
		if(adm_id==null){
			out.print("no");
			return;
		}
		out.print("yes");
	}
	//显示添加用户角色的名称
	@RequestMapping("/showRole_Name")
	public String showRole_Name(Model model){
		List<Role> role_name = adminService.showRole_Name();
		model.addAttribute("role_name", role_name);
		return "admin/admin_add";
	}
	@RequestMapping("/insertAdmin")
	public String insertAdmin(Admin admin,@RequestParam("file") MultipartFile file, HttpServletRequest request)throws Exception{
		//项目的绝对路径
		String path = request.getServletContext().getRealPath("/");
		//System.out.println(path);
		//获取当前系统时间,插入数据库用户创建时间字段
		Date now = new Date(); 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//可以方便地修改日期格式 
		String hehe = dateFormat.format(now); 
		admin.setAdm_create_time(hehe);
		//用户没有勾选任何角色
		/*if(admin.getLike()==null)
				return "forward:/admin/showRole_Name.action";*/
		String[] like = admin.getLike();
		List<Role> list = new ArrayList<>();
		for(String role_id:like){
			Role role = new Role();
			role.setRole_id(Integer.parseInt(role_id));
			list.add(role);
		}
		//上传文件,电话,email,角色
		 if(!file.isEmpty()){
			admin.setAdm_portrait(admin.getAdm_account()+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")));
			file.transferTo(new File(path+"/img/"+admin.getAdm_account()+file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."))));
		}
		admin.setList(list);
		adminService.insertAdmin(admin);
		int j = adminService.insertAdm_Role(admin);
		if(j>0)
		return "redirect:/admin/showAdmin.action";
		else return "error.jsp";
	}
	//验证管理员是否重复
	@RequestMapping("/checkAdminAccount")
	@ResponseBody
	public void checkAdminAccount(Admin admin,PrintWriter out){
		//判断管理员账号是否重复
		List<Admin> admin1 = adminService.checkAccount();
		for(Admin admin_account:admin1){
			if(admin_account.getAdm_account().equals(admin.getAdm_account())){
				out.println(1);
			}
		}
	}
	//显示用户信息
	@RequestMapping("/showAdmin")
	public String showAdmin(Model model){
		List<Admin> admin = adminService.showAdmin();
		model.addAttribute("admin",admin);
		return "admin/admin_list";
	}
	//显示要修改用户的相关信息，包括所拥有的角色状态
	@RequestMapping("/showUpdateAdmin")
	public String showUpdateAdmin(Model model,Admin admin){
		//System.out.println("####"+admin.getAdm_id());
		//显示所有角色
		List<Role> role_name1 = adminService.showRole_Name();
		model.addAttribute("role_name1", role_name1);
		//这个用户的信息
		Admin adminself = adminService.showUpdateAdmin(admin);
		model.addAttribute("adminself", adminself);
		//这个用户对应的角色ID
		List<Role> role_idself = adminService.showUpdateRole_id(admin);
		//把用户的角色ID号转变为字符串，便于使用字符串的contains方法比较
		String role_id="";
		for(Role rl:role_idself){
			role_id+=rl.getRole_id();
		}
		//System.out.println(role_id);
		model.addAttribute("role_id", role_id);
		return "admin/admin_modi";
	}
	//显示要修改的用户信息
	//更新用户包括其对应的角色信息
	@RequestMapping("/updateAdmin")
	public String updateAdmin(Admin admin){
		//拦截电话号码不能超过11位
		String adm_phonenum = admin.getAdm_phonenum();
		if(adm_phonenum.length()>11)
			return "forward:/admin/showUpdateAdmin.action";
		//拦截email
		if(!RegExpValidatorUtils.isEmail(admin.getAdm_email().trim())){
			return "forward:/admin/showUpdateAdmin.action";
		}
		if(admin.getLike()==null)
			return "forward:/admin/showAdmin.action";
		String[] like = admin.getLike();
		List<Role> list = new ArrayList<>();
		for(String role_id:like){
			Role role = new Role();
			role.setRole_id(Integer.parseInt(role_id));
			list.add(role);
			}
		admin.setList(list);
		//先删除adm_role表中用户对应的角色数据
		adminService.deleteAdm_Role(admin);
		//跟新用户表
		adminService.updateAdmin(admin);
		//重新插入adm_role中
		int a = adminService.insertAdm_Role(admin);
		//System.out.println(a);
		return "redirect:/admin/showAdmin.action";
	}
	@RequestMapping("/deleteAdmin")
	@ResponseBody
	public void deleteAdmin(Admin admin,PrintWriter out){
		//System.out.println(admin.getAdm_id()+"####");
		adminService.deleteAdm_Role(admin);
		int a = adminService.deleteAdmin(admin);
		if(a>0){
			out.print(a);
		}else{
			out.print(0);
		}	
	}
	@RequestMapping("/newAdm_Psw")
	public void newAdm_Psw(int[] arrayAdm_id,PrintWriter out){
		List<Admin> admins=new ArrayList<Admin>();
		for(int adm_id:arrayAdm_id){
			Admin admin=new Admin();
			admin.setAdm_id(adm_id);
			admins.add(admin);
		}
		int a=adminService.newAdm_Psw(admins);
		out.print(a);
	}
	//用户搜索
		@RequestMapping("/getAdminByMap")
		@ResponseBody
		public Map<String,Object> getAdminByMap(Privilege privilege,Admin admin){
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("privilege",privilege);
			map.put("admin", admin);
			List<Admin> admins=adminService.selectAdminByMap(map);
			Map<String,Object> result=new HashMap<String,Object>();
			result.put("admins",admins);
			return result;
		}	
	//个人信息修改验证
	@RequestMapping("/checkUpdateUser.action")
	public void checkUpdateUser(HttpServletRequest request,PrintWriter out){
		String adm_name1=request.getParameter("adm_name");
		String adm_phonenum1=request.getParameter("adm_phonenum");
		String adm_email1=request.getParameter("adm_email");
		String adm_name ="" ;
		String adm_phonenum = "" ;
		String adm_email ="" ;
		if(adm_name1!=null){
			adm_name = adm_name1.trim() ;
		}
		if(adm_phonenum1!=null){
			adm_phonenum = adm_phonenum1.trim() ;
		}
		if(adm_email1!=null){
			adm_email = adm_email1.trim() ;
		}
		if(!RegExpValidatorUtils.isFee_name(adm_name)){
			out.print("name");
			return ;
		}
		if(!RegExpValidatorUtils.isHandset(adm_phonenum)){
			out.print("phonenum");
			return ;
		}
		if(!RegExpValidatorUtils.isEmail(adm_email)){
			out.print("email");
			return ;
		}
		out.print("yes");
	} 
	//主页的“个人信息”修改
	@RequestMapping("/updateUser.action")
	public void updateUser(Admin admin,Model model,PrintWriter out,HttpServletRequest request){
		int a = adminService.updateUser(admin);
		HttpSession session=request.getSession();
		if(a>0){
			Admin admin1=(Admin)session.getAttribute("user_info");
			admin1.setAdm_name(admin.getAdm_name());
			admin1.setAdm_phonenum(admin.getAdm_phonenum());
			admin1.setAdm_email(admin.getAdm_email());
			session.setAttribute("user_info", admin1);
			out.print("yes");
			return ;
		}	
		out.print("no");
	}
	//修改密码验证
	@RequestMapping("/checkUpdatePswUser.action")
	public void checkUpdatePswUser(HttpServletRequest request,HttpSession session,PrintWriter out){
		String oldpsw = request.getParameter("oldpsw") ;
		String newpsw = request.getParameter("newpsw") ;
		String renewpsw=request.getParameter("renewpsw");
		Admin admin = (Admin)session.getAttribute("user_info") ;
		String psw = admin.getAdm_psw() ;
		if(!(oldpsw!=null&&!"".equals(oldpsw)&&psw.equals(oldpsw))){
			out.print("oldpsw");
			return ;
		}
		if(!RegExpValidatorUtils.isPassword(newpsw)){
			out.print("newpsw");
			return ;
		}
		if(!newpsw.equals(renewpsw)){
			out.println("renewpsw");
			return ;
		}
		out.print("yes");
		
	}
	//主页的“密码”修改
	@RequestMapping("/updatePswUser")
	public void updatePswUser(Admin admin,PrintWriter out){
		String oldpsw = admin.getOldpsw();
		String newpsw = admin.getNewpsw();
		String renewpsw = admin.getRenewpsw();
		//System.out.println("#####");
		//查询用户密码是否正确
		Admin admin1 = adminService.selectAdm_Psw(admin);
		//System.out.println(admin1.getAdm_psw()+"#####");
		//如果用户输入的密码正确
		if(admin1.getAdm_psw().equals(oldpsw)){
			//如果两次密码输入相同
			if(newpsw.equals(renewpsw)){
				int a=adminService.updatePswUser(admin);
				if(a>0){
					out.print("yes");
					return ;
				}
				out.print("no");
				return ;
			}
		}else{
			out.print("no");
			return ;
		}	
		out.print("no");
		return ;
	}
	//显示主界面,单独来写比较麻烦所以偷了个懒
	@RequestMapping("/index")
	public String showIndex(){
		return "index";
	}
	//进入个人信息页面
	@RequestMapping("/user_info")
	public String showUser_info(){
		return "user/user_info";
	}
	//进入个人密码修改页面
	@RequestMapping("/user_modi_pwd")
	public String showUser_modi_pwd(){
		return "user/user_modi_pwd";
	}
	
    
    @RequestMapping("/code")
    public void getCode(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // 定义图像buffer
        BufferedImage buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics gd = buffImg.getGraphics();
        // 创建一个随机数生成器类
        Random random = new Random();
        // 将图像填充为白色
        gd.setColor(Color.WHITE);
        gd.fillRect(0, 0, width, height);
        // 创建字体，字体的大小应该根据图片的高度来定。
        Font font = new Font("Fixedsys", Font.BOLD, fontHeight);
        // 设置字体。
        gd.setFont(font);
        // 画边框。
        gd.setColor(Color.BLACK);
        gd.drawRect(0, 0, width - 1, height - 1);
        // 随机产生40条干扰线，使图象中的认证码不易被其它程序探测到。
        gd.setColor(Color.BLACK);
        for (int i = 0; i < 40; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(12);
            int yl = random.nextInt(12);
            gd.drawLine(x, y, x + xl, y + yl);
        }
        // randomCode用于保存随机产生的验证码，以便用户登录后进行验证。
        StringBuffer randomCode = new StringBuffer();
        int red = 0, green = 0, blue = 0;
        // 随机产生codeCount数字的验证码。
        for (int i = 0; i < codeCount; i++) {
            // 得到随机产生的验证码数字。
            String code = String.valueOf(codeSequence[random.nextInt(codeSequence.length-1)]);
            // 产生随机的颜色分量来构造颜色值，这样输出的每位数字的颜色值都将不同。
            red = random.nextInt(255);
            green = random.nextInt(255);
            blue = random.nextInt(255);
            // 用随机产生的颜色将验证码绘制到图像中。
            gd.setColor(new Color(red, green, blue));
            gd.drawString(code, (i + 1) * xx, codeY);
            // 将产生的四个随机数组合在一起。
            randomCode.append(code);
        }
        // 将四位数字的验证码保存到Session中。
        HttpSession session = req.getSession();
        //System.out.print(randomCode);
        session.setAttribute("code", randomCode.toString());
        // 禁止图像缓存。
        resp.setHeader("Pragma", "no-cache");
        resp.setHeader("Cache-Control", "no-cache");
        resp.setDateHeader("Expires", 0);
        resp.setContentType("image/jpeg");
        // 将图像输出到Servlet输出流中。
        ServletOutputStream sos = resp.getOutputStream();
        ImageIO.write(buffImg, "jpeg", sos);
        sos.close();
    }
    //后端添加验证功能
    @RequestMapping("/check.action")
    public void checkAdmin(Admin admin,PrintWriter out){
    	
    }
}

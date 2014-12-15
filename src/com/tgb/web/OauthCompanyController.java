package com.tgb.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tgb.entity.OauthAccessToken;
import com.tgb.entity.OauthCode;
import com.tgb.entity.OauthCompany;
import com.tgb.entity.User;
import com.tgb.json.JsonObject;
import com.tgb.json.JsonUtil;
import com.tgb.json.MD5Tool;
import com.tgb.manager.OauthAccessTokenManager;
import com.tgb.manager.OauthCodeManager;
import com.tgb.manager.OauthCompanyManager;
import com.tgb.manager.UserManager;

@Controller
@RequestMapping("/Oauth")
public class OauthCompanyController {

	@Resource(name="oauthCompanyManager")
	private OauthCompanyManager oauthCompanyManager;
	
	@Resource(name="userManager")
	private UserManager userManager;
	
	@Resource(name="oauthCodeManager")
	private OauthCodeManager oauthCodeManager;
	
	@Resource(name="oauthAccessTokenManager")
	private OauthAccessTokenManager oauthAccessTokenManager;
	
	
	
	private static String access_token;
	private static String expires_in;
	private static JsonObject json = new JsonObject();
	private static  JsonUtil util = new JsonUtil();

	@RequestMapping("/getAlloCompany")
	public String getAlloCompany(HttpServletRequest request){
		
		request.setAttribute("oCompanyList", oauthCompanyManager.getAlloCompany());
		
		return "/index";
	}
	
	@RequestMapping("/checkUid")
	public String checkCid(String uid,HttpServletRequest request){
		
		
		request.setAttribute("flag", oauthCompanyManager.checkCid(uid));
	
		return "/checkUid";
	}
	
	@RequestMapping("/getoCompany")
	public String getoCompany(String id,HttpServletRequest request){
		
		request.setAttribute("oCompany", oauthCompanyManager.getoCompany(id));
	
		return "/editoCompany";
	}
	
	@RequestMapping("/toUserGrant")//用户定向页面
	public String toUserGrant(HttpServletRequest request,HttpServletResponse response,HttpSession session){
		
		request.setAttribute("redirect_uri", request.getParameter("redirect_uri"));
		request.setAttribute("client_id",    request.getParameter("client_id"));
		request.setAttribute("state",        request.getParameter("state"));
		request.setAttribute("scope",        request.getParameter("scope"));
		request.setAttribute("response_type",request.getParameter("response_type"));
		return "/page/oauth/user_Grant";
	}
	
	@RequestMapping("/addoCompany")
	public String addoCompany(OauthCompany oCompany,HttpServletRequest request,HttpServletResponse response,HttpSession session){
	
		    String clientId = geneMD5();
			String secretId= geneMD5(); 
			oCompany.setClient_id(clientId);
			oCompany.setClient_secret(secretId);
		    oauthCompanyManager.addoCompany(oCompany);
		    request.setAttribute("clientId", clientId);
		    request.setAttribute("secretId", secretId);
		    return "/page/oauth/success_feed";
//		}
	}
	
	
	@RequestMapping("/getCodes")
	public void getCodes(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{
		    String errmsg = "success";
		    String id="";
		    String username =  request.getParameter("username");
		    String pwd = request.getParameter("password");
		    String redirect_uri = request.getParameter("redirect_uri");  
		    String client_id = request.getParameter("client_id");     
		    String state = request.getParameter("state");         
		    String scope = request.getParameter("scope");         
		    String response_type = request.getParameter("response_type"); 
		    Boolean b = userManager.IsExistByUserame(username);
		    String code = "";
		    try {
		    	
		    if(b){//用户存在  ，生成code等信息存到数据库
		    	
		    	String dataPwd = userManager.getUserByUsername(username).getPassword();
		    	System.out.println("database -pwd   "+dataPwd);
		    	id = userManager.getUserByUsername(username).getId();
		    	if(dataPwd.equals(pwd)){//登陆成功
		    		
			    	if(StringUtils.isNotEmpty(client_id)&&StringUtils.isNotEmpty(redirect_uri)){//必要信息不为空
			    		OauthCode oauthcode = new OauthCode();
			    		code = System.currentTimeMillis()+"code";
			    		oauthcode.setCode(code);
			    		oauthcode.setClient_id(client_id);
			    		oauthcode.setRedirect_url(redirect_uri);
			    		oauthcode.setResponse_type("code");
			    		oauthcode.setScope("userInfo");
			    		oauthcode.setState(MD5Tool.encoding("normal"));
			    		oauthcode.setUser_id(id);
			    		oauthCodeManager.addoCode(oauthcode);
			    		request.setAttribute("code",  code);
			    		request.setAttribute("redirect_uri",  redirect_uri);
			    		request.setAttribute("client_id",     client_id);
			    		request.setAttribute("state",         oauthcode.getState());
			    		request.setAttribute("scope",         oauthcode.getScope());
			    		request.setAttribute("response_type", oauthcode.getCode());
			    		request.setAttribute("userid", id);
			    	}
		    	}else{
		    		errmsg = "登录失败";
		    	}
		    }else{
		    	errmsg = "用户不存在";
		    }
		   
		    
		    } catch (Exception e) {
				// TODO: handle exception
		    	System.out.println(errmsg);
			}finally{
				System.out.println("errmsg--"+errmsg);
				
			}
		    if(errmsg.equals("success")){
//		    	response.sendRedirect(redirect_uri+"?client_id="+client_id+"&state="+state+"&scope="+scope+"&response_type="+response_type+"&code="+code);
		    	
		    	String url=redirect_uri+"?client_id="+client_id+"&state="+state+"&scope="+scope+"&response_type="+response_type+"&code="+code+"&userid="+id;
//		    	String url ="/yunlu1/Oauth/toGetCodes?client_id="+client_id+"&state="+state+"&scope="+scope+"&response_type="+response_type+"&code="+code+"&userid="+id;
		    	System.out.println(url);
		    	response.sendRedirect(url);
		    }else{
		    	request.setAttribute("redirect_uri",  redirect_uri);
	    		request.setAttribute("client_id",     client_id);
	    		request.setAttribute("state",        state);
	    		request.setAttribute("scope",         scope);
	    		request.setAttribute("response_type", response_type);
	    		request.setAttribute("username", username);
	    		
//	    		return "/page/oauth/user_Grant";
		    }
		   
//		}
	}
	
	@RequestMapping("/toGetCodes")
	public String toGetCodes(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{
		String errmsg = "success";
		String id = request.getParameter("userid");
		String pwd = request.getParameter("password");
		String redirect_uri = request.getParameter("redirect_uri");
		String client_id = request.getParameter("client_id");
		String state = request.getParameter("state");
		String scope = request.getParameter("scope");
		String response_type = request.getParameter("response_type");
		String code = request.getParameter("code");

		request.setAttribute("code", code);
		request.setAttribute("redirect_uri", redirect_uri);
		request.setAttribute("client_id", client_id);
		request.setAttribute("state", state);
		request.setAttribute("scope", state);
		request.setAttribute("response_type", response_type);
		request.setAttribute("userid", id);
		
		    return "/page/oauth/getCodes";
//		}
	}
	
	
	
	@SuppressWarnings("static-access")
	@RequestMapping("/getAccessToken")
	public void getAccessToken(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{
		    String errmsg = "success";
		    String userid = request.getParameter("userid");     
		    String redirect_uri = request.getParameter("redirect_uri");  
		    String client_id = request.getParameter("client_id");     
		    String state = request.getParameter("state");         
		    String scope = request.getParameter("scope");         
		    String grant_type = request.getParameter("grant_type"); 
		    String code =request.getParameter("code"); 
		    String client_secret =request.getParameter("client_secret"); 
		    Boolean b = oauthAccessTokenManager.checkCode(code, client_id, client_secret);
		    if(b==false){//code验证通过,添加accesstoken表信息,并且把accesstoken传递给facebook；
		    	OauthAccessToken accesstoken = new OauthAccessToken();
		    	genericAccessToken(client_id,client_secret);
		    	accesstoken.setClient_id(client_id);
		    	accesstoken.setClient_secret(client_secret);
		    	accesstoken.setCode(code);
		    	accesstoken.setGrant_type(grant_type);
		    	accesstoken.setRedirect_url(redirect_uri);
		    	accesstoken.setUser_id(userid);
		    	accesstoken.setAccess_token(json.getOauthMap().get("access_token"));
		    	accesstoken.setExpires_in(json.getOauthMap().get("Expires_in"));
		    	Date date = new Date();
		    	 GregorianCalendar cal = new GregorianCalendar();
		    	 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    	 
		    	 String createtime = df.format(date);
		    	 
		    	accesstoken.setCreatetime(createtime);
		    	
		    	oauthAccessTokenManager.addoAccessToken(accesstoken);
		    	request.setAttribute("accessToken",  accesstoken.getAccess_token());
	    		request.setAttribute("userid",  userid);
	    		
		    	
		    	response.sendRedirect(redirect_uri+"?accessToken="+accesstoken.getAccess_token()+" and userid="+userid);
		    }else{
		    	errmsg="验证失败";
		    }
		    if(errmsg.equals("success")){
//		    	response.sendRedirect(redirect_uri+"?client_id="+client_id+"&state="+state+"&scope="+scope+"&response_type="+response_type+"&code="+code);
		    	
		    }
//		    return "/page/oauth/getAccessToken";
//		}
	}
	
	
	
	
	@RequestMapping("/getUserInfo")
	public String getUserInfo(HttpServletRequest request,HttpServletResponse response,HttpSession session) throws Exception{
		    String errmsg = "success";
		    String userid = request.getParameter("userid");     
		    String accessTokenJson =request.getParameter("accessToken"); 
		    String accessToken = json.getOauthMap().get("access_token");
		    
		    Boolean b = oauthAccessTokenManager.checkToken(accessToken, userid);
		    if(b){//access验证通过,查询用户信息；
		    	User user = userManager.getUser(userid);
		    	
	    		request.setAttribute("user", user);
		    	
		    	
//		    	response.sendRedirect("/yunlu1/page/oauth/getUserInfo"+"?user="+user);
		    }else{
		    	errmsg="验证失败";
		    }
		    if(errmsg.equals("success")){
//		    	response.sendRedirect(redirect_uri+"?client_id="+client_id+"&state="+state+"&scope="+scope+"&response_type="+response_type+"&code="+code);
		    	
		    }
		    return "/page/oauth/getUserInfo";
//		}
	}
	
	
	
	/**
	 * 生成随机md5码
	 * 
	 * */
	private String geneMD5() {

		String s = String.valueOf((new Random().nextInt(4)));

		return MD5Tool.encoding(s);
	}
	
	public static String getAccessToken(){//取得accesstoken
		Map<String,String> accessTokenMap = new HashMap<String,String>();
		accessTokenMap.put("access_token",json.getOauthMap().get("access_token"));
		accessTokenMap.put("expires_in",json.getOauthMap().get("expires_in"));
		util.put("access_token", accessTokenMap);
		return util.toString();
	}
	
	public static void genericAccessToken(String client_id ,String client_secret) {
		access_token = System.currentTimeMillis()+client_id+client_secret;
		expires_in = "3600";
		json.getOauthMap().put("access_token", access_token);
		json.getOauthMap().put("expires_in",expires_in);
	}
	
	@RequestMapping("/deloCompany")
	public void deloCompany(String id,HttpServletResponse response){
		
		String result = "{\"result\":\"error\"}";
		
		if(oauthCompanyManager.deloCompany(id)){
			result = "{\"result\":\"success\"}";
		}
		
		response.setContentType("application/json");
		
		try {
			PrintWriter out = response.getWriter();
			out.write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/updateoCompany")
	public String updateoCompany(OauthCompany oCompany,HttpServletRequest request){
		
//		if(oauthCompanyManager.updateoCompany(oCompany)){
//			oCompany = oauthCompanyManager.getoCompany(oCompany.getId());
//			request.setAttribute("oCompany", oCompany);
//			return "redirect:/oCompany/getAlloCompany";
//		}else{
//			return "/error";
//		}
		return "";
	}
	
	
}
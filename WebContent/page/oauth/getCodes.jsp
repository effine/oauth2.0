<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/common/common.jsp"%>
<title>注册成功</title>
</head>
<body>
<div class="WB_xline1 oauth_xline" id="outer">
 <div class="oauth_wrap">
    <div class="oauth_header clearfix">
      <h1 class="WB_logo" title="云路"><a href="http://t.yun.lu/">云路</a></h1>
    </div>
    <!-- 带头像  -->
    <div class="WB_panel oauth_main">
    <form name="authZForm" action="/yunlu1/Oauth/getAccessToken" method="post" node-type="form">
      <div class="oauth_content">
        	
        <!-- 登录 -->
        	<div class="oauth_login clearfix">
	          <!-- <form name="authZForm" action="authorize" method="post" node-type="form"> -->
	          	   <input name="scope" id="scope" value="${scope }" type="hidden">
	          	   <input name="code" id="code" value="${code }" type="hidden">
				   <input name="grant_type" value="${response_type }" type="hidden">
	       	       <input name="redirect_uri" value="${redirect_uri }" type="hidden">
	       	       <input name="client_id" value="${client_id }" type="hidden">
	       	       <input name="userid" value="${userid }" type="hidden">
	       	       <input name="state" value="${state} " type="hidden">
	       	       <input name="client_secret" value="C4CA4238A0B923820DCC509A6F75849B" type="hidden">
				   
				   <input name="action" id="action" value="login" type="hidden">
				   <input id="display" name="display" value="default" type="hidden">
				   <input name="withOfficalFlag" id="withOfficalFlag" value="0" type="hidden">
				   <input name="quick_auth" id="quick_auth" value="null" type="hidden">
				   <input name="withOfficalAccount" id="withOfficalAccount" value="" type="hidden">
				   <input name="ticket" id="ticket" value="" type="hidden">
				   <input name="isLoginSina" id="isLoginSina" value="" type="hidden">
				   <input style="position:absolute; top:-9999px" type="submit">
	       	       <input name="appkey62" value="5ymlTu" type="hidden">
	       	       <input name="verifyToken" value="null" type="hidden">
	       	       <input name="from" value="" type="hidden">
				
						<div>
						  <input type="submit" name="sub" id="sub" value="我是第三方，点击请求accesstoken.">
						   
						</div>
				<!-- </form> -->
				<div class="tips WB_tips_yls WB_oauth_tips" node-type="tipBox" style="display:none">
					<span class="WB_tipS_err"></span><span class="WB_sp_txt" node-type="tipContent"></span>
					<span class="arr" node-type="tipArrow"></span>
					<a href="javascript:;" class="close" node-type="tipClose"></a>
				</div>
        </div>
        <div class="oauth_login_box01 clearfix">
          <div class="oauth_login_submit">
              <p class="oauth_formbtn"><a node-type="submit" tabindex="4" action-type="submit" href="javascript:;" class="WB_btn_login formbtn_01"></a><a node-type="cancel" tabindex="5" href="javascript:;" action-type="cancel" class="WB_btn_cancel"></a></p>
          </div>
          <!-- todo 添加appkey 白名单判断 -->
     
         </div>
        <!-- /登录 --> 
      </div>
      </form>
    </div>
    <!-- /带头像 -->
    <!-- 根据域名修改文案 -->
    	
    	</div>
  </div>
<script type="text/javascript" src="%E7%BD%91%E7%AB%99%E8%BF%9E%E6%8E%A5%20-%20%E5%AE%89%E6%99%BA%E8%AE%BA%E5%9D%9B_files/oauth2Web.js"></script>
<script type="text/javascript">
	(function() {
	if(self !== top) {
	var img = new Image();
	var src = 'https://api.weibo.com/oauth2/images/bg_layerr.png?oauth=1&page=web&refer=' + document.referrer + '&rnd=' + (+new Date());
	img.src = src
	img = null; //释放局部变量
	}
	})();
</script>

 
</body>
</html>
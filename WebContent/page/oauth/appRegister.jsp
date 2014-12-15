<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage="" %>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ut-8">
<%@ include file="/common/common.jsp"%>
<title>应用开发者注册</title>
<script type="text/javascript">
  $(document).ready(function(){
		$("#userRegisterForm").validate();	
	});
</script>
</head>
<body>
<form name="userRegisterForm" id="userRegisterForm" method="post" action="/yunlu1/Oauth/addoCompany" onsubmit="" class="">
<table width="80%"  border="0" align="center" cellpadding="2" cellspacing="0" >
<caption>
<font color="blue" style="font-size: 20px">应用开发者注册</font><br></caption>
  <tr bgcolor="#EFEFEF">
    <td width="25%" align="right">公司全称：</td>
    <td width="30%" valign="bottom">
      <input name="company_name"type="text" id="company_name" onblur="checkUid()"  maxlength="255"  class="validate[required],length[3,255]]"></td>
  </tr>
  <tr bgcolor="#EFEFEF">
    <td width="25%" align="right">公司网址：</td>
    <td width="30%" valign="bottom">
      <input name="company_url"type="text" id="company_url"   maxlength="255"  class="validate[required],length[3,255]]"></td>
  </tr>
  <tr><td valign="middle" align="right">电子邮件:</td>
    <td><input name="email" id="email" type="text" size="20" maxlength="50" class="validate[required,custom[email]] text-input"></td>
  </tr>
  <tr bgcolor="#EFEFEF">
    <td align="right">联系电话:</td>
    <td><input name="tel" type="text" id="telphone" size="20" maxlength="50"></td>
  </tr>
   
   <!--<tr>
    <td align="right">验证码:</td>
    <td><input type="text" name="rand" id="rand" size="15"><img alt="code..." name="randImage" id="randImage" src="resource/image.jsp" maxlength="50"  size="20" height="20" border="1" align="absmiddle"/><a href="javascript:loadimage();"><font class=pt95>看不清点我</font></a></td>
    <td>&nbsp;</td>
  </tr>
   -->
  
  <tr>
    <td colspan="3" align="center">
      <input type="submit" name="Submit" value="提交">
	</td>
  </tr>
  <input type="hidden" id="validateCode" name="validateCode" value="1234"/>
</table>
</form>
</body>
</html>
<script language="javascript">
	
	function checkUid(){
		var name=document.userRegisterForm.company_name.value;
		if(name.length>0){
			window.open("/yunlu1/Oauth/checkCid?uid=" +name ,"检查公司名","toolbar=no, location=no,status=no,menubar=no, scrollbars=no,resizable=no,width=300,height=200");
		}
	}
	
   function loadimage(){ 
    document.getElementById("randImage").src = "resource/image.jsp?"+Math.random(); 
   } 
   
   
   
</script>


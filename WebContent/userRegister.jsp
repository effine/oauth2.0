<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);//设置缓存时间 
 %>

<meta http-equiv="Content-Type" content="text/html; charset=ut-8">
<%@ include file="/common/common.jsp"%>
<title>用户注册</title>
<script type="text/javascript">
  $(document).ready(function(){
		$("#userRegisterForm").validate();	
	});
</script>
</head>
<body>
<form name="userRegisterForm" id="userRegisterForm" method="post" action="/yunlu_reg/user/addUser" onsubmit="" class="">
<table width="80%"  border="0" align="center" cellpadding="2" cellspacing="0" >
<caption>
<font color="blue" style="font-size: 20px">用户注册</font><br></caption>
  <tr bgcolor="#EFEFEF">
    <td width="25%" align="right">用户名:</td>
    <td width="30%" valign="bottom">
      <input name="uid"type="text" id="uid" size="20" maxlength="50"  class="validate[required],length[3,18]]"></td>
    <td width="45%">*
        <input name="checkUser" type="button" value="查看是否被占用" onclick="checkUid();">
    </td>
  </tr>
  <tr bgcolor="#EFEFEF">
    <td colspan="3">(用户名由a～z的英文字母(不区分大小写)、0～9的数字、点、减号或下划线组成，长度为3～18个字符，只能以数字或字母开头和结尾,例如:syjk3_001 )</td>
  </tr>
  <tr><td>密　码:</td>
    <td><input name="password" type="password" id="password" size="20" maxlength="50" class="validate[required],length[6,16]]"></td>
    <td>*(密码长度为6～16位，区分字母大小写。登录密码可以由字母、数字、特殊字符组成。)</td>
  </tr>
  <tr bgcolor="#EFEFEF">
    <td height="40" valign="middle">密码确认:</td>
    <td><input name="confirmPassword" type="password" id="confirmPassword" size="20" class="validate[required,confirm[password]] text-input" maxlength="50" ></td>
    <td>*(请再输一遍，以便确认！) </td>
  </tr>
  <tr><td valign="middle">电子邮件:</td>
    <td><input name="email" id="email" type="text" size="20" maxlength="50" class="validate[required,custom[email]] text-input"></td>
    <td>*(请您输入正确的E-mail地址！<FONT color=#cc0000>方便您的密码查询</FONT>！)</td>
  </tr>
  <tr bgcolor="#EFEFEF"><td align="right">性　别:</td>
    <td><p> <label><input type="radio" name="gender" value="1" checked>男</label>
        <label><input type="radio" name="gender" value="0">女</label><br>
    </p></td>
    <td>&nbsp</td>
  </tr>
  <tr>
    <td align="right" valign="middle"><div align="right">密码提示问题:</div></td>
    <td > 
    <select id="question" width="213"  class="validate[required]" name="question" >
      <option value="">安全提问</option>
      <option value="母亲的名字">母亲的名字</option>
      <option value="爷爷的名字">爷爷的名字</option>
      <option value="父亲出生的城市">父亲出生的城市</option>
      <option value="你其中一位老师的名字">你其中一位老师的名字</option>
      <option value="你个人计算机的型号">你个人计算机的型号</option>
      <option value="你最喜欢的餐馆名称">你最喜欢的餐馆名称</option>
      <option value="驾驶执照最后四位数字">驾驶执照最后四位数字</option>
    </select>
    </td>
    <td>*(帐号验证以及用于帮你找回密码！)</td>
  </tr>
  <tr bgcolor="#EFEFEF">
    <td valign="middle"><div align="right">提示问题答案:</div></td>
    <td ><input name="answer" type="text"  class="validate[required]" size="20" maxlength="50"></td>
    <td bgcolor="#EFEFEF">*(找回密码的答案！)</td>
  </tr>
  <tr>
    <td align="right">真实姓名:</td>
    <td><input name="realName" type="text"id="realName" class="validate[required]" size="20" maxlength="50"></td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#EFEFEF">
    <td align="right">联系电话:</td>
    <td><input name="tel" type="text" id="telphone" size="20" maxlength="50"></td>
    <td>&nbsp;</td>
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
	function checkForm(form){
		if(isEmpty(form.uid.value) || isEmpty(form.password.value) || isEmpty(form.confirmPassword.value) || isEmpty(form.email.value) || isEmpty(form.question.value) || isEmpty(form.answer.value) ){
			alert("请将必填项填写完整!");
			return false;
		}
		if(form.password.value!=form.confirmPassword.value){
			alert("两次密码不匹配!");
			return false;
		}
		if(form.password.value.length<6 || form.password.value.length>16){
			alert("密码长度不得少于6个字符，不得多于16个字符！");
			return false;
		}
		var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        if(!myreg.test(document.getElementById("email").value)){
            alert('提示\n\n请输入有效的E_mail！');
            return false;   
        }
        
        
		return true;
	}
	
	function checkPwd(){
	    if(document.getElementById("password").value!=document.getElementById("confirmPassword").value){
			alert("两次密码不匹配!");
			document.getElementById("confirmPassword").focus();
		}
	
	}
	function isEmpty(str){
		if(str==null || str.length==0)
			return true;
		else 
			return false;
	}
	function checkUid(){
		var name=document.userRegisterForm.uid.value;
		if(name.length>0){
			window.open("/yunlu_reg/user/checkUid?uid=" +name ,"检查用户名","toolbar=no, location=no,status=no,menubar=no, scrollbars=no,resizable=no,width=300,height=200");
		}
	}
	function checkEmail(){
	      var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
          if(!myreg.test(document.getElementById("email").value)){
               alert('提示\n\n请输入有效的E_mail！');
               myreg.focus();
               return false;
          }else{
               return true;
          }
    }
   
   function loadimage(){ 
    document.getElementById("randImage").src = "resource/image.jsp?"+Math.random(); 
   } 
   
   
   
</script>


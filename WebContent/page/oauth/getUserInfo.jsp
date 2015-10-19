<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.effine.model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/common/common.jsp"%>
<title>Insert title here</title>
</head>
<body>
<div>
<li>获取到的用户信息</li>
</div>
<div>
<li>用户名:<c:out value="${user.username }"></c:out></li>
</div>
<div>
<li>邮箱:<c:out value="${user.email }"></c:out></li>
</div>

</body>
</html>
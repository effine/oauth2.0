<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="../js/jquery-1.7.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function del(id){
		$.get("/yunlu_reg/user/delUser?id=" + id,function(data){
			if("success" == data.result){
				alert("删除成功");
				window.location.reload();
			}else{
				alert("删除失败");
			}
		});
	}
</script>
</head>
<body>
	<h6><a href="/yunlu_reg/user/toAddUser">添加用户</a></h6>
	<table border="1">
		<tbody>
			<tr>
				<th>用户名</th>
				<th>真实姓名</th>
				<th>性别</th>
				<th>邮箱</th>
				<th>电话</th>
				<th>-</th>
				
			</tr>
			<c:if test="${!empty userList }">
				<c:forEach items="${userList }" var="user">
					<tr>
						<td>${user.uid }</td>
						<td>${user.realName }</td>
						<td>      
						<c:if test="${user.gender eq 1}">男</c:if>
						<c:if test="${user.gender eq 0}">女</c:if>
						</td>
						<td>${user.email }</td>
						<td>${user.tel }</td>
						<td>
							<a href="/yunlu_reg/user/getUser?id=${user.id }">编辑</a>
							<a href="javascript:del('${user.id }')">删除</a>
						</td>
					</tr>				
				</c:forEach>
			</c:if>
		</tbody>
	</table>
</body>
</html>
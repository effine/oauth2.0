<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="page" content="<%=request.getServletPath()%>">
<link rel="stylesheet" href="js/vat1.css" type="text/css" media="screen" title="no title" charset="utf-8" />
<link rel="stylesheet" href="js/vat2.css" type="text/css" media="screen" title="no title" charset="utf-8" />

<script src="js/jquery.js"></script>
<script src="js/jquery.validationEngine.js"></script>



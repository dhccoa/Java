<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.* ,java.text.SimpleDateFormat,entity.Climber"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>统计表</title>
<style type="text/css">

html{margin:0px;height:100%;} 
body,div{margin:0px;padding:0px;font-family:Tahoma, Microsoft YaHei;  -webkit-font-smoothing: antialiased; -webkit-text-stroke-width: 0.2px;-moz-osx-font-smoothing: grayscale;}
html ,body { margin:0px ; padding:0px; height: 100%;width:100% }
.submitTB{ background:#999}
.submitTB th{ background:#FFF; line-height:45px; height:45px; text-align:center; padding:0px 10px 0px 0px}

.submitTB td{ background:#FFF; line-height:45px; height:45px;text-align:left; padding:0px 0px 0px 10px}
</style>
</head>

<body>

<table width="100%" border="0" class="submitTB" cellpadding="1" cellspacing="1" >
  <tr>
    <th>姓名</th>
    <th>部门</th>
    <th>身份证号</th>
    <th>手机号</th>
  </tr>
  <c:forEach items="${climbers}" var="climber" varStatus="s">
  <tr>
    <td>${climber.name }&nbsp;</td>
    <td>${climber.dept }&nbsp;</td>
    <td>${climber.ID_num }&nbsp;</td>
    <td>${climber.phone }&nbsp;</td>
  </tr>
   </c:forEach>
 
</table>


 
</body>
</html>
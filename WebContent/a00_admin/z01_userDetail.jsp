<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>
<jsp:useBean id="service" class="plo.web.admin.service.UserManagerService"/>
<c:set var="user" value="${service.userInfo(param.no)}"/>
{
	"u_no":"${user.u_no}",
	"u_id":"${user.u_id}",
	"u_pass":"${user.u_pass}",
	"u_name":"${user.u_name}",
	"u_mail":"${user.u_mail}",
	"u_date":"${user.u_date}"
}
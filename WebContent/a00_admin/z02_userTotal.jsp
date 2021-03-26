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
<c:set var="userList" value="${service.getUserTotal()}"/>
{
	"idList":[
		<c:forEach var="user" items="${userList}" varStatus="sts">
			"${user.u_id}"
			<c:if test="${!sts.last}">,</c:if>
		</c:forEach>
	]
}
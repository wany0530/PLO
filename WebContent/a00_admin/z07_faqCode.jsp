<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>
<jsp:useBean id="service" class="plo.web.admin.service.FaqManagerService"/>
<c:set var="codeList" value="${service.getFaqCode()}"/>
{
	"codeList":[
		<c:forEach var="code" items="${codeList}" varStatus="sts">
		{
			"fc_no":${code.fc_no},
			"fc_name":"${code.fc_name}"
		}
		<c:if test="${!sts.last}">,</c:if>
		</c:forEach>		
	]
}
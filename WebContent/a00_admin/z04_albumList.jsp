<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>
<jsp:useBean id="service" class="plo.web.admin.service.AlbumManagerService"/>
<c:set var="albumList" value="${service.getAlbumList()}"/>
{
	"albumList":[
		<c:forEach var="album" items="${albumList}" varStatus="sts">
		{
			"alb_no":${album.alb_no},
			"alb_name":"${album.alb_name}"
		}
		<c:if test="${!sts.last}">,</c:if>
		</c:forEach>		
	]
}
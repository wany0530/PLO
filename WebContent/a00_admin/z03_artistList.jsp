<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>
<jsp:useBean id="service" class="plo.web.admin.service.ArtistManagerService"/>
<c:set var="artList" value="${service.getArtistList()}"/>
{
	"artList":[
		<c:forEach var="artist" items="${artList}" varStatus="sts">
		{
			"art_no":${artist.art_no},
			"art_name":"${artist.art_name}"
		}
		<c:if test="${!sts.last}">,</c:if>
		</c:forEach>		
	]
}
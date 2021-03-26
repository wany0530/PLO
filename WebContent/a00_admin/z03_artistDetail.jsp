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
<c:set var="artist" value="${service.artistDetail(param.no)}"/>
{
	"art_no":"${artist.art_no}",
	"art_name":"${artist.art_name}",
	"art_gender":"${artist.art_gender}",
	"art_group":"${artist.art_group}",
	"art_img":"${artist.art_img}"
}
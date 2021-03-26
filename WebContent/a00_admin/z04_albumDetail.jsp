<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% request.setCharacterEncoding("UTF-8");
   String path = request.getContextPath();
%>
<jsp:useBean id="service" class="plo.web.admin.service.AlbumManagerService"/>
<c:set var="album" value="${service.albumDetail(param.no)}"/>
{
	"alb_no":"${album.alb_no}",
	"alb_name":"${fn:trim(album.alb_name)}",
	"alb_shape":"${fn:trim(album.alb_shape)}",
	"alb_date":"${album.alb_date}",
	"alb_img":"${fn:trim(album.alb_img)}",
	"alb_intro":"${fn:trim(album.alb_intro)}",
	"art_no":"${album.art_no}"
}
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z01_vo.*"
    import="jspexp.a03_database.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>   
<fmt:requestEncoding value="utf-8"/> 

<%-- <jsp:useBean id="mds" class="plo.web.musicdetail.service.MusicDetailService"></jsp:useBean>
<c:set var="music" value="${mds.getMusicDetail(param.m_no)}"/>--%>

{
	"m_no":${music.m_no}, 
	"m_name":"${music.m_name}",
	"m_path":"${music.m_path}",
	"alb_no":${music.alb_no},
	"alb_name":"${music.alb_name}",
	"art_no":${music.art_no},
	"art_name":"${music.art_name}"
}
	
	
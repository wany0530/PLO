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
<jsp:useBean id="service" class="plo.web.admin.service.NoticeManagerService"/>
<c:set var="notice" value="${service.noticeDetail(param.no)}"/>
{
	"n_no":"${notice.n_no}",
	"n_title":"${notice.n_title}",
	"n_content":"${notice.n_content}",
	"n_date":"${notice.n_date}",
	"n_pub":"${notice.n_pub}"
}
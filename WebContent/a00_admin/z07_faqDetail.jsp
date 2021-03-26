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
<jsp:useBean id="service" class="plo.web.admin.service.FaqManagerService"/>
<c:set var="faq" value="${service.faqDetail(param.no)}"/>
{
	"f_no":"${faq.f_no}",
	"f_title":"${faq.f_title}",
	"f_content":"${faq.f_content}",
	"f_pub":"${faq.f_pub}",
	"fc_no":"${faq.fc_no}",
	"fc_name":"${faq.fc_name}"
}
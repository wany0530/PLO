<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>

<!--default.css -->
<link rel="stylesheet" href="${path}/z01_css/default.css">

<!-- jquery -->
<script src="${path}/z02_js/jquery-3.5.1.js"></script>
<style>
#app {
	padding-bottom: 110px;
}
#wrap {
	width: 100%;
	min-width: 955px;
	max-width: 1600px;
	height: 100%;
	margin: 0 auto;
}
#notice-wrapper {
	padding: 95px 80px 40px 80px;
}

#notice-wrapper #content-top {
	text-align: center;
	margin-bottom: 40px;
}

#notice-wrapper #content-top #title {
	margin: 30px 0;
	font-size: 30px;
	color: #333333;
	font-weight: 700;
}

#notice-wrapper #content-top li {
	display: inline-block;
	height: 32px;
	box-sizing: border-box;
	border-radius: 16px;
	padding: 0 15px 0 15px;
	width: 87px;
	line-height: 34px;
	font-size: 16px;
	text-aline: center;
	vertical-align: top;
}

#notice-wrapper #content-top .select {
	background: #ff8533;
	color: #ffffff;
}

#notice-wrapper #content-top .unSelect:hover {
	color: #ff8533;
}

#notice-wrapper #content-top #link-btn {
	font-size: 16px;
	font-weigth: 400;
}

#notice-wrapper #content-main {
	margin-bottom: 30px;
}

#notice-wrapper #content-main table {
	border-collapse: collapse;
	border-spacing: 2px 2px;
	text-align: left;
	font-size: 13px;
	width: 100%;
}

#notice-wrapper #content-main thead tr {
	color: #A0A0A0;
	border-top: 1px solid #EBEBEB;
	border-bottom: 1px solid #EBEBEB;
}

#notice-wrapper #content-main thead th {
	padding: 15px 0;
}

#notice-wrapper #content-main tbody {
	font-size: 16px;
}
#notice-wrapper #content-main tbody .title {
	font-size: 15px;
	color: #333333;
}
#notice-wrapper #content-main tbody .title td {
	padding-top: 30px;
	padding-bottom: 30px;
	border-bottom: 1px solid #f6f6f6;
	line-height: 20px;
}

#notice-wrapper #content-main tbody .content div {
	padding: 10px 0 30px 60px;
	line-height: 20px;
	font-size: 14px;
	background: #fafafa;
}
#notice-wrapper #content-main .ed-button { 
	background: #ffffffff;
	border: none;
	font-size: 12px;
	font-weight: bold;
	outline: none;
	cursor: pointer;
}

#notice-wrapper .center {
	text-align: center;
}

#notice-wrapper .pl-25 {
	padding-left: 25px;
}

#notice-wrapper #page-btn {
	text-align: center;
	margin-bottom: 30px;
}
#notice-wrapper #page-btn button {
	outline: none;
	border-radius: 100%;
	border: none;
	width: 32px;
	height: 32px;
	background: #ffffffff;
	cursor: pointer;
	color: gray;
}

</style>
</head>
<body>
	
	<div id="app">
	<!-- nav -->
	<div>
		<%@ include file="../a01_main/header.jsp" %>
	</div>
	
	<div id="wrap">
	<!-- Page Wrapper -->
	<div id="notice-wrapper">
		
		<!-- content-top -->
		<div id="content-top">
			<h1 id="title">고객센터</h1>
			
			<div id="link-btn">
				<ul>
					<li class="select">공지사항</li>
					<li class="unSelect"><a href="${path}/faq">FAQ</a></li>
				</ul>
			</div>
		</div>
		<!-- End of content-top -->
		
		<!-- content-main -->
		<div id="content-main">
			
			<table>
			
				<colgroup>
					<col width="42">
					<col width="*">
					<col width="100">
					<col width="90">
				</colgroup>
				
				<thead>
					<tr>
						<th class="center">번호</th>
						<th style="padding-left: 20px;">제목</th>
						<th class="center">작성일</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="notice" items="${list}">
					<tr class="title" id="title${notice.n_no}">
						<td class="center">${notice.n_no}</td>
						<td class="pl-25" id="d_title${notice.n_no}">${notice.n_title}</td>
						<td class="center">${notice.n_date}</td>
						<td class="center">
							<input type="button" value="⋀" id="button${notice.n_no}" class="ed-button"
								onclick="detail(n_no${notice.n_no}, 
												button${notice.n_no},
												title${notice.n_no},
												d_title${notice.n_no})">
						</td>
					</tr>
					<tr class="content" id="n_no${notice.n_no}" class="content">
						<td colspan="4">
							<div>
								${notice.n_content}
							</div>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
		<!-- End of content-main -->
		
		<!-- page button -->
		<div id="page-btn">
			<c:set var="page" value="${(empty param.p)?1:param.p}" />
			<c:set var="startNum" value="${page-(page-1)%5}"/>
			<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(cnt/10), '.')}"/>
			
			<!-- previous -->
			<button type="button" ${(startNum <= 1)?'disabled':''} 
				onclick="paging(${startNum-1})">
				<i class="fas fa-chevron-left"></i>
			</button>
			
			<c:forEach begin="${startNum}" end="${startNum+4}" varStatus="status">
				<c:if test="${lastNum >= status.current}">
				<button onclick="paging(${status.current})" class="pBtn"
					style="background: ${(page)==(status.current)?'#ff8533':''};
							color: ${(page)==(status.current)?'white':''}">
					${status.index}
				</button>
				</c:if>
			</c:forEach>
			
			<!-- next -->
			<button type="button" ${(lastNum <= startNum+4)?'disabled':''} 
				onclick="paging(${startNum+5})"> 
				<i class="fas fa-chevron-right"></i>
			</button>
			
		</div>
		
		<div>
			<%@ include file="../a01_main/footer.jsp" %>
			<%@ include file="../a09_playList/musicplayer.jsp" %>
		</div>
		
	</div>
	</div>
	</div>
	<!-- End of Page Wrapper -->
	
	<script>
		$('.content').css('display', 'none');
		$('.ed-button').val('⋀');
		$('.n_title').css('background','white');
		$('.pl-25').css('color', '#333333');
		function detail(content, button, title, d_title){
			$('.pl-25').css('color', '#333333');
			$('.title').css('background', 'white');
			var sts = $(content).css("display");
			if(sts == 'none'){
				$('.content').css('display', 'none');
				$(content).css("display", "table-row");
				$(button).val('⋁');
				$(title).css('background', '#fafafa');
				$(d_title).css('color', '#ff8533');
			}
			else {
				$(content).css("display", "none");
				$(button).val('⋀');
				$(title).css('background', 'white');
				$(d_title).css('color', '#333333');
			}
		}
		function paging(page){
			location.href="?p="+page;
		}
	</script>
</body>
</html>
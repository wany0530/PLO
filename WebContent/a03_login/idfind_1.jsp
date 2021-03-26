<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" />   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLO</title>
<style>
a{ 	text-decoration:none;  color:black; color: inherit}
ul{list-style: none;}
.signin_content{
	margin:0 auto;	height:1000px;	}
#box{
	margin : 0 auto;	margin-top : 150px; margin-bottom : 500px; width : 620px;	height : 430px;	border : 1px solid lightgray;	}
#title{
	width : 200px; margin-left : 210px;	text-align : center; margin-top : 75px;	font-size : 30px;	font-weight : bold;}
#idfindTable{
	width : 400px;	height : 220px;	margin-top: 40px; margin-left : 110px; font-size:14px;}		
#idfindTable td{
	padding : 5px; }
.name, .mail{
	box-shadow : 0px; width : 390px; height: 40px; border-bottom :1px solid lightgray;	border-top : none;	border-left : none;	border-right : none; font-size:13px; }
.name:focus, .mail:focus{
	outline : none; } 
#idfindBtn{
	width : 400px;	height : 50px;	background-color : #FF8533;	border : none; color : #000;}
#idfindBtn[type=submit]{
	color : #fff; font-weight : bold;
}
#idfindBtn:focus{
	outline : none; }
</style>
<script type="text/javascript" src="${path}/z02_js/jquery-3.5.1.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
      $("#idfindBtn").click(function(){
    	  location.href="${path}/a03_login/idfind_2.jsp";
      })
   });
</script>
</head>
<body>
	<%@ include file="../a01_main/header.jsp" %>
	<div class="signin_content">
			
		<div id="box">
			<div id="title">아이디 찾기</div>
			<form method="post">  <%-- action="<%=request.getContextPath()%>/idfind.do" --%>
				<table id="idfindTable" >	
					<tr><td><input class="name" type="text" name="name" placeholder="&nbsp;이름"></td></tr>
					<tr><td><input class="mail" type="password" name="mail" placeholder="&nbsp;이메일주소"></td></tr>	
					<tr><td><input id="idfindBtn" type="submit" value="아이디 찾기" ></td></tr>
				</table>
			</form>		
		</div>		
	</div>
	<%@ include file="../a01_main/footer.jsp" %>
	<%@ include file="../a09_playList/musicplayer.jsp" %>
</body>
</html>